<?php
namespace app\api\controller;

use app\admin\model\ArticleModel;
use app\admin\model\HallTypeModel;
use think\Request;
use think\Validate;
use think\Cache;
use think\Db;
use app\api\model\UserModel;
use app\api\model\GxzhQuestionModel;
use Yansongda\Pay\Pay;
use Yansongda\Pay\Log;

class PublicController extends ApiBaseController
{
    public $newToken;
    public function initialize()
    {
        $this->newToken = md5(uniqid()) . md5(time());
        $this->UserModel = new UserModel();
    }
    public function push()
    {
        echo filter_words('a黄色a');die;
        push('gxzh_2', 'test');
    }
    public function sendsms()
    {
        $validate = new Validate([
            'mobile' => 'require',
        ]);
        $validate->message([
            'mobile.require' => '请输入手机号!',
        ]);
        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }
        if (!cmf_check_mobile($data['mobile'])) {
            $this->error("请输入正确的手机格式!");
        }

        //限制 每个ip 的发送次数
//        $clientIp = $this->request->ip(0, true);
//        if (Cache::get($clientIp)) {
//            Cache::inc($clientIp);
//        } else {
//            Cache::set($clientIp, 1, 600);
//        }
//        if (Cache::get($clientIp) > 20) {
//            $this->error('请稍后再试');
//        }
        //测试后开启
        //$code = cmf_get_verification_code($data['mobile']);
        //if (empty($code)) {
        //    $this->error("验证码发送过多,请稍后再试!");
        //}
        $code = rand(1000, 9999);

        cmf_verification_code_log($data['mobile'], $code);

//        $res = sendsms($data['mobile'],$code);***********************************************************************验证码临时注释***************************************
        $res = 1;

        if ($res) {
            $this->success('验证码已经发送成功!');
        } else{
            $this->error('发送失败');
        }

    }
    public function register()
    {
        $validate = new Validate([
            'mobile'            => 'require',
            'password'          => 'require',
            'verification_code' => 'require'
        ]);

        $validate->message([
            'mobile.require'            => '请输入手机号!',
            'password.require'          => '请输入您的密码!',
            'verification_code.require' => '请输入数字验证码!'
        ]);

        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }

        $user = [];
        $findUserWhere = [];

        if (cmf_check_mobile($data['mobile'])) {
            $user['mobile']          = $data['mobile'];
            $findUserWhere['mobile'] = $data['mobile'];
        } else {
            $this->error("请输入正确的手机格式!");
        }

//        $errMsg = cmf_check_verification_code($data['mobile'], $data['verification_code']);************************************验证码临时注释3行*****************************************
//        if (!empty($errMsg)) {
//            $this->error($errMsg);
//        }

        $findUserCount = Db::name("ylt_user")->where($findUserWhere)->count();

        if ($findUserCount > 0) {
            $this->error(['code' => 2, 'msg' => '此账号已存在!']);
        }

        $user['create_time'] = time();
        $user['update_time'] = time();
//        $user['user_status'] = 1;
//        $user['user_type']   = 2;
        $user['password']   = cmf_password($data['password']);
        $user['token']       = $this->newToken;
        $user['account']  = $data['mobile'];
        $user['mobile']  = $data['mobile'];
//        $user['invite_code'] = $user['user_login'];
        $user['nick_name'] = get_rand_str(6);

        $result = Db::name("ylt_user")->insertGetId($user);

        if (empty($result)) {
            $this->error("注册失败,请重试!");
        }

        if (!empty($data['openid']) && !empty($data['app_id'])) {
            //通过第三方登录注册的
            Db::name("ylt_third_party_user")->where(['app_id'=>$data['app_id'],'openid'=>$data['openid']])->update(['user_id'=>$result]);
        }
