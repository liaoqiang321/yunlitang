<?php
namespace app\api\model;

use app\admin\model\ArticleModel;
use think\Db;
use think\Model;

class CommentModel extends Model
{
    protected $table = 'cmf_ylt_comment';
    protected $autoWriteTimestamp = true;
//    public function hallList()
//    {
//        $hall = new ArticleModel();
//        $results = $hall->where('type', '礼堂')->select();
//        return $results;
//    }

    public function comment_count($article_id)
    {
        $comment = new CommentModel();
        $comment_count = $comment->where('user_id', cmf_get_current_user_id())->where('article_id', $article_id)->count();
        return $comment_count;
    }

    public function userInfo($id)
    {
//        $userinfo = [];
//        $user_info = Db::name("user")->where(['id'=>$id,'user_type'=>2])->find();
//        $service_info = Db::name("gxzh_service")->where(['uid'=>$id])->select()->toArray();
//        $services = get_config('SERVICE_TYPE');
//        //
//        $userinfo['id'] = $user_info['id'];
//        $userinfo['user_nickname'] = $user_info['user_nickname'];//昵称
//        $userinfo['user_login'] = $user_info['user_login'];//真实姓名;
//        $userinfo['sex'] = $user_info['sex'];
//        $userinfo['avatar'] = $user_info['avatar']?request()->domain().$user_info['avatar'] : request()->domain().get_config('avatar');
//        $userinfo['signature'] = $user_info['signature'];//简介
//        $userinfo['province'] = $user_info['province'];
//        $userinfo['province_name'] = getprovincenamebycode($user_info['province']);
//        $userinfo['city'] = $user_info['city'];
//        $userinfo['city_name'] = getcitynamebycode($user_info['city']);
//        $userinfo['dept1'] = $user_info['dept1'];
//        $userinfo['dept1_name'] = getdeptnamebyids($user_info['dept1']);
//        $userinfo['dept2'] = $user_info['dept2'];
//        $userinfo['dept2_name'] = getdeptnamebyids($user_info['dept2']);
//        $userinfo['organization'] = $user_info['organization'];
//        $userinfo['level'] = $user_info['level'];
//        $userinfo['level_name'] = getlevelbyid($user_info['level']);
//        $userinfo['star'] = $user_info['star'];
//        //$userinfo['max'] = $user_info['max'];
//        //$userinfo['min'] = $user_info['min'];
//        $userinfo['good_at'] = $user_info['good_at'];//擅长
//
//        $userinfo['auth_identity'] = $user_info['auth_identity'];
//        $userinfo['auth_title'] = $user_info['auth_title'];
//        $userinfo['auth_work'] = $user_info['auth_work'];
//        $userinfo['auth_other1'] = $user_info['auth_other1'];
//        $userinfo['auth_other2'] = $user_info['auth_other2'];
//
//        $userinfo['idcard'] = $user_info['idcard'];
//        $userinfo['idcard_pic1'] = $user_info['idcard_pic1']?request()->domain().$user_info['idcard_pic1'] : '';
//        $userinfo['idcard_pic2'] = $user_info['idcard_pic2']?request()->domain().$user_info['idcard_pic2'] : '';
//        $userinfo['work_year'] = $user_info['work_year'];
//        $userinfo['title_pic1'] = $user_info['title_pic1']?request()->domain().$user_info['title_pic1'] : '';
//        $userinfo['title_pic2'] = $user_info['title_pic2']?request()->domain().$user_info['title_pic2'] : '';
//        $userinfo['other1'] = $user_info['other1'];
//        $userinfo['other1_pic1'] = $user_info['other1_pic1']?request()->domain().$user_info['other1_pic1'] : '';
//        $userinfo['other1_pic2'] = $user_info['other1_pic2']?request()->domain().$user_info['other1_pic2'] : '';
//        $userinfo['other2'] = $user_info['other2'];
//        $userinfo['other2_pic1'] = $user_info['other2_pic1']?request()->domain().$user_info['other2_pic1'] : '';
//        $userinfo['other2_pic2'] = $user_info['other2_pic2']?request()->domain().$user_info['other2_pic2'] : '';
//
//        $userinfo['user_status'] = $user_info['user_status'];
//
//        //服务
//        $userinfo['service'] = [];
//        foreach($services as $k=>$v){
//            $selected = false;
//            $price = 0;
//            foreach($service_info as $vv){
//                if($v['k']==$vv['service']){
//                    $selected = true;
//                    $price = $vv['price'];
//                    break;
//                }
//            }
//            $s = [
//                'id' => $v['k'],
//                'name' => $v['v'],
//                'selected' => $selected,
//                'price' => $price
//            ];
//            array_push($userinfo['service'],$s);
//        }
//        return $userinfo;
    }
//    public function specialistInfo($id)
//    {
//        $userinfo = $this->userInfo($id);
//        unset($userinfo['idcard']);
//        unset($userinfo['idcard_pic1']);
//        unset($userinfo['idcard_pic2']);
//        //unset($userinfo['work_year']);
//        unset($userinfo['title_pic1']);
//        unset($userinfo['title_pic2']);
//        //unset($userinfo['other1']);
//        unset($userinfo['other1_pic1']);
//        unset($userinfo['other1_pic2']);
//        //unset($userinfo['other2']);
//        unset($userinfo['other2_pic1']);
//        unset($userinfo['other2_pic2']);
//
//        $userinfo['answer_count'] = Db::name("gxzh_answer")->where(['doctor_uid'=>$id,'status'=>2,'pay_status'=>1])->count();
//
//        return $userinfo;
//    }

//    public function userList($where = [],$order = [],$page = 1){
//        $list = Db::name("user")->field('id as uid,avatar,user_nickname,dept1,level,star,organization,good_at,max,min,auth_identity,auth_title,auth_work,auth_other1,auth_other2,other1,other2')->where($where)->orderRaw($order)->page($page.',10')->select()
//                ->each(function ($item, $key) {
//                    $item['avatar'] = $item['avatar']?request()->domain().'/'.$item['avatar'] : request()->domain().get_config('avatar');
//                    $item['dept1'] = getdeptnamebyids($item['dept1']);
//                    $item['level'] = getlevelbyid($item['level']);
//                    //$item['price'] = intval($item['min']) .'-'. intval($item['max']);
//                    //$item['count'] = Db::name("gxzh_answer")->where(['doctor_uid'=>$item['uid'],'status'=>2,'pay_status'=>1])->count();
//                    $item['price'] = getservice($item['uid']);
//                    return $item;
//                });
//        //echo Db::name("user")->getLastSql();die;
//        return $list;
//    }
}
