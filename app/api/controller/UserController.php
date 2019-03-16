<?php
namespace app\api\controller;

use app\admin\model\AppointmentModel;
use app\admin\model\ArticleModel;
use app\admin\model\HallModel;
use app\api\model\CommentModel;
use app\api\model\PraiseModel;
use FontLib\Table\Type\name;
use think\Db;
use app\api\model\UserModel;
use app\api\model\GxzhMoneyLogModel;
use Yansongda\Pay\Pay;
use Yansongda\Pay\Log;
use app\api\common\UploadImg;

class UserController extends ApiBaseController
{
    public function initialize()
    {
        if (empty($this->user)) {
            $this->error(['code' => 10001, 'msg' => '登录已失效!']);
        }
        $this->UserModel = new UserModel();
        $this->GxzhMoneyLogModel = new GxzhMoneyLogModel();
    }
    //获取用户信息
    public function get_user_info()
    {
        $user = new UserModel();
        $userinfo = $user->where('id', $this->userId)->select();
        $this->success("获取成功!", $userinfo[0]);
    }
    //修改用户信息
    public function set_user_info()
    {
        $request = $this->request->param();
        $user = new UserModel();
        $user->save([
            'name'  => isset($request['name']) ? $request['name'] : '',
            'nick_name' => isset($request['nick_name']) ? $request['nick_name'] : ''
        ],['id' => $this->userId]);
        $this->success("更改成功!");
    }
    public function logout()
    {
        Db::name('ylt_user')->where([
            'id'     => $this->userId
        ])->update(['token' => null]);

        $this->success("退出成功!");
    }
    public function upload()
    {
        $file   = $this->request->file('file');
        $result = $file->validate([
            //'ext'  => 'jpg,jpeg,png',
            //'size' => 1024 * 1024
        ])->move(WEB_ROOT . 'upload' . DIRECTORY_SEPARATOR . 'gxzh' . DIRECTORY_SEPARATOR);
        if ($result) {
            $saveName = str_replace('//', '/', str_replace('\\', '/', $result->getSaveName()));
            $path = '/upload/gxzh/'.$saveName;
            //amr转mp3
            if($result->getExtension()=='amr'){
                $status = null;
                $path2 = explode('.', $path)[0];
                system("ffmpeg -i ".WEB_ROOT."{$path2}.amr ".WEB_ROOT."{$path2}.mp3", $status);
                if( $status ){
                    $this->error('转换失败');
                } else {
                    $path = $path2.'.mp3';
                }            
            }
            $this->success("成功!",['path'=>$path,'url'=>$this->request->domain().$path]);
        } else {
            $this->error($file->getError());
        }
    }
    public function withdraw()
    {
        //申请提现
        $data = $this->request->param();
        //最小提现金额
        $withdrawAmount = get_config('withdrawAmount');
        if ($withdrawAmount>$data['money']){
            $this->error("最小提现金额{$withdrawAmount}元");
        }
        //手续费
        $ratio = get_config('withdraw');
        if (empty($ratio)){
            $this->error("申请失败,请重试!");
        }
        $ratio = round($ratio/100,2);
        $fee = $data['money'] * $ratio;
        $balance = $data['money']-$fee;
        //提现姓名，账号，金额
        $withdrawdata = [
            'trade_sn' => 'withdraw_'.$this->userId.'_'.date('YmdHis'),
            'uid' => $this->userId,
            'withdraw_realname' => $data['withdraw_realname'],
            'withdraw_account' => $data['withdraw_account'],
            'money' => $data['money'],
            'balance' => $balance,
            'fee' => $fee,
            'remarks' => "提现{$data['money']}元,手续费{$fee}元,手续比例{$ratio}",
            'created_at' => time(),
        ];

        $result = Db::name("gxzh_withdraw")->insertGetId($withdrawdata);

        if (empty($result)) {
            $this->error("失败,请重试!");
        }
        $this->success("提交成功，请等待审核!");
    }
    public function refund()
    {
        //申请退款
        $data = $this->request->param();
        
        $delay_days = get_config('delay_days');
        $answerinfo = Db::name("gxzh_answer")->where(['out_trade_no'=>$data['out_trade_no']])->find();
        if($answerinfo['endtime']<time()-$delay_days*86400){
            $this->error("已过退款期!");
        }

        $refunddata = [
            'trade_sn' => 'refund_'.$this->userId.'_'.date('YmdHis'),
            'uid' => $this->userId,
            'money' => $data['money'],
            'reason' => $data['reason'],
            'imgs' => !empty($data['imgs'])?$data['imgs']:'',
            'out_trade_no' => !empty($data['out_trade_no'])?$data['out_trade_no']:'',
            'created_at' => time(),
        ];

        $result = Db::name("gxzh_refund")->insertGetId($refunddata);

        if (empty($result)) {
            $this->error("失败,请重试!");
        }
        $this->success("提交成功，请等待审核!");
    }
    public function recharge()
    {
        //充值
        $data = $this->request->param();

        $out_trade_no = 'recharge'.'_'.$this->userId.'_'.time();
        $orderData = [
            'uid' => $this->userId,
            'out_trade_no' => $out_trade_no,
            'money' => $data['amount'],
            'pay_type' => $data['pay_type'],
            'created_at' => time(),
        ];
        Db::name("gxzh_order")->insertGetId($orderData);

        if($data['pay_type']=='alipay'){
            //alipay
            $order = [
                'out_trade_no' => $out_trade_no,
                'total_amount' => $data['amount'],
                'subject'      => '充值',
            ];
            
            $orderInfo = Pay::alipay($this->alipay_config)->app($order)->getContent();
            $this->success("",['orderInfo' => $orderInfo]);
        }

        if($data['pay_type']=='wechat'){
            $order = [
                'out_trade_no' => $out_trade_no,
                'body' => '充值',
                'total_fee' => $data['amount']*100,
            ];
            
            $orderInfo = Pay::wechat($this->wxpay_config)->app($order)->getContent();
            $this->success("",['orderInfo' => json_decode($orderInfo,true)]);
        }
        if($data['pay_type']=='miniapp'){
            $order = [
                'out_trade_no' => $out_trade_no,
                'body' => '充值',
                'total_fee' => $data['amount']*100,
            ];
            
            $orderInfo = Pay::wechat($this->wxpay_config)->miniapp($order)->getContent();
            $this->success("",['orderInfo' => json_decode($orderInfo,true)]);
        }
    }
    public function asset()
    {
        //资产
        $income_expend = $this->GxzhMoneyLogModel->income_expend($this->userId,1);
        $data = [
            'balance' => $this->GxzhMoneyLogModel->balance($this->userId,1),
            'consume' => $income_expend['expend'],
            'income'  => $income_expend['income']
        ];
        $this->success("成功!", $data);
    }
    public function assetdetail()
    {
        //资产明细
        $data = $this->request->param();
        $where = [
            'uid' => $this->userId,
        ];
        $page = 1;
        if (isset($data['page']) && intval($data['page'])>0){
            $page = intval($data['page']);
        }
        $list = Db::name("gxzh_money_log")->field('id,action,op,amount,msg,created_at')->where($where)->order('id DESC')->page($page.',10')->select()
                ->each(function ($item, $key) {
                    $item['created_at'] = date('Y-m-d H:i:s', $item['created_at']);
                    return $item;
                });
        $this->success("成功!", $list);
    }
    public function guestbook()
    {
        //留言
        $data = $this->request->param();
        $result = Db::name("gxzh_guestbook")->insertGetId(['uid'=>$this->userId,'contents'=>$data['contents'],'imgs'=>$data['imgs'],'created_at'=>time()]);
        if (empty($result)) {
            $this->error("失败,请重试!");
        }
        $this->success("成功!");
    }
    public function message()
    {
        //消息分页，未读状态
        $data = $this->request->param();
        $where = [
            'uid' => $this->userId,
            'type' => 2,
        ];
        $page = 1;
        if (isset($data['page']) && intval($data['page'])>0){
            $page = intval($data['page']);
        }
        $list = Db::name("gxzh_msg")->field('id,title,content,status')->where($where)->order('id DESC')->page($page.',10')->select()
                ->each(function ($item, $key) {
                    
                    return $item;
                });
        $this->success("成功!", $list);
    }
    public function read()
    {
        //标记已读状态
        $data = $this->request->param();
        $result = Db::name("gxzh_msg")->where(['uid'=>$this->userId,'id'=>$data['id']])->update(['status'=>1]);
        if (empty($result)) {
            
        }
        $this->success("成功!");
    }
    public function team()
    {
        //我的团队
        $url = $this->request->domain() . '/web/rshare.html?q=' . $this->user['invite_code'];
        $list = Db::name('user')->field('id as uid,user_nickname,create_time')->where(['pid' => $this->userId])->select()
                ->each(function ($item, $key) {
                    $item['create_time'] = date('Y-m-d H:i:s',$item['create_time']);
                    return $item;
                });

        $this->success("成功!",['list'=>$list,'url'=>$url,'invite_code'=>$this->user['invite_code']]);
    }
    public function updateUserInfo()
    {
        //更新我的信息
        $data = $this->request->param();
        $info = Db::name("user")->where(['id'=>$this->userId])->find();
        if(Db::name("user")->where(['id'=>['neq',$this->userId],'user_nickname'=>$data['user_nickname']])->find()){
            $this->error("昵称已存在,请更换昵称!");
        }
        $userinfo['user_nickname'] = $data['user_nickname'];//昵称
        $userinfo['sex'] = $data['sex'];
        (strpos($data['avatar'],'http')===false) ? $userinfo['avatar'] = $data['avatar'] : null;
        $userinfo['signature'] = $data['signature'];

        $userinfo['dept1'] = $data['dept1'];
        $userinfo['dept2'] = $data['dept2'];
        $userinfo['good_at'] = trim($data['good_at'],',');

        $result = Db::name("user")->where(['id'=>$this->userId])->update($userinfo);
        if ($result===false) {
            $this->error("失败,请重试!");
        }
        $data['service'] = json_decode(htmlspecialchars_decode($data['service']),true);
        if(!empty($data['service'])) {
            $minmax = [];
            Db::name("gxzh_service")->where(['uid'=>$this->userId])->delete();
            foreach ($data['service'] as $v){
                if($v['selected']){
                    $sdata = [
                        'uid' => $this->userId,
                        'service' => $v['id'],
                        'price' => $v['price']
                    ];
                    Db::name("gxzh_service")->insert($sdata);
                    array_push($minmax,$v['price']);
                }
            }
            //修改最大价格最小价格
            //if($info['min']==0 && $info['max']==0) {
                if(count($minmax)>0){
                    asort($minmax);
                    $min = current($minmax);
                    $max = end($minmax);
                    Db::name("user")->where(['id'=>$this->userId])->update(['min'=>$min,'max'=>$max]);
                }
            //}
        }
        //冗余关系
        Db::name("gxzh_relation")->where(['type'=>1,'uid'=>$this->userId])->delete();
        if(!empty($data['dept2'])){
            $dept2_a = explode(',',$data['dept2']);
            foreach($dept2_a as $v){
                Db::name("gxzh_relation")->insertGetId(['type'=>1,'uid'=>$this->userId,'dept_id'=>$v]);
            }
        }

        $this->success("成功!");
    }
    public function auth_identity()
    {
        $data = $this->request->param();
        $info = Db::name("user")->where(['id'=>$this->userId])->find();
        if($info['auth_identity']==1){
            $this->error("已认证，不可修改!");
        }
        
        $userinfo['user_login'] = $data['user_login'];
        $userinfo['idcard'] = $data['idcard'];
        (strpos($data['idcard_pic1'],'http')===false) ? $userinfo['idcard_pic1'] = $data['idcard_pic1'] : null;
        (strpos($data['idcard_pic2'],'http')===false) ? $userinfo['idcard_pic2'] = $data['idcard_pic2'] : null;
        $userinfo['auth_identity'] = 2;

        $result = Db::name("user")->where(['id'=>$this->userId])->update($userinfo);
        if ($result===false) {
            $this->error("失败,请重试!");
        }
        $this->success("提交成功!等待审核");
    }
//    public function auth_qualification()
//    {
//        $data = $this->request->param();
//        $info = Db::name("user")->where(['id'=>$this->userId])->find();
//
//        $userinfo['province'] = $data['province'];
//        $userinfo['city'] = $data['city'];
//        if($info['auth_work']!=1){
//            $userinfo['organization'] = $data['organization'];
//            $userinfo['work_year'] = $data['work_year'];
//            $userinfo['auth_work'] = 2;
//        }
//        if($info['auth_title']!=1){
//            $userinfo['level'] = $data['level'];
//            (strpos($data['title_pic1'],'http')===false) ? $userinfo['title_pic1'] = $data['title_pic1'] : null;
//            (strpos($data['title_pic2'],'http')===false) ? $userinfo['title_pic2'] = $data['title_pic2'] : null;
//            $userinfo['auth_title'] = 2;
//        }
//        if($info['auth_other1']!=1){
//            $userinfo['other1'] = $data['other1'];
//            (strpos($data['other1_pic1'],'http')===false) ? $userinfo['other1_pic1'] = $data['other1_pic1'] : null;
//            (strpos($data['other1_pic2'],'http')===false) ? $userinfo['other1_pic2'] = $data['other1_pic2'] : null;
//            $userinfo['auth_other1'] = 2;
//        }
//        if($info['auth_other2']!=1){
//            $userinfo['other2'] = $data['other2'];
//            (strpos($data['other2_pic1'],'http')===false) ? $userinfo['other2_pic1'] = $data['other2_pic1'] : null;
//            (strpos($data['other2_pic2'],'http')===false) ? $userinfo['other2_pic2'] = $data['other2_pic2'] : null;
//            $userinfo['auth_other2'] = 2;
//        }
//
//        $result = Db::name("user")->where(['id'=>$this->userId])->update($userinfo);
//        if ($result===false) {
//            $this->error("失败,请重试!");
//        }
//        $this->success("提交成功!等待审核，已认证信息不可修改");
//    }
//    public function couponlist()
//    {
//        //优惠券
//        $data = $this->request->param();
//        $where = ['uid'=>$this->userId];
//        if ($data['status']) {
//            $where['status'] = 1;
//        }else{
//            $where['status'] = 0;
//        }
//        $list = Db::name("gxzh_coupon")->where($where)->select();
//        $this->success("成功!", $list);
//    }
    //修改密码
    public function changepwd()
    {
        $data = $this->request->param();
        if ($data['new_password'] != $data['origin_password']){
            $this->error('密码不正确');
        }
//        if (!cmf_compare_password($data['old_pwd'], $this->user['user_pass'])) {
//            $this->error("密码不正确!");
//        }
        $result = Db::name("ylt_user")->where(['id'=>$this->userId])->update(['password'=>cmf_password($data['new_password'])]);
        if (empty($result)) {
            $this->error("失败,请重试!");
        }
        $this->success("成功!");
    }
//    public function comment()
//    {
//        //评价列表
//        $data = $this->request->param();
//        $where = [
//            'uid' => $data['uid'],
//        ];
//        $page = 1;
//        if (isset($data['page']) && intval($data['page'])>0){
//            $page = intval($data['page']);
//        }
//        $list = Db::name("gxzh_comment")->field('id as comment_id,from_uid,star,content,created_at')->where($where)->order('id DESC')->page($page.',10')->select()
//                ->each(function ($item, $key) {
//                    $item['from'] = Db::name("user")->where(['id'=>$item['from_uid']])->value('user_nickname');
//                    $item['created_at'] = date('Y-m-d H:i:s', $item['created_at']);
//                    return $item;
//                });
//
//        $this->success("成功!", $list);
//    }
    public function withdraw_account()
    {
        $withdraw_account = Db::name("gxzh_withdraw")->where(['uid'=>$this->userId])->order('id DESC')->find();
        $data = ['withdraw_realname'=>'','withdraw_account'=>''];
        if($withdraw_account){
            $data = ['withdraw_realname'=>$withdraw_account['withdraw_realname'],'withdraw_account'=>$withdraw_account['withdraw_account']];
        }
        $this->success("成功!",$data);
    }
    //发表评论
    public function set_comment(CommentModel $commentModel)
    {
        $request = $this->request->param();
        $commentModel->content = isset($request['content']) ? $request['content'] : '';
        $commentModel->user_id = $this->userId;
        $commentModel->article_id = $request['article_id'];
        $result = $commentModel->save();
        if ($result){
            $this->success('添加成功');
        }
    }
    //发表随手拍
    public function publish_camera(ArticleModel $articleModel)
    {
        $uploadImg = new UploadImg();
        $request = $this->request->param();

        $articleModel->type = '随手拍';
        $articleModel->user_id =$this->userId;
        $articleModel->content = isset($request['content']) ? $request['content'] : '';
        if (!empty($request['cover'])){
            foreach ($request['cover'] as $item){
                $path = $uploadImg->saveBase64Img($item['file']['src'], 'camera/');
                $data['cover'][] = $path;
            }
            $articleModel['cover'] = json_encode($data['cover'], JSON_UNESCAPED_SLASHES);
        }else{
            $articleModel['cover'] = '';
        }
        $result = $articleModel->save();
        if ($result){
            $this->success('成功');
        }else{
            $this->success('失败');
        }

    }
    //上传随手拍详情封面
    public function camera_cover()
    {
        $uploadImg = new UploadImg();
        $userModel = new UserModel();
        $request = $this->request->param();
        $path = $uploadImg->saveBase64Img($request['cover'][0]['file']['src'], 'camera/');
        $userModel['camera_cover'] = $path;
        $result = $userModel->save();
        if ($result){
            $this->success('成功');
        }else{
            $this->success('失败');
        }
    }
    //上传头像
    public function avatar()
    {
        $uploadImg = new UploadImg();
        $userModel = new UserModel();
        $request = $this->request->param();
        $path = $uploadImg->saveBase64Img($request['cover'][0]['file']['src'], 'avatar/');
        $userModel['avatar'] = $path;
        $result = $userModel->save();
        if ($result){
            $this->success('成功');
        }else{
            $this->success('失败');
        }
    }
    //个人中心我的随手拍
    public function my_camera()
    {
        $user = new UserModel();
        $comment = new CommentModel();
        $camera = new ArticleModel();
            $camera_list = $camera->field('id, user_id, title, cover, content, create_time')->where('user_id', $this->userId)->where('type', '随手拍')->select();
        if(!empty($camera_list)){
            foreach ($camera_list as $temp => $item){
                //加入评论数
                $comment_count = $comment->comment_count($item['id']);
                $item['comment_count'] = $comment_count;
                //处理随手拍里的图片
                $item['cover'] = json_decode($item['cover']);
                if (!empty($item['cover'])){
                    foreach ($item['cover'] as $key => $value){
                        $data[$key] = $this->request->domain() . '/upload/'. $value;
                    }
                    $camera_list[$temp]['cover'] = $data;
                }
            }
        }else{
            $camera_list = '';
        }
        $camera_list = $user->get_comment_user($camera_list);
        $this->success('成功',$camera_list);
    }
    //个人中心我的评论
    public function my_comment()
    {
        $commentModel = new CommentModel();
        $article = new ArticleModel;
        $user = new UserModel();
        $comment_list = $commentModel->order('create_time', 'desc')->where('user_id', $this->userId)->select();
        foreach ($comment_list as $key => $comment) {
            if (!empty($comment)) {
                $article = $article->where('id', $comment['article_id'])->find();
                $user = $user->find($this->userId);
                $data[$key]['article_id'] = $comment['article_id'];
                $data[$key]['nick_name'] = $user['nick_name'] ?: '';
                $data[$key]['avatar'] = $user['avatar'] ?: '';
                $data[$key]['comment'] = $comment['content'] ?: '';
                $data[$key]['create_time'] = $comment['create_time'] ?: '';
                $data[$key]['type'] = $article['type'];
                $data[$key]['cover'] = $this->request->domain() . '/upload/' . json_decode($article['cover'])[0];
            }
        }
        $comment_list = $data;

        $this->success('成功', $comment_list);
    }
    //点赞入库
    public function set_praise(PraiseModel $praiseModel)
    {
        $request = $this->request->param();
        $praiseModel->user_id = $this->userId;
        $praiseModel->article_id = $request['article_id'] ?: '';

        $praiseModel->save();
        $article = new ArticleModel();
        $result = $article->find($request['article_id'])->isUpdate()->save(['is_praise' => 1]);
        if ($result){
            $this->success('成功');
        }else{
            $this->error('失败');
        }
    }
    //取消
    public function cancel_praise(PraiseModel $praiseModel)
    {
        $request = $this->request->param();
        $praiseModel->where('user_id', $this->userId)->where('article_id', $request['article_id'])->delete();
        $article = new ArticleModel();
        $result = $article->find($request['article_id'])->isUpdate()->save(['is_praise' => 0]);
        if ($result){
            $this->success('成功');
        }else{
            $this->error('失败');
        }
    }
    //个人中心我的赞
    public function my_praise()
    {
        return dump(cmf_get_current_user());
        $praise = new PraiseModel();
        $user_praise = $praise->where('user_id', $this->userId)->select();
        $this->success('成功', $user_praise);
    }
    //随手拍举报
    public function report()
    {
        $request = $this->request->param('article_id');
        $content = $request['content'] ?: '';
        $cover = $request['cover'][0] ? json_encode($request['cover']) : '';
    }
    //资源预约
    public function resource_appointment()
    {
        $article = new ArticleModel();
        $appointment = new AppointmentModel();
        $hall_count = $article->where('user_id', $this->userId)->where('type', '礼堂')->count();
        $group = $article->where('user_id', $this->userId)->where('type', '机构团体')->count();
        $volunteer = $article->where('user_id', $this->userId)->where('type', '志愿者')->count();
        $appointment_count = $appointment->where('user_id', $this->userId)->count();
        $this->success('成功', ['hall_count' => $hall_count, 'group' => $group, 'volunteer' => $volunteer, 'appointment_count' => $appointment_count]);
    }
    //志愿者风采列表
    public function volunteer()
    {
        $volunteer = new ArticleModel();
        $volunteer_list = $volunteer->where('type', '志愿者')->where('user_id', $this->userId)->select();
        foreach ($volunteer_list as $key => $item){
            if (!empty($item['cover'])){
                $item['cover'] = $this->request->domain() . '/upload/' . json_decode($item['cover'])[0];
            }
        }
        $this->success('成功', $volunteer_list);
    }
    //机构团体
    public function group()
    {
        $group = new ArticleModel();
        $group_list = $group->where('type', '机构团体')->where('user_id', $this->userId)->select();
        foreach ($group_list as $key => $item){
            if (!empty($item['cover'])){
                $item['cover'] = $this->request->domain() . '/upload/' . json_decode($item['cover'])[0];
            }
        }
        $this->success('成功', $group_list);
    }
    //我的预约记录
    public function my_appointment()
    {
        $appointment = new AppointmentModel();
        $appointment_list = $appointment->where('user_id', $this->userId)->order('create_time', 'desc')->select();
        return $appointment_list;
    }
    //申请预约(点击‘+’号)
    public function apply_appointment()
    {
        $article = new ArticleModel();
        $hall_name = $article->field('id, title')->where('type', '礼堂')->select();
        return $hall_name;
    }
    //提交礼堂预约
    public function submit_appointment()
    {
        $article = new ArticleModel();
        $appointment = new AppointmentModel();
        $hall_name = $article->field('id, user_id, title')->where('type', '礼堂')->select();
        $request = $this->request->param();
        $appointment->article_id = $request['article_id'];
        $appointment->hold_user = $request['hold_user'];
//        $appointment->title = $request['title'];
        $appointment->link_man = $request['link_man'];
        $appointment->mobile = $request['mobile'];
        $appointment->apply_reason = $request['apply_reason'];
        $appointment->start_time = $request['start_time'];
        $appointment->end_time = $request['end_time'];
        $appointment->user_id = $this->userId;
        $result = $appointment->save();
        if ($result){
            $this->success('成功');
        }else{
            $this->success('失败');
        }
    }
}
