<?php
namespace app\api\model;

use app\admin\model\ArticleModel;
use think\Db;
use think\Model;

class PraiseModel extends Model
{
    protected $table = 'cmf_ylt_praise';
    protected $autoWriteTimestamp = true;

//    public function get_comment_user($list)
//    {
//        foreach ($list as $item){
//            $user_info = $this->where('id', $item['user_id'])->find();
//            $item['nick_name'] = $user_info['nick_name'];
//            $item['avatar'] = $user_info['avatar'];
//            $item['camera_user_id'] = $user_info['id'];
//        }
//        return $list;
//    }
    public function praise_count($article_id)
    {
        $praise_count = $this->where('article_id', $article_id)->count();
        return $praise_count;
    }
}
