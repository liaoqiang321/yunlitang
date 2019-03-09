<?php
namespace app\api\controller;

use app\admin\model\ArticleModel;
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
        $clientIp = $this->request->ip(0, true);
        if (Cache::get($clientIp)) {
            Cache::inc($clientIp);
        } else {
            Cache::set($clientIp, 1, 600);
        }
        if (Cache::get($clientIp) > 20) {
            $this->error('请稍后再试');
        }
        //测试后开启
        //$code = cmf_get_verification_code($data['mobile']);
        //if (empty($code)) {
        //    $this->error("验证码发送过多,请稍后再试!");
        //}
        $code = rand(1000, 9999);

        cmf_verification_code_log($data['mobile'], $code);

        $res = sendsms($data['mobile'],$code);
        
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

        $errMsg = cmf_check_verification_code($data['mobile'], $data['verification_code']);
        if (!empty($errMsg)) {
            $this->error($errMsg);
        }

        $findUserCount = Db::name("ylt_user")->where($findUserWhere)->count();

        if ($findUserCount > 0) {
            $this->error(['code' => 2, 'msg' => '此账号已存在!']);
        }
//        if (isset($data['inviter'])) {
//            $inviter = Db::name("user")->where(['invite_code'=>$data['inviter']])->find();
//            if (empty($inviter)) {
//                //$this->error("邀请人不存在!");
//            }else{
//                $user['pid'] = $inviter['id'];
//            }
//        }

        $user['create_time'] = time();
