<?php
namespace app\api\controller;

use think\exception\HttpResponseException;
use think\Request;
use think\Response;
use think\Db;
use Yansongda\Pay\Pay;
use Yansongda\Pay\Log;

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-Requested-With,Content-Type,XX-Device-Type,XX-Token,XX-Api-Version,XX-Wxapp-AppId,Origin,Accept,token");
header('Access-Control-Allow-Methods: GET,POST,PATCH,PUT,DELETE,OPTIONS');

class ApiBaseController
{
    protected $token = '';
    protected $userId = 0;
    protected $user;
    protected $request;
    protected $alipay_config;
    protected $wxpay_config;

    /**
     * 架构函数
     * @param Request $request Request对象
     * @access public
     */
    public function __construct(Request $request = null)
    {
        //打印请求日志
        file_put_contents(LOG_PATH.'api.txt','req => '.json_encode($_REQUEST,JSON_UNESCAPED_UNICODE).PHP_EOL,FILE_APPEND);
        
        if (is_null($request)) {
            $request = Request::instance();
        }

        Request::instance()->root(cmf_get_root() . '/');

        $this->request = $request;

        // 用户验证初始化
        $this->_initUser();
        // 控制器初始化
        $this->initialize();

        $this->wxpay_config = [
            'appid' => config('wx_app_id'), // APP APPID
            'app_id' => '', // 公众号 APPID
            'miniapp_id' => config('wx_mini_app_id'), // 小程序 APPID
            'mch_id' => config('wx_mchid'),
            'key' => config('wx_apikey'),
            'notify_url' => $this->request->domain().'/api/public/wxpaynotify',
            //'cert_client' => './cert/apiclient_cert.pem', // optional，退款等情况时用到
            //'cert_key' => './cert/apiclient_key.pem',// optional，退款等情况时用到
            'log' => [ // optional
                'file' => LOG_PATH.'wechat.log',
                'level' => 'info', // 建议生产环境等级调整为 info，开发环境为 debug
                'type' => 'single', // optional, 可选 daily.
                'max_file' => 30, // optional, 当 type 为 daily 时有效，默认 30 天
            ],
            'http' => [ // optional
                'timeout' => 5.0,
                'connect_timeout' => 5.0,
                // 更多配置项请参考 [Guzzle](https://guzzle-cn.readthedocs.io/zh_CN/latest/request-options.html)
            ],
            //'mode' => 'dev', // optional, dev/hk;当为 `hk` 时，为香港 gateway。
        ];

        $this->alipay_config = [
            'app_id' => config('alipay_app_id'),
            'notify_url' => $this->request->domain().'/api/public/alipaynotify',
            //'return_url' => 'http://yansongda.cn/return.php',
            'ali_public_key' => config('alipay_alipay_public_key'),
            // 加密方式： **RSA2**  
            'private_key' => config('alipay_merchant_private_key'),
            'log' => [ // optional
                'file' => LOG_PATH.'alipay.log',
                'level' => 'info', // 建议生产环境等级调整为 info，开发环境为 debug
                'type' => 'single', // optional, 可选 daily.
                'max_file' => 30, // optional, 当 type 为 daily 时有效，默认 30 天
            ],
            'http' => [ // optional
                'timeout' => 5.0,
                'connect_timeout' => 5.0,
                // 更多配置项请参考 [Guzzle](https://guzzle-cn.readthedocs.io/zh_CN/latest/request-options.html)
            ],
            //'mode' => 'dev', // optional,设置此参数，将进入沙箱模式
        ];

    }

    // 初始化
    protected function initialize()
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-Requested-With,Content-Type,XX-Device-Type,XX-Token,XX-Api-Version,XX-Wxapp-AppId,Origin,Accept,token");
        header('Access-Control-Allow-Methods: GET,POST,PATCH,PUT,DELETE,OPTIONS');
    }

    private function _initUser()
    {
        $token      = $this->request->header('token');
        if (empty($token)) {
            return;
        }

        $this->token = $token;

        $user = Db::name('ylt_user')
            ->where(['token' => $token])
            ->find();
            //echo Db::getLastSql();die;
        if (!empty($user)) {
//            if($user['user_status']==0){
//                $this->error('您已被拉黑!');
//            }
            $this->user     = $user;
            $this->userId   = $user['id'];
        }
        
    }

    /**
     * 操作成功跳转的快捷方法
     * @access protected
     * @param mixed $msg 提示信息
     * @param mixed $data 返回的数据
     * @param array $header 发送的Header信息
     * @return void
     */
    protected function success($msg = '', $data = '', array $header = [])
    {
        $code   = 0;
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
        ];

        $type                                   = $this->getResponseType();
        $header['Access-Control-Allow-Origin']  = '*';
        $header['Access-Control-Allow-Headers'] = 'X-Requested-With,Content-Type,XX-Device-Type,XX-Token,XX-Api-Version,XX-Wxapp-AppId,Origin,Accept,token';
        $header['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,PUT,DELETE,OPTIONS';
        $response                               = Response::create($result, $type)->header($header);
        
        file_put_contents(LOG_PATH.'api.txt','ret => '.json_encode($result,JSON_UNESCAPED_UNICODE).PHP_EOL,FILE_APPEND);

        throw new HttpResponseException($response);
    }

    /**
     * 操作错误跳转的快捷方法
     * @access protected
     * @param mixed $msg 提示信息,若要指定错误码,可以传数组,格式为['code'=>您的错误码,'msg'=>'您的错误消息']
     * @param mixed $data 返回的数据
     * @param array $header 发送的Header信息
     * @return void
     */
    protected function error($msg = '', $data = '', array $header = [])
    {
        $code = 1;
        if (is_array($msg)) {
            $code = $msg['code'];
            $msg  = $msg['msg'];
        }
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
        ];

        $type                                   = $this->getResponseType();
        $header['Access-Control-Allow-Origin']  = '*';
        $header['Access-Control-Allow-Headers'] = 'X-Requested-With,Content-Type,XX-Device-Type,XX-Token,XX-Api-Version,XX-Wxapp-AppId,Origin,Accept,token';
        $header['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,PUT,DELETE,OPTIONS';
        $response                               = Response::create($result, $type)->header($header);
        throw new HttpResponseException($response);
    }

    /**
     * 获取当前的response 输出类型
     * @access protected
     * @return string
     */
    protected function getResponseType()
    {
        return 'json';
    }

}