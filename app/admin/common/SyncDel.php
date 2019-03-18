<?php
namespace app\admin\common;

use app\admin\model\ArticleModel;
use app\api\model\CommentModel;
use app\api\model\PraiseModel;

class SyncDel
{
    //删除文章时候，同时删除文章对应的评论
    public function sync_del($article_id)
    {
        $comment = new CommentModel();
        $praise = new PraiseModel();
        $result1 = $comment->where('article_id', $article_id)->delete();
        $result2 = $praise->where('article_id', $article_id)->delete();
        return $result2;
    }
}