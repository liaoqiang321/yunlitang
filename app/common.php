<?php
use think\Db;
function sendsms($mobile,$code)
{
    $sms_config = config('sms_config');
    $easySms = new \Overtrue\EasySms\EasySms($sms_config);
    $res = $easySms->send($mobile, [
        'content'  => "您的验证码{$code}，该验证码5分钟内有效，请勿泄漏于他人！",
        'template' => 'SMS_157277948',
        'data' => [
            'code' => $code
        ],
    ]);
    
    //var_dump($res);die;
    //array(1) { ["aliyun"]=> array(3) { ["gateway"]=> string(6) "aliyun" ["status"]=> string(7) "success" ["result"]=> array(4) { ["Message"]=> string(2) "OK" ["RequestId"]=> string(36) "7D2084BD-CAEA-42FB-8D36-74E5E2700F59" ["BizId"]=> string(20) "862908142768032530^0" ["Code"]=> string(2) "OK" } } }
    if (isset($res['aliyun']['status']) && $res['aliyun']['status'] == 'success') {
        return true;
    } else {
        return false;
    }
}

function get_rand_str($len){

    $str = "1234567890asdfghjklqwertyuiopzxcvbnm";

    return substr(str_shuffle($str),0,$len);

}

function get_config($key)
{
    $gxzh_config = cache('gxzh_config');
    if (empty($gxzh_config)) {
        $gxzh_config = Db::name('gxzh_config')->select()->toArray();
        cache('gxzh_config', $gxzh_config);
    }
    $configValue = '';
    foreach ($gxzh_config as $v){
        if ($v['name'] == $key) {
            $configValue = trim($v['value']);
            if($v['type']==4){
                $arr = explode(PHP_EOL, $v['value']);
                $new_arr = [];
                foreach($arr as $a){
                    if(strpos($a,':')){
                        $s = explode(':',$a);
                        array_push($new_arr, ['k'=>trim($s[0]),'v'=>trim($s[1])]);
                    }else{
                        array_push($new_arr, trim($a));
                    }
                }
                $configValue = $new_arr;
            }
            break;
        }
    }
    return $configValue;
}

function getcitynamebycode($code){
    $gxzh_city = cache('gxzh_city');
    if (empty($gxzh_city)) {
        $gxzh_city = Db::name('city')->select()->toArray();
        cache('gxzh_city', $gxzh_city);
    }
    $city = '';
    foreach($gxzh_city as $v) {
        if ($v['code']==$code){
            $city = $v['city'];
            break;
        }
    }
    return $city;
}

function getprovincenamebycode($code){
    $gxzh_province = cache('gxzh_province');
    if (empty($gxzh_province)) {
        $gxzh_province = Db::name('province')->select()->toArray();
        cache('gxzh_province', $gxzh_province);
    }
    $province = '';
    foreach($gxzh_province as $v) {
        if ($v['code']==$code){
            $province = $v['province'];
            break;
        }
    }
    return $province;
}

function getdeptnamebyids($ids){
    $gxzh_department = cache('gxzh_department');
    if (empty($gxzh_department)) {
        $gxzh_department = Db::name('gxzh_department')->select()->toArray();
        cache('gxzh_department', $gxzh_department);
    }
    $dept = [];
    $ids = explode(',', $ids);
    foreach($gxzh_department as $v) {
        if ($ids && in_array($v['id'], $ids)){
            $dept[] = $v['name'];
        }
    }
    return implode(',', $dept);
}

function getservice($id){
    $service_info = Db::name("gxzh_service")->where(['uid'=>$id])->select()->toArray();
    $services = get_config('SERVICE_TYPE');
    $s = [];
    foreach($service_info as $v){
        foreach($services as $vv){
            if($v['service'] == $vv['k']){
                $s[] = $vv['v'].$v['price'].'元';
            }
        }
    }
    $str = implode(',',$s);
    return $str;
}

function getlevelbyid($id){
    $level = get_config('LEVEL');
    $lvl = '';
    foreach($level as $v) {
        if($v['k'] == $id){
            $lvl = $v['v'];
            break;
        }
    }
    return $lvl;
}

function savemsg($title,$uid,$content){
    //站内消息
    $data = [
        'uid' => $uid,
        'title' => $title,
        'type' => 2,
        'content' => $content,
        'status' => 0,
        'created_at' => time(),
    ];
    
    $result = Db::name("gxzh_msg")->insertGetId($data);
    if (empty($result)) {
        return false;
    }
    push('gxzh_'.$uid, $title);
    return true;
}

function filter_words($content)
{
    $keywords = get_config('keywords');
    $keywords = str_replace('，',',',$keywords);
    $keywords = explode(',',$keywords);
    foreach($keywords as $v){
        $content = str_replace(trim($v),'**',$content);
    }
    return $content;
}

function push($uid, $title)
{
    $client = new \JPush\Client(config('app_key'), config('master_secret'), LOG_PATH.'push.txt');

    //$device = $client->device();
    //$d = $device->getAliasDevices('myalias');
    //var_dump($d);die;

    try {
        $push = $client->push();
        $response = $push
            //->setCid('xxxxxx') // 可选	用于防止 api 调用端重试造成服务端的重复推送而定义的一个标识符。
            ->setPlatform('all')
            //->addTag(['tag1', 'tag2'])
            ->addAlias($uid)
            ->setNotificationAlert($title)

            //->iosNotification('hello', [
            //'sound' => 'sound',
            //'badge' => '+1',
            //'extras' => [
            //    'key' => 'value'
            //]
            //])

            //->androidNotification('hello')

            ->message($title, [
            //'title' => 'Hello',
            //'content_type' => 'text',
            'extras' => [
                'key' => 'value'
            ]
            ])

            ->send();
    } catch (\JPush\Exceptions\APIConnectionException $e) {
        // try something here
        //print $e;
    } catch (\JPush\Exceptions\APIRequestException $e) {
        // try something here
        //print $e;
    }
}

function pushAll($title)
{
    $client = new \JPush\Client(config('app_key'), config('master_secret'), LOG_PATH.'push.txt');

    try {
        $push = $client->push();
        $response = $push

            ->setPlatform('all')

            ->addAllAudience()
            ->setNotificationAlert($title)

            ->send();
    } catch (\JPush\Exceptions\APIConnectionException $e) {
        // try something here
        //print $e;
    } catch (\JPush\Exceptions\APIRequestException $e) {
        // try something here
        //print $e;
    }
}

function export_csv($filename,$data) { 
    header("Content-type:text/csv"); 
    header("Content-Disposition:attachment;filename=".$filename); 
    header('Cache-Control:must-revalidate,post-check=0,pre-check=0'); 
    header('Expires:0'); 
    header('Pragma:public'); 
    echo $data; 
}