//        if (!empty($inviter['id'])) {
//            //上级送优惠券
//            Db::name("gxzh_coupon")->insertGetId(['uid'=>$inviter['id'],'price'=>rand(5,10)]);
//        }
        
        $userinfo = $this->UserModel->userInfo($result);
        $this->success("注册成功!", ['token' => $this->newToken,'user' => $userinfo]);

    }
    public function login()
    {
        $validate = new Validate([
            'mobile' => 'require',
            'password' => 'require'
        ]);
        $validate->message([
            'mobile.require' => '请输入手机号',
            'password.require' => '请输入您的密码!'
        ]);

        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }

        $findUserWhere = [];

        if (cmf_check_mobile($data['mobile'])) {
            $findUserWhere['mobile'] = $data['mobile'];
        } else {
            $this->error("请输入正确的手机格式!");
        }

        $findUser = Db::name("ylt_user")->where($findUserWhere)->find();

        if (empty($findUser)) {
            $this->error("用户不存在!");
        } else {

//            switch ($findUser['user_status']) {
//                case 0:
//                    $this->error('您已被拉黑!');
//                case 2:
//                    $this->error('账户还没有验证成功!');
//            }

            if (!cmf_compare_password($data['password'], $findUser['password'])) {
                $this->error("密码不正确!");
            }
        }

        $result = Db::name('ylt_user')->where([
            'id'     => $findUser['id']
        ])->update(['token' => $this->newToken]);


        if (empty($result)) {
            $this->error("登录失败!");
        }
        $userinfo = $this->UserModel->userInfo($findUser['id']);
        $this->success("登录成功!", ['token' => $this->newToken,'user' => $userinfo]);
    }
    public function resetpwd()
    {
        $validate = new Validate([
            'mobile'            => 'require',
            'password'          => 'require',
            'verification_code' => 'require'
        ]);

        $validate->message([
            'mobile.require'            => '请输入手机号!',
            'password.require'          => '请输入您的密码!',
            'verification_code.require' => '请输入数字验证码!'
        ]);

        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }

        $user = [];
        $findUserWhere = [];

        if (cmf_check_mobile($data['mobile'])) {
            $user['mobile']          = $data['mobile'];
            $findUserWhere['mobile'] = $data['mobile'];
        } else {
            $this->error("请输入正确的手机格式!");
        }

        $errMsg = cmf_check_verification_code($data['mobile'], $data['verification_code']);
        if (!empty($errMsg)) {
            $this->error($errMsg);
        }

        $findUser = Db::name("user")->where($findUserWhere)->find();

        if ($findUser) {
            $result = Db::name('user')->where([
                'id'     => $findUser['id']
            ])->update(['token' => null, 'user_pass' => cmf_password($data['password'])]);

            if (empty($result)) {
                $this->error("失败!");
            }
    
            $this->success("成功!");
        } else {
            $this->error("手机号未找到!");
        }
    }
    public function miniapplogin()
    {
        //小程序登录
        $data = $this->request->param();
        $app_id = config('wx_mini_app_id');
        $app_secret = config('wx_mini_app_secret');

        $response = cmf_curl_get("https://api.weixin.qq.com/sns/jscode2session?appid={$app_id}&secret={$app_secret}&js_code={$data['code']}&grant_type=authorization_code");

        $response = json_decode($response, true);
        if (!empty($response['errcode'])) {
            $this->error('操作失败!');
        }

        $openid     = $response['openid'];
        $unionid    = $response['unionid'];

        $findThirdPartyUser = Db::name("third_party_user")
            ->where('union_id', $unionid)
            ->where('user_id', '>', 0)
            ->find();

        if ($findThirdPartyUser) {

            $thisopenid = Db::name("third_party_user")
                ->where('union_id', $unionid)
                ->where('user_id', '>', 0)
                ->where('openid', $openid)
                ->find();
            
            if ($thisopenid) {
                //此appid绑定过
                $userData = [
                    'last_login_ip'   => $this->request->ip(0, true),
                    'last_login_time' => time(),
                    'login_times'     => Db::raw('login_times+1'),
                    //'more'            => json_encode($wxUserData),
                ];
    
                Db::name("third_party_user")
                    ->where('openid', $openid)
                    ->where('app_id', $app_id)
                    ->update($userData);
            } else {
                //新的appid
                Db::name("third_party_user")->insert([
                    'openid'          => $openid,
                    'user_id'         => $findThirdPartyUser['user_id'],
                    'third_party'     => 'wxminiapp',
                    'app_id'          => $app_id,
                    'last_login_ip'   => $this->request->ip(0, true),
                    'union_id'        => $unionid,
                    'last_login_time' => time(),
                    'create_time'     => time(),
                    'login_times'     => 1,
                    'status'          => 1,
                    //'more'            => json_encode($wxUserData)
                ]);
            }

            Db::name('user')->where(['id'=>$findThirdPartyUser['user_id']])->update(['token'=>$this->newToken,'last_login_time'=>time()]);
            $userinfo = $this->UserModel->userInfo($findThirdPartyUser['user_id']);
            if($userinfo['user_status']==0){
                $this->error('您已被拉黑!');
            }
            $this->success("登录成功!", ['token' => $this->newToken,'user' => $userinfo]);

        } else {

            $isnew = Db::name("third_party_user")
                ->where('union_id', $unionid)
                ->where('openid', $openid)
                ->where('app_id', $app_id)
                ->where('user_id', 0)
                ->find();
            if($isnew){
                //update
                $userData = [
                    'last_login_ip'   => $this->request->ip(0, true),
                    'last_login_time' => time(),
                    'login_times'     => Db::raw('login_times+1'),
                    //'more'            => json_encode($wxUserData),
                ];
    
                Db::name("third_party_user")
                    ->where('openid', $openid)
                    ->where('app_id', $app_id)
                    ->update($userData);
            }else{
                //insert
                Db::name("third_party_user")->insert([
                    'openid'          => $openid,
                    'user_id'         => 0,
                    'third_party'     => 'wxminiapp',
                    'app_id'          => $app_id,
                    'last_login_ip'   => $this->request->ip(0, true),
                    'union_id'        => $unionid,
                    'last_login_time' => time(),
                    'create_time'     => time(),
                    'login_times'     => 1,
                    'status'          => 1,
                    //'more'            => json_encode($wxUserData)
                ]);
            }

            $this->success("绑定", ['app_id' => $app_id,'openid' => $openid]);
            
        }
    }
    public function wxlogin()
    {
        //微信登录，根据jscode拿openid，判断openid是否存在，判断是否绑定用户
        $data = $this->request->param();
        $app_id = config('wx_app_id');
        $app_secret = config('wx_app_secret');

        $response = cmf_curl_get("https://api.weixin.qq.com/sns/oauth2/access_token?appid={$app_id}&secret={$app_secret}&code={$data['code']}&grant_type=authorization_code");

        $response = json_decode($response, true);
        if (!empty($response['errcode'])) {
            $this->error('操作失败!');
        }

        $openid     = $response['openid'];

        $wxUserData = json_decode(cmf_curl_get("https://api.weixin.qq.com/sns/userinfo?access_token={$response['access_token']}&openid={$openid}&lang=zh_CN"), true);

        if (empty($wxUserData['unionid'])) {
            $this->error('unionid为空!');
        }

        $findThirdPartyUser = Db::name("ylt_third_party_user")
            ->where('union_id', $wxUserData['unionid'])
            ->where('user_id', '>', 0)
            ->find();

        if ($findThirdPartyUser) {

            $thisopenid = Db::name("ylt_third_party_user")
                ->where('union_id', $wxUserData['unionid'])
                ->where('user_id', '>', 0)
                ->where('openid', $openid)
                ->find();
            
            if ($thisopenid) {
                //此appid绑定过
                $userData = [
//                    'last_login_ip'   => $this->request->ip(0, true),
//                    'last_login_time' => time(),
//                    'login_times'     => Db::raw('login_times+1'),
                    'more'            => json_encode($wxUserData),
                ];
    
                Db::name("ylt_third_party_user")
                    ->where('openid', $openid)
                    ->where('app_id', $app_id)
                    ->update($userData);
            } else {
                //新的appid
                Db::name("ylt_third_party_user")->insert([
                    'openid'          => $openid,
                    'user_id'         => $findThirdPartyUser['user_id'],
//                    'third_party'     => 'wxapp',
                    'app_id'          => $app_id,
//                    'last_login_ip'   => $this->request->ip(0, true),
                    'union_id'        => $wxUserData['unionid'],
//                    'last_login_time' => time(),
                    'create_time'     => time(),
                    'update_time'     => time(),
//                    'login_times'     => 1,
//                    'status'          => 1,
                    'more'            => json_encode($wxUserData)
                ]);
            }

            Db::name('ylt_user')->where(['id'=>$findThirdPartyUser['user_id']])->update(['token'=>$this->newToken]);
            $userinfo = $this->UserModel->userInfo($findThirdPartyUser['user_id']);
            if($userinfo['user_status']==0){
                $this->error('您已被拉黑!');
            }
            $this->success("登录成功!", ['token' => $this->newToken,'user' => $userinfo]);

        } else {

            $isnew = Db::name("ylt_third_party_user")
                ->where('union_id', $wxUserData['unionid'])
                ->where('openid', $openid)
                ->where('app_id', $app_id)
                ->where('user_id', 0)
                ->find();
            if($isnew){
                //update
                $userData = [
                    'last_login_ip'   => $this->request->ip(0, true),
                    'last_login_time' => time(),
                    'login_times'     => Db::raw('login_times+1'),
                    'more'            => json_encode($wxUserData),
                ];
    
                Db::name("ylt_third_party_user")
                    ->where('openid', $openid)
                    ->where('app_id', $app_id)
                    ->update($userData);
            }else{
                //insert
                Db::name("ylt_third_party_user")->insert([
                    'openid'          => $openid,
                    'user_id'         => 0,
//                    'third_party'     => 'wxapp',
                    'app_id'          => $app_id,
//                    'last_login_ip'   => $this->request->ip(0, true),
                    'union_id'        => $wxUserData['unionid'],
//                    'last_login_time' => time(),
                    'create_time'     => time(),
                    'update_time'     => time(),
//                    'login_times'     => 1,
//                    'status'          => 1,
                    'more'            => json_encode($wxUserData)
                ]);
            }

            $this->success("绑定", ['app_id' => $app_id,'openid' => $openid]);
            
        }

    }
    public function binduser()
    {
        //绑定已有账号
        $validate = new Validate([
            'mobile'            => 'require',
            'verification_code' => 'require',
            'app_id' => 'require',
            'openid' => 'require',
        ]);

        $validate->message([
            'mobile.require'            => '请输入手机号!',
            'verification_code.require' => '请输入数字验证码!',
            'app_id.require' => 'app_id不能为空',
            'openid.require' => 'openid不能为空!',
        ]);

        $data = $this->request->param();
        if (!$validate->check($data)) {
            $this->error($validate->getError());
        }

        $findUserWhere = [];

        if (cmf_check_mobile($data['mobile'])) {
            $findUserWhere['mobile'] = $data['mobile'];
        } else {
            $this->error("请输入正确的手机格式!");
        }

        $errMsg = cmf_check_verification_code($data['mobile'], $data['verification_code']);
        if (!empty($errMsg)) {
            $this->error($errMsg);
        }

        $findUser = Db::name("ylt_user")->where($findUserWhere)->find();

        if ($findUser) {
            $result = Db::name('ylt_user')->where([
                'id'     => $findUser['id']
            ])->update(['token' => $this->newToken]);

            $result2 = Db::name('ylt_third_party_user')->where([
                'openid' => $data['openid'],
                'app_id' => $data['app_id'],
            ])->update(['user_id' => $findUser['id']]);

            if (empty($result) || empty($result2)) {
                $this->error("登录失败!");
            }

            $userinfo = $this->UserModel->userInfo($findUser['id']);
            $this->success("登录成功!", ['token' => $this->newToken,'user' => $userinfo]);
        } else {
            $this->error("手机号未找到!");
        }
    }

    public function mobile()
    {
        //检查手机号
        $data = $this->request->param();
        if ($data['type'] == 'wxapp') {
            $user = Db::name('user')->where(['mobile'=>$data['mobile']])->find();
            if (empty($user)) {
                $this->success("注册新用户!", ['action'=>'register']);
            }
            $openid = Db::name('ylt_third_party_user')->where(['user_id'=>$user['id'],'third_party'=>'wxapp'])->value('openid');
            if (empty($openid)) {
                $this->success("绑定用户!", ['action'=>'binduser']);
            } elseif (!empty($openid)) {
                $this->error("该用户已绑定过微信账号!");
            }
        } elseif ($type == 'mobile') {
            $user = Db::name('ylt_user')->where(['mobile'=>$data['mobile']])->find();
            if (empty($user)) {
                $this->error("新注册可以发送验证码!");
            }
            $this->success("该手机号已注册!");
        } elseif ($type == 'password') {
            $user = Db::name('ylt_user')->where(['mobile'=>$data['mobile']])->find();
            if (empty($user)) {
                $this->error("该账号不存在!");
            }
            $this->success("忘记密码可以发送验证码!");
        }
    }
    public function slide()
    {
        //轮播图
        $slide = Db::name('slide_item')->field('slide_id,image,url')->where(['status'=>1])->order('list_order')->select();
        $list = [];
        foreach($slide as $v) {
            $v['image'] = $this->request->domain().'/upload/'.$v['image'];
            $list[$v['slide_id']][] = $v;
        }
        $list = array_values($list);
        $this->success("",['slide1'=>$list[0],'slide2'=>$list[1], 'slide3'=>$list[2]]);
    }
    public function aboutus()
    {
        //关于我们
        $result = Db::name('ylt_info')->select();
        $aboutus = $result['about'];
        $this->success("公告",$aboutus);
    }
    public function search_condition()
    {
        //搜索条件
        $arry1 = get_config('SERVICE_TYPE');
        $arry2 = get_config('INTERVAL_PRICE');
        $arry3 = get_config('LEVEL');
        $data = [
            'services' => $arry1,
            'prices'   => $arry2,
            'level'    => $arry3,
        ];
        $this->success("",$data);
    }
    public function search()
    {
        $data = $this->request->param();
        $where = [];
        $where['user_type'] = 2;
        $where['id'] = [['>',0],['>',0]];
        if (!empty($data['keyword'])){
            //搜索相应的uid
            $uids = Db::name('user')->where(['good_at'=>['like',"%{$data['keyword']}%"]])->column('id');
            if(!empty($uids[0])){
                $where_uid1 = ['in',$uids];
                array_push($where['id'],$where_uid1);
            }else{
                array_push($where['id'],['in',0]);
            }

            $where['user_nickname|organization'] = ['like',"%{$data['keyword']}%"];
        }
        if (!empty($data['city'])){
            //http://api.map.baidu.com/geocoder?location=30.990998,103.645966&output=json&key=xxxxxxxxxxxxxxxx
            //http://api.map.baidu.com/location/ip?ak=xxxxxxxxxxxxxxxx&ip=218.28.21.226
            $city = Db::name('city')->where(['city'=>['like',"%{$data['city']}%"]])->find();
            if(empty($city)){
                $this->error("未找到城市!");
            }
            $where['city'] = $city['code'];
        }elseif(!empty($data['province'])){
            $province = Db::name('province')->where(['province'=>['like',"%{$data['province']}%"]])->find();
            if(empty($province)){
                $this->error("未找到省份!");
            }
            $where['province'] = $province['code'];
        }
        if (!empty($data['dept1'])){
            $where['dept1'] = $data['dept1'];
        }
        if (!empty($data['dept2'])){
            //冗余关系查询
            $u_dept_id = Db::name("gxzh_relation")->where(['type'=>1,'dept_id'=>$data['dept2']])->column('uid');
            if(!empty($u_dept_id[0])){
                $u_dept_id = ['in',$u_dept_id];
                array_push($where['id'],$u_dept_id);
            }else{
                array_push($where['id'],['in',0]);
            }
        }
        if (!empty($data['level'])){
            $where['level'] = $data['level'];
        }
        if (!empty($data['service'])){
            //搜索相应的uid
            $uids2 = Db::name('gxzh_service')->where(['service'=>$data['service']])->column('uid');
            if(!empty($uids2[0])){
                $where_uid2 = ['in',$uids2];
                array_push($where['id'],$where_uid2);
            }
            else{
                array_push($where['id'],['in',0]);
            }
        }
        if (!empty($data['price'])){
            //搜索相应的uid
            $prices = explode('-',$data['price']);
            $uids3 = Db::name('user')->where(['min'=>['between',[$prices[0],$prices[1]]]])->whereor(['max'=>['between',[$prices[0],$prices[1]]]])->column('id');
            if(!empty($uids3[0])){
                $where_uid3 = ['in',$uids3];
                array_push($where['id'],$where_uid3);
            }
            else{
                array_push($where['id'],['in',0]);
            }
        }
        $order = 'star DESC';
        if (!empty($data['sort'])){
            if($data['sort']=='star'){
                $order = 'star DESC';
            }
            if($data['sort']=='level'){
                $order = 'level DESC';
            }
            if($data['sort']=='distance'){
                //未登录时的经纬度
                $lat = $data['latitude'];
                $lon = $data['longitude'];
                $order = 'ACOS(SIN(('.$lat.' * 3.1415) / 180 ) *SIN((latitude * 3.1415) / 180 ) +COS(('.$lat.' * 3.1415) / 180 ) * COS((latitude * 3.1415) / 180 ) *COS(('.$lon.' * 3.1415) / 180 - (longitude * 3.1415) / 180 ) ) * 6380 asc';
                $where['latitude'] = [['>',$lat-1],['<',$lat+1]];
                $where['longitude'] = [['>',$lon-1],['<',$lon+1]];
            }
        }
        $page = 1;
        if (isset($data['page']) && intval($data['page'])>0){
            $page = intval($data['page']);
        }
        //var_dump($where,$order,$page);die;
        $list = $this->UserModel->userList($where,$order,$page);
        //var_dump($list);die;
        
        $this->success("成功!",$list);
    }

