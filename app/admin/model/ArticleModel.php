<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\admin\model;

use think\Model;

class ArticleModel extends Model
{
    protected $table = 'cmf_ylt_article';
    protected $autoWriteTimestamp = true;
//    public function comment()
//    {
//       return $this->hasMany('CommentModel', 'comment_id');
//    }
    public function preview_img($list, $domain)
    {
        if (!empty($list)){
            foreach ($list as $item){
                $data = [];
                $item['cover'] = json_decode($item['cover']);
                if (!empty($item['cover'])){
                    foreach ($item['cover'] as $k => $v){
                        $data[$k] = $domain . '/upload/' . $v;
                    }
                }
                $item['cover'] = $data;
            }
        }
        return $list;
    }
}
