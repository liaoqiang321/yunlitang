<?php
/**
 * 配置文件
 */

return [
    'log' => [
        // 日志记录方式，内置 file socket 支持扩展
        'type'  => 'File',
        // 日志保存目录
        'path'  => LOG_PATH,
        // 日志记录级别
        'level' => ['error'],
    ],

    //'url_html_suffix' => false,
/*
    'sms_config' => [
        // HTTP 请求的超时时间（秒）
        'timeout' => 5.0,
        // 默认发送配置
        'default' => [
            // 网关调用策略，默认：顺序调用
            'strategy' => \Overtrue\EasySms\Strategies\OrderStrategy::class,
            // 默认可用的发送网关
            'gateways' => [
                'aliyun',
            ],
        ],
        // 可用的网关配置
        'gateways' => [
            'errorlog' => [
                'file' => LOG_PATH . '/easy-sms.log',
            ],
            'aliyun' => [
                'access_key_id' => 'LTAIuJo5CjFPz7hX',
                'access_key_secret' => 'Axu1luoQIDkQUXMImhaIMBLchIalgL',
                'sign_name' => 'xiangju百年',
            ],
            //...
        ],
    ],
*/
];
