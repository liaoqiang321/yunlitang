<?php
namespace app\api\model;

use think\Db;
use think\Model;

class GxzhQuestionModel extends Model
{
    public function qList($where = [],$order = [],$page = 1){
        $list = Db::name("gxzh_question")->field('id,uid,title,province,city,money,created_at')->where($where)->order($order)->page($page.',10')->select()
                ->each(function ($item, $key) {
                    $item['province'] = getprovincenamebycode($item['province']);
                    $item['city'] = getcitynamebycode($item['city']);
                    $item['created_at'] = date('Y-m-d H:i:s',$item['created_at']);
                    return $item;
                })->toArray();
        //echo Db::name("gxzh_question")->getLastSql();die;
        return $list;
    }
    public function qInfo($id)
    {
        $info = Db::name('gxzh_question')->field('id,uid,title,province,city,money,content,imgs,status,created_at')->where(['id'=>$id])->find();
        $info['imgs'] = explode(',',$info['imgs']);
        if(!empty($info['imgs'][0])){
            foreach($info['imgs'] as $k=>$v) {
                $info['imgs'][$k] = request()->domain().$v;
            }
        }else{
            $info['imgs'] = [];
        }
        $info['created_at'] = date('Y-m-d H:i:s',$info['created_at']);
        $info['city'] = getcitynamebycode($info['city']);
        $info['province'] = getprovincenamebycode($info['province']);

        $info['answers'] = Db::name('gxzh_answer')->field('id,doctor_uid as uid,price,grasp_rate,content,status,chat_state,pay_status,out_trade_no')->where(['question_id'=>$id])->select()
                        ->each(function ($item, $key) {
                            $userinfo = Db::name("user")->field('avatar,user_nickname,dept1,level,star,organization,auth_identity,auth_title,auth_work,auth_other1,auth_other2,other1,other2')->where(['id'=>$item['uid']])->find();
                            $item['avatar'] = $userinfo['avatar']?request()->domain().'/'.$userinfo['avatar'] : request()->domain().get_config('avatar');
                            $item['user_nickname'] = $userinfo['user_nickname'];
                            $item['dept1'] = getdeptnamebyids($userinfo['dept1']);
                            $item['level'] = getlevelbyid($userinfo['level']);
                            $item['level_code'] = $userinfo['level'];
                            $item['star'] = $userinfo['star'];
                            $item['organization'] = $userinfo['organization'];
                            $item['auth_identity'] = $userinfo['auth_identity'];
                            $item['auth_title'] = $userinfo['auth_title'];
                            $item['auth_work'] = $userinfo['auth_work'];
                            $item['auth_other1'] = $userinfo['auth_other1'];
                            $item['auth_other2'] = $userinfo['auth_other2'];
                            $item['other1'] = $userinfo['other1'];
                            $item['other2'] = $userinfo['other2'];
                            if($item['chat_state'] == 1){
                                $item['status'] = 'done';
                            }elseif($item['status']==2 && $item['pay_status']==1){
                                $item['status'] = 'selected';
                            }else{
                                $item['status'] = 'selectable';
                            }

                            if($item['chat_state'] == 1){
                                $refund_info = Db::name("gxzh_refund")->where(['out_trade_no'=>$item['out_trade_no']])->order('id DESC')->find();
                                if($refund_info){
                                    if($refund_info['status']==0){
                                        $item['refund_status'] = 'doing';
                                    }
                                    if($refund_info['status']==1){
                                        $item['refund_status'] = 'done';
                                    }
                                    if($refund_info['status']==2){
                                        $item['refund_status'] = 'allow';
                                    }
                                }else{
                                    $item['refund_status'] = 'allow';
                                }
                            }

                            unset($item['chat_state']);
                            unset($item['pay_status']);
                            return $item;
                        });
        return $info;
    }
}
