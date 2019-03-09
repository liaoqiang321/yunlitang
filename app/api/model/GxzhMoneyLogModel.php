<?php
namespace app\api\model;

use think\Db;
use think\Model;

class GxzhMoneyLogModel extends Model
{
    public function addLog($uid,$type,$action,$amount,$op,$msg,$order_id)
    {
        $before = $this->balance($uid,$type);
        $data = [
            'uid' => $uid,
            'type' => $type,
            'action' => $action,
            'before' => $before??0,
            'after'  => $op=='+'?($before+$amount) : ($before-$amount),
            'amount' => $amount,
            'op'     => $op,
            'msg'    => $msg,
            'order_id' => $order_id,
            'created_at' => time(),
        ];
        return Db::name("gxzh_money_log")->insert($data);
    }
    
    public function balance($uid,$type)
    {
        return Db::name("gxzh_money_log")->where(['uid'=>$uid,'type'=>$type])->order('id DESC')->value('after');
    }

    public function income_expend($uid,$type)
    {
        $income = Db::name("gxzh_money_log")->where(['uid'=>$uid,'type'=>$type,'action'=>'pitchon','op'=>'+'])->sum('amount');
        $expend = Db::name("gxzh_money_log")->where(['uid'=>$uid,'type'=>$type,'action'=>'pitchon','op'=>'-'])->sum('amount');
        return ['income'=>$income,'expend'=>$expend];
    }
}