//    礼堂列表
    public function hall_list()
    {
        $hall = new ArticleModel();
        $hall_type = new HallTypeModel();
        $hall_type_list = $hall_type->select();
        $hallList = $hall->where('type', '礼堂')->select();
        $this->success('成功', ['hall_list' => $hallList, 'hall_type_list' => $hall_type_list]);
    }

    //点击礼堂分类筛选
    public function hall_type_search(ArticleModel $articleModel, $id)
    {
        $hall_type_search = $articleModel->where('hall_type_id', $id)->select();
        $this->success('成功',$hall_type_search);
    }
    // 礼堂指数排行
    public function hall_ranking()
    {
        $hall = new ArticleModel();
        $hallList = $hall->where('type', '礼堂')->select();
        $this->success('成功', $hallList);

    }
    //    工作资讯列表
    public function information_list()
    {
        $information = new ArticleModel();
        $information_type = new HallTypeModel();
        $information_type_list = $information_type->select();
        $informationList = $information->where('type', '礼堂')->select();
        $this->success('成功', ['hall_list' => $informationList, 'hall_type_list' => $information_type_list]);
    }

    //点击工作咨询分类进入详情
    public function information_type_search(ArticleModel $articleModel, $id)
    {
        $information_type_search = $articleModel->where('hall_type_id', $id)->select();
        $this->success('成功',$information_type_search);
    }

    //    文化机构列表
    public function group_list()
    {
        $group = new ArticleModel();
        $groupList = $group->where('type', '机构团体')->select();
        $this->success('成功', $groupList);
    }
    //    志愿者列表
    public function volunteer_list()
    {
        $volunteer = new ArticleModel();
        $volunteerList = $volunteer->where('type', '志愿者')->select();
        $this->success('成功', $volunteerList);
    }
    //    志愿者列表
    public function apportionment_record()
    {
        $volunteer = new ArticleModel();
        $volunteerList = $volunteer->where('type', '志愿者')->select();
        $this->success('成功', $volunteerList);
    }
}
