<?php
/**
 * 配置文件
 */

return [
    // 数据库类型
    'type'     => getenv('PHP_DB_TYPE'),
    // 服务器地址
    'hostname' => getenv('PHP_DB_HOSTNAME'),
    // 数据库名
    'database' => getenv('PHP_DB_DATABASE'),
    // 用户名
    'username' => getenv('PHP_DB_USERNAME'),
    // 密码
    'password' => getenv('PHP_DB_PASSWORD'),
    // 端口
    'hostport' => getenv('PHP_DB_HOSTPORT'),
    // 数据库编码默认采用utf8
    'charset'  => getenv('PHP_DB_CHARSET'),
    // 数据库表前缀
    'prefix'   => getenv('PHP_DB_PREFIX'),
    "authcode" => getenv('PHP_DB_AUTHCODE'),
    //#COOKIE_PREFIX#
];