//        $user['user_status'] = 1;
//        $user['user_type']   = 2;
        $user['user_pass']   = cmf_password($data['password']);
        $user['token']       = $this->newToken;
        $user['account']  = $data['mobile'];
        $user['mobile']  = $data['mobile'];
        $user['invite_code'] = $user['user_login'];
        $user['user_nickname'] = get_rand_str(6);

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

            switch ($findUser['user_status']) {
                case 0:
                    $this->error('您已被拉黑!');
                case 2:
                    $this->error('账户还没有验证成功!');
            }

            if (!cmf_compare_password($data['password'], $findUser['user_pass'])) {
                $this->error("密码不正确!");
            }
        }

        $result = Db::name('ylt_user')->where([
            'id'     => $findUser['id']
        ])->update(['token' => $this->newToken,'last_login_time'=>time()]);


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
    public function province()
    {
        //省份列表
        $province = Db::name('province')->select()->toArray();
        $city = Db::name('city')->select()->toArray();
        foreach ($province as $k=>$v){
            $ct = [];
            foreach ($city as $kk=>$vv) {
                if ($vv['province_code'] == $v['code']) {
                    array_push($ct, $vv);
                }
            }
            $province[$k]['city'] = $ct;
        }
        $this->success("成功!", $province);
    }
    public function city()
    {
        //城市列表
        $data = $this->request->param();
        $where = [];
        if (isset($data['province_code'])) {
            $where['province_code'] = $data['province_code'];
        }
        $this->success("成功!", Db::name('city')->where($where)->select());
    }
    public function location()
    {
        //更新用户经纬度
        $data = $this->request->param();
        Db::name('user')->where([
            'id'     => $this->userId
        ])->update(['longitude' => $data['longitude'], 'latitude' => $data['latitude']]);

        $this->success("成功!");
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
            $openid = Db::name('third_party_user')->where(['user_id'=>$user['id'],'third_party'=>'wxapp'])->value('openid');
            if (empty($openid)) {
                $this->success("绑定用户!", ['action'=>'binduser']);
            } elseif (!empty($openid)) {
                $this->error("该用户已绑定过微信账号!");
            }
        } elseif ($type == 'mobile') {
            $user = Db::name('user')->where(['mobile'=>$data['mobile']])->find();
            if (empty($user)) {
                $this->error("新注册可以发送验证码!");
            }
            $this->success("该手机号已注册!");
        } elseif ($type == 'password') {
            $user = Db::name('user')->where(['mobile'=>$data['mobile']])->find();
            if (empty($user)) {
                $this->error("该账号不存在!");
            }
            $this->success("忘记密码可以发送验证码!");
        }
    }
    public function label()
    {
        //文字标签
        if (empty(cache('gxzh_config'))) {
            cache('gxzh_config',Db::name('gxzh_config')->select());
        }
        $gxzh_config = cache('gxzh_config');
        $data = [];
        foreach ($gxzh_config as $v){
            if ($v['group']==4){
                $data[$v['name']] = $v['value'];
                if($v['type']==3 && $v['value']){
                    $data[$v['name']] = $this->request->domain().$v['value'];
                }
            }
        }
        $this->success("",$data);
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
        $this->success("",['slide1'=>$list[0],'slide2'=>$list[1]]);
    }
    public function notice()
    {
        //公告
        $notice['list'] = Db::name('gxzh_msg')->field('id,title,remark,content')->where(['type'=>1,'is_deleted'=>0])->order(['sort'=>'DESC'])->limit(2)->select()
                        ->each(function ($item, $key) {
                            $item['content'] = str_replace('src="/upload/','src="'.$this->request->domain().'/upload/',$item['content']);
                            return $item;
                        });
        //未读条数
        $notice['unread'] = 0;
        if($this->userId){
            $where = [
                'uid' => $this->userId,
                'type' => 2,
                'status' => 0,
            ];
            $notice['unread'] = Db::name('gxzh_msg')->where($where)->count();
        }
        $this->success("",$notice);
    }
    public function newsinfo()
    {
        $data = $this->request->param();
        $newsinfo = Db::name('gxzh_msg')->field('id,title,content')->where(['id'=>$data['id'],'type'=>1,'is_deleted'=>0])->find();
        $newsinfo['content'] = str_replace('src="/upload/','src="'.$this->request->domain().'/upload/',$newsinfo['content']);
        $this->success("",$newsinfo);
    }
    public function aboutus()
    {
        //关于我们
        $aboutus = get_config('aboutus');
        $aboutus = str_replace('src="/upload/','src="'.$this->request->domain().'/upload/',$aboutus);
        $this->success("",$aboutus);
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
    public function department()
    {
        $question_count = Db::name('gxzh_question')->field('dept1,count(*) as c')->group('dept1')->select();
        foreach ($question_count as $v){
            if ($v['dept1']){
                Db::name('gxzh_department')->where(['id'=>$v['dept1']])->update(['question_count'=>$v['c']]);
            }
        }
        $dept = Db::name('gxzh_department')->field('id,name,img,parent_id,question_count')->where(['status'=>1])->order('list_order')->select();
        $list = [];
        foreach ($dept as $v) {
            if($v['parent_id']==0){
                $v['children'] = [];
                foreach($dept as $vv) {
                    if ($vv['parent_id']==$v['id']){
                        $vv['img'] = $this->request->domain().$vv['img'];
                        array_push($v['children'],$vv);
                    }
                }
                $v['img'] = $this->request->domain().$v['img'];
                array_push($list,$v);
            }
        }

        $this->success("成功!", $list);
    }
    public function question()
    {
        $GxzhQuestionModel = new GxzhQuestionModel();
        //未登录显示出价高的10个
        $data = $this->request->param();
        $where = [];
        $order = '';
        $page = 1;
        $question_ids = [];
        if($data['type']=='grab'){
            $where['service_id'] = 0;//公开提问
            if(!empty($data['city'])){
                $city = Db::name('city')->where(['city'=>['like',"%{$data['city']}%"]])->find();
            }
            if(!empty($data['city']) && !empty($city['code'])){
                $where['city'] = $city['code'];
            }
            $where['status'] = 0;
            if (empty($this->userId) || empty($this->user['dept1'])){
                if($data['page']>1){
                    $this->success("成功!", []);
                }
                $order = 'money DESC';
                $page = 1;
                $list = $GxzhQuestionModel->qList($where,$order,$page);
                $this->success("成功!", $list);
            }else{
                //登陆后显示相关领域的问题
                $order = 'id DESC';
                $page = $data['page'];
                
                $where['id'] = [['>',0]];
                
                //if(empty($this->user['dept1'])){
                //    $this->error("请到“我的”里面的”擅长领域“选择擅长领域，才能正常抢单!", []);
                //}
                if($this->user['dept2']){
                    $dept2 = explode(',',$this->user['dept2']);
                    $question_ids = Db::name("gxzh_relation")->where(['type'=>2,'dept_id'=>['in',$dept2]])->column('question_id');
                    if(!empty($question_ids)){
                        $where['id'] = [['in',$question_ids]];
                    }
                }else{
                    $question_ids = Db::name("gxzh_question")->where(['dept1'=>$this->user['dept1']])->column('id');
                    if(!empty($question_ids)){
                        $where['id'] = [['in',$question_ids]];
                    }
                }

                //排除已抢问题
                $grabed_ids = Db::name("gxzh_answer")->where(['doctor_uid'=>$this->userId])->column('question_id');
                $notin = ['not in',$grabed_ids];
                array_push($where['id'],$notin);
            }
        }
        if (empty($this->userId)){
            $this->error(['code' => 10001, 'msg' => '登录已失效!']);
        }
        if($data['type']=='grabed'){
            $question_ids = Db::name("gxzh_answer")->where(['doctor_uid'=>$this->userId,'status'=>1])->column('question_id');
            $where['id'] = ['in',$question_ids];
        }
        if($data['type']=='inanswer'){
            $question_ids = Db::name("gxzh_answer")->where(['doctor_uid'=>$this->userId,'status'=>2,'chat_state'=>0])->column('question_id');
            $where['id'] = ['in',$question_ids];
        }
        if($data['type']=='done'){
            $question_ids = Db::name("gxzh_answer")->where(['doctor_uid'=>$this->userId,'chat_state'=>1])->column('question_id');
            $where['id'] = ['in',$question_ids];
        }
        $order = 'id DESC';
        $list = $GxzhQuestionModel->qList($where,$order,$page);
        if($data['type']=='inanswer' || $data['type']=='done'){
            foreach ($list as $k=>$v){
                $list[$k]['doctor_uid'] = $this->userId;
                $list[$k]['answer_id'] = Db::name("gxzh_answer")->where(['doctor_uid'=>$this->userId,'question_id'=>$v['id'],'status'=>2,'chat_state'=>0])->value('id');
            }
        }
        
        $this->success("成功!", $list);
    }
    public function question_detail()
    {
        $GxzhQuestionModel = new GxzhQuestionModel();
        //问题详情
        $data = $this->request->param();
        $info = $GxzhQuestionModel->qInfo($data['id']);
        
        $this->success("成功!", $info);
    }
    public function qrcode()
    {
        //二维码
        $data = $this->request->param();
        $invite_code = Db::name("user")->where(['id'=>$data['uid']])->value('invite_code');
        $url = $this->request->domain() . '/web/rshare.html?q=' . $invite_code;
        $qrCode = new \Endroid\QrCode\QrCode($url);
        $qrCode->setSize(300);
        header('Content-Type: ' . $qrCode->getContentType());
        echo $qrCode->writeString();
        exit;
    }
    public function wxpaynotify()
    {
        //微信支付回调
        $GxzhMoneyLogModel = new \app\api\model\GxzhMoneyLogModel();
        $wxpay = Pay::wechat($this->wxpay_config);
        try{
            $data = $wxpay->verify(); // 是的，验签就这么简单！
            file_put_contents(LOG_PATH.'debug.txt',json_encode($data).PHP_EOL,FILE_APPEND);
            //{"appid":"wxfa3743a3449532de","attach":"pay","bank_type":"CFT","cash_fee":"1","fee_type":"CNY","is_subscribe":"Y","mch_id":"1522861901","nonce_str":"1ykItm2fVFKbzA5g","openid":"oyqI91Hujx_BtOlkpkdb_8kLMMDw","out_trade_no":"5c6d0e0f927b1","result_code":"SUCCESS","return_code":"SUCCESS","time_end":"20190220162141","total_fee":"1","trade_type":"JSAPI","transaction_id":"4200000257201902209701677843"}
            if($data['result_code'] == 'SUCCESS'){
                $orderinfo = Db::name("gxzh_order")->where(['out_trade_no'=>$data['out_trade_no']])->find();
                if(empty($orderinfo)){
                    echo 'fail';
                }
                $trade_no_arr = explode('_',$data['out_trade_no']);

                $orderdata = [
                    'wechat_trade_no' => $data['transaction_id'],
                    'pay_status' => 1,
                    'updated_at' => time(),
                ];
                Db::name("gxzh_order")->where(['out_trade_no'=>$data['out_trade_no']])->update($orderdata);

                if($trade_no_arr[0]=='recharge'){
                    $GxzhMoneyLogModel->addLog($trade_no_arr[1],1,'recharge',$orderinfo['money'],'+','微信充值','');
                    return $wxpay->success()->getContent();
                }
                if($trade_no_arr[0]=='pitchon'){
                    $answerinfo = Db::name("gxzh_answer")->where(['id'=>$trade_no_arr[1]])->find();
                    if($answerinfo['pay_status']==1){//已支付
                        return $wxpay->success()->getContent();
                    }
                    $ansdata = [
                        'status' => 2,
                        'coupon_id' => !empty($orderinfo['coupon_id'])?$orderinfo['coupon_id']:0,
                        'out_trade_no' => $data['out_trade_no'],
                        'money' => $orderinfo['money'],
                        'pay_type' => 'wechat',
                        'pay_status' => 1,
                    ];
                    Db::startTrans();
                    $res1 = Db::name('gxzh_answer')->where(['id'=>$answerinfo['id']])->update($ansdata);
                    $service_id = Db::name('gxzh_question')->where(['id'=>$answerinfo['question_id']])->value('service_id');
                    if($service_id>0){
                        $pitchonmsg1 = '选择专家';
                        $pitchonmsg2 = '你已被选为回答者，请及时答复';
                    }else{
                        $pitchonmsg1 = '选择抢单专家';
                        $pitchonmsg2 = '你已被选为回答者，请及时答复';
                    }
                    $res2 = $GxzhMoneyLogModel->addLog($answerinfo['uid'],1,'recharge',$orderinfo['money'],'+','微信支付',$data['out_trade_no']);
                    $res3 = $GxzhMoneyLogModel->addLog($answerinfo['uid'],1,'pitchon',$orderinfo['money'],'-',$pitchonmsg1,$data['out_trade_no']);
                    //$res4 = $GxzhMoneyLogModel->addLog($answerinfo['doctor_uid'],1,'pitchon',$answerinfo['price'],'+',$pitchonmsg2,$data['out_trade_no']);
                    $res5 = savemsg($pitchonmsg2,$answerinfo['doctor_uid'],$pitchonmsg2);

                    if ($res1 && $res2 && $res3 && $res5) {
                        Db::commit();
                        if($orderinfo['coupon_id']){
                            Db::name('gxzh_coupon')->where(['id'=>$orderinfo['coupon_id']])->update(['status'=>1]);
                        }
                        return $wxpay->success()->getContent();
                    }else{
                        Db::rollback();
                        $this->success("失败!");
                    }
                }
            }else{
                echo 'fail';
            }

            Log::debug('Wechat notify', $data->all());
        } catch (\Exception $e) {
            echo $e->getMessage();
        }

    }
    public function alipaynotify()
    {
        //支付宝回调
        $GxzhMoneyLogModel = new \app\api\model\GxzhMoneyLogModel();
        $alipay = Pay::alipay($this->alipay_config);
        try{
            $data = $alipay->verify(); // 是的，验签就这么简单！
            // 请自行对 trade_status 进行判断及其它逻辑进行判断，在支付宝的业务通知中，只有交易通知状态为 TRADE_SUCCESS 或 TRADE_FINISHED 时，支付宝才会认定为买家付款成功。
            // 1、商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号；
            // 2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）；
            // 3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）；
            // 4、验证app_id是否为该商户本身。
            // 5、其它业务逻辑情况
            file_put_contents(LOG_PATH.'debug.txt',json_encode($data).PHP_EOL,FILE_APPEND);
            //{"gmt_create":"2019-02-20 16:20:18","charset":"utf8","seller_email":"molojia@dahebo.com","subject":"\u793e\u4ea4\u7c7bAPP","sign":"W1pcjHYDTf6Lic6FolnbyyIIAOZmXL57\/HQ65zs6XM3fyUbZ9l72Jsfluishjaz7mdUD+xL2xNvjDuqAGZ\/ss0D5F+agxgv+h5Fuhh3w42\/9w3dpPq0JkeyP4y818aOdO337HeLS4e2t8O8vHz6fwzNQnHdJrG4OPphvE0OdFx+O3h6FtbmLKXb+4cvmHHQyFaldxvUoMj2J3vJG65yVpQyR3g7MWl0QJAVfzsZbXeu7hzpEE+jKNVge0CWWZXmgbQfUCdD7Z+sZHLJe61GOuFqgUkVGgIqY+8A+I+wyPOKc9BppbGouX0wEHQ54NQXLfaGKZOuznGSvzS12VKFpaQ==","buyer_id":"2088602048193964","invoice_amount":"0.01","notify_id":"2019022000222162019093961053016447","fund_bill_list":"[{\"amount\":\"0.01\",\"fundChannel\":\"ALIPAYACCOUNT\"}]","notify_type":"trade_status_sync","trade_status":"TRADE_SUCCESS","receipt_amount":"0.01","buyer_pay_amount":"0.01","app_id":"2018092661502502","sign_type":"RSA2","seller_id":"2088231888565628","gmt_payment":"2019-02-20 16:20:18","notify_time":"2019-02-20 16:20:19","version":"1.0","out_trade_no":"5c6d0dbba9074","total_amount":"0.01","trade_no":"2019022022001493961021880472","auth_app_id":"2018092661502502","buyer_logon_id":"410***@qq.com","point_amount":"0.00"}
            if($data['trade_status'] == 'TRADE_SUCCESS' || $data['trade_status'] == 'TRADE_FINISHED'){
                $orderinfo = Db::name("gxzh_order")->where(['out_trade_no'=>$data['out_trade_no']])->find();
                if(empty($orderinfo)){
                    echo 'fail';
                }
                $trade_no_arr = explode('_',$data['out_trade_no']);

                $orderdata = [
                    'alipay_trade_no' => $data['trade_no'],
                    'pay_status' => 1,
                    'updated_at' => time(),
                ];
                Db::name("gxzh_order")->where(['out_trade_no'=>$data['out_trade_no']])->update($orderdata);

                if($trade_no_arr[0]=='recharge'){
                    $GxzhMoneyLogModel->addLog($trade_no_arr[1],1,'recharge',$orderinfo['money'],'+','支付宝充值','');
                    return $alipay->success()->getContent();
                }
                if($trade_no_arr[0]=='pitchon'){
                    $answerinfo = Db::name("gxzh_answer")->where(['id'=>$trade_no_arr[1]])->find();
                    if($answerinfo['pay_status']==1){//已支付
                        return $alipay->success()->getContent();
                    }
                    $ansdata = [
                        'status' => 2,
                        'coupon_id' => !empty($orderinfo['coupon_id'])?$orderinfo['coupon_id']:0,
                        'out_trade_no' => $data['out_trade_no'],
                        'money' => $orderinfo['money'],
                        'pay_type' => 'alipay',
                        'pay_status' => 1,
                    ];
                    Db::startTrans();
                    $res1 = Db::name('gxzh_answer')->where(['id'=>$answerinfo['id']])->update($ansdata);
                    $service_id = Db::name('gxzh_question')->where(['id'=>$answerinfo['question_id']])->value('service_id');
                    if($service_id>0){
                        $pitchonmsg1 = '选择专家';
                        $pitchonmsg2 = '你已被选为回答者，请及时答复';
                    }else{
                        $pitchonmsg1 = '选择抢单专家';
                        $pitchonmsg2 = '你已被选为回答者，请及时答复';
                    }
                    $res2 = $GxzhMoneyLogModel->addLog($answerinfo['uid'],1,'recharge',$orderinfo['money'],'+','支付宝支付',$data['out_trade_no']);
                    $res3 = $GxzhMoneyLogModel->addLog($answerinfo['uid'],1,'pitchon',$orderinfo['money'],'-',$pitchonmsg1,$data['out_trade_no']);
                    //$res4 = $GxzhMoneyLogModel->addLog($answerinfo['doctor_uid'],1,'pitchon',$answerinfo['price'],'+',$pitchonmsg2,$data['out_trade_no']);
                    $res5 = savemsg($pitchonmsg2,$answerinfo['doctor_uid'],$pitchonmsg2);

                    if ($res1 && $res2 && $res3 && $res5) {
                        Db::commit();
                        if($orderinfo['coupon_id']){
                            Db::name('gxzh_coupon')->where(['id'=>$orderinfo['coupon_id']])->update(['status'=>1]);
                        }
                        return $alipay->success()->getContent();
                    }else{
                        Db::rollback();
                        $this->success("失败!");
                    }
                }
            }else{
                echo 'fail';
            }

            Log::debug('Alipay notify', $data->all());
        } catch (\Exception $e) {
            echo $e->getMessage();
        }
    }

    public function delay()
    {
        $GxzhMoneyLogModel = new \app\api\model\GxzhMoneyLogModel();
        $delay_days = get_config('delay_days');
        $list = Db::name("gxzh_answer")->where(['endtime'=>['<',time()-$delay_days*86400],'isclose'=>0])->select();
        //echo Db::name("gxzh_answer")->getLastSql();die;
        foreach ($list as $v){
            //正在退款的跳过
            $refund = Db::name("gxzh_refund")->where(['out_trade_no'=>$v['out_trade_no'],'status'=>0])->find();
            if($refund){
                continue;
            }
            //计算金额，订单金额+红包金额-退款金额
            $redpack = Db::name('gxzh_redpack')->where(['out_trade_no'=>$v['out_trade_no']])->sum('money');
            $refund = Db::name('gxzh_refund')->where(['out_trade_no'=>$v['out_trade_no'],'status'=>1])->sum('money');
            $money = $v['money'] + $redpack - $refund;
            if($money>0){
                $GxzhMoneyLogModel->addLog($v['doctor_uid'],1,'pitchon',$money,'+','回答问题奖励',$v['out_trade_no']);
            }
            Db::name("gxzh_answer")->where(['id'=>$v['id']])->update(['isclose'=>1]);
        }
    }

    public function report_day()
    {
        $list = Db::name("user")->field('id')->where(['user_type'=>2])->select()
                ->each(function ($item, $key) {
                    $income = Db::name("gxzh_money_log")->where(['created_at'=>['between',[strtotime(date('Y-m-d',time()-86400)),strtotime(date('Y-m-d'))]],'uid'=>$item['id'],'type'=>1,'action'=>'pitchon','op'=>'+'])->sum('amount');
                    if($income>0){
                        push('gxzh_'.$item['id'], '您的昨日收入：'.$income.'元');
                        //echo $item['id'].'您的昨日收入：'.$income.'元';
                    }
                    return $item;
                });
    }

    public function report_month()
    {
        $list = Db::name("user")->field('id')->where(['user_type'=>2])->select()
                ->each(function ($item, $key) {
                    $income = Db::name("gxzh_money_log")->where(['created_at'=>['between',[strtotime(date('Y-m-01 00:00:00',strtotime('-3 month'))),strtotime(date("Y-m-d 23:59:59", strtotime(-date('d').'day')))]],'uid'=>$item['id'],'type'=>1,'action'=>'pitchon','op'=>'+'])->sum('amount');
                    if($income>0){
                        push('gxzh_'.$item['id'], '您的近三个月收入：'.$income.'元');
                        //echo $item['id'].'您的昨日收入：'.$income.'元';
                    }
                    return $item;
                });
    }

    public function clear_day()
    {//确认问题解决，30天后清理聊天记录
        $list = Db::name("gxzh_answer")->where(['chat_state'=>1,'endtime'=>['<',time()-86400*30]])->select()
                ->each(function ($item, $key) {
                    Db::name("gxzh_chatlog")->where(['order_id'=>$v['id']])->delete();
                    return $item;
                });
        //echo Db::name("gxzh_answer")->getLastSql();die;
    }
}
