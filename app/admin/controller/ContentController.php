<?php
namespace app\admin\controller;

use app\admin\model\CameraModel;
use app\admin\model\CommentModel;
use app\admin\model\HallModel;
use app\admin\model\InformationModel;
use cmf\controller\AdminBaseController;

use think\Db;

/**
 * Class ContentController
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   =>'内容管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 0,
 *     'icon'   =>'',
 *     'remark' =>''
 * )
 */
class ContentController extends AdminBaseController
{

    /**
     * 礼堂管理
     * @adminMenu(
     *     'name'   => '礼堂管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function hall()
    {
        $hallModel = new HallModel();
        $hall = $hallModel->order('id', 'desc')->paginate('10');
        $this->assign("hall", $hall);
        return $this->fetch();
    }

    /**
     * 添加礼堂
     * @adminMenu(
     *     'name'   => '添加公礼堂',
     *     'parent' => 'hall',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function hall_add()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $resules['title'] = $data['title'];
            $resules['abstract'] = $data['abstract'];
            $resules['type'] = $data['type'];
            $resules['content'] = isset($data['content']) ? $data['content'] : '';
            $resules['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
            $resules['video'] = $data['post']['more']['video'];
            $hall = new HallModel();
            $hall->data($resules);
            $result = $hall->save();
            if ($result) {
                $this->success("添加成功", url("content/hall_add"));
            } else {
                $this->error("添加失败");
            }
        }
        return $this->fetch();
    }

    /**
     * 编辑礼堂
     * @adminMenu(
     *     'name'   => '编辑礼堂',
     *     'parent' => 'hall',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function hall_edit()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $result['title'] = $data['title'];
            $result['abstract'] = $data['abstract'];
            $result['type'] = $data['type'];
            $result['content'] = htmlspecialchars_decode($data['content']);
            $result['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
            $result['video'] = $data['post']['more']['video'];
//            $result['create_time'] = $data['create_time'];
//            $result['update_time'] = $data['update_time'];
            $hall = new HallModel();
            $results = $hall->isUpdate(true)->save($result, ['id' => $data['id']]);
            if ($results) {
                $this->success("保存成功！", url('content/hall'));
            } else {
                $this->error("保存失败！");
            }
        }
        $hallModel = new HallModel();
        $datas = $hallModel->find($data['id']);
        $this->assign("datas", $datas);
        return $this->fetch();
    }

    /**
     * 删除公告
     * @adminMenu(
     *     'name'   => '删除公告',
     *     'parent' => 'notice',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function hall_delete()
    {
        $id = $this->request->param("id", 0, 'intval');
        $hallModel = new HallModel();
        $status = $hallModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('content/hall'));
        } else {
            $this->error("删除失败！");
        }
    }


    /**
     * 资讯管理
     * @adminMenu(
     *     'name'   => '资讯管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function information()
    {
        $informationModel = new InformationModel();
        $information = $informationModel->order('id', 'desc')->paginate('10');
        $this->assign("information", $information);
        return $this->fetch();
    }

    /**
     * 添加资讯
     * @adminMenu(
     *     'name'   => '添加资讯',
     *     'parent' => 'information',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function information_add()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $resules['title'] = $data['title'];
            $resules['abstract'] = $data['abstract'];
            $resules['type'] = $data['type'];
            $resules['content'] = isset($data['content']) ? $data['content'] : '';
            $resules['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
//            $resules['video'] = $data['post']['more']['video'];
            $hall = new InformationModel();
            $hall->data($resules);
            $result = $hall->save();
            if ($result) {
                $this->success("添加成功", url("content/information_add"));
            } else {
                $this->error("添加失败");
            }
        }
        return $this->fetch();
    }

    /**
     * 编辑资讯
     * @adminMenu(
     *     'name'   => '编辑资讯',
     *     'parent' => 'information',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function information_edit()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $result['title'] = $data['title'];
            $result['abstract'] = $data['abstract'];
            $result['type'] = $data['type'];
            $result['content'] = htmlspecialchars_decode($data['content']);
            $result['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
//            $result['video'] = $data['post']['more']['video'];
//            $result['create_time'] = $data['create_time'];
//            $result['update_time'] = $data['update_time'];
            $hall = new InformationModel();
            $results = $hall->isUpdate(true)->save($result, ['id' => $data['id']]);
            if ($results) {
                $this->success("保存成功！", url('content/information'));
            } else {
                $this->error("保存失败！");
            }
        }
        $hallModel = new InformationModel();
        $datas = $hallModel->find($data['id']);
        $this->assign("datas", $datas);
        return $this->fetch();
    }

    /**
     * 删除资讯
     * @adminMenu(
     *     'name'   => '删除资讯',
     *     'parent' => 'information',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function information_delete()
    {
        $id = $this->request->param("id", 0, 'intval');
        $hallModel = new InformationModel();
        $status = $hallModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('content/information'));
        } else {
            $this->error("删除失败！");
        }
    }


    /**
     * 随手拍管理
     * @adminMenu(
     *     'name'   => '随手拍管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function camera()
    {
        $cameraModel = new CameraModel();
        $camera = $cameraModel->order('id', 'desc')->paginate('10');
        $this->assign("camera", $camera);
        return $this->fetch();
    }

    /**
     * 添加随手拍
     * @adminMenu(
     *     'name'   => '添加随手拍',
     *     'parent' => 'camera',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function camera_add()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $resules['title'] = $data['title'];
            $resules['abstract'] = $data['abstract'];
            $resules['type'] = $data['type'];
            $resules['content'] = isset($data['content']) ? $data['content'] : '';
            $resules['image'] = isset($data['image']) ? $data['image'] : '';
//            $resules['video'] = $data['post']['more']['video'];
            $camera = new CameraModel();
            $camera->data($resules);
            $result = $camera->save();
            if ($result) {
                $this->success("添加成功", url("content/camera_add"));
            } else {
                $this->error("添加失败");
            }
        }
        return $this->fetch();
    }

    /**
     * 编辑随手拍
     * @adminMenu(
     *     'name'   => '编辑随手拍',
     *     'parent' => 'camera',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
//    public function camera_edit()
//    {
//        $data = $this->request->param();
//        if ($this->request->isPost()) {
//            $result['title'] = $data['title'];
//            $result['abstract'] = $data['abstract'];
//            $result['type'] = $data['type'];
//            $result['content'] = htmlspecialchars_decode($data['content']);
//            $result['image'] = isset($data['image']) ? $data['image'] : '';
////            $result['video'] = $data['post']['more']['video'];
////            $result['create_time'] = $data['create_time'];
////            $result['update_time'] = $data['update_time'];
//            $camera = new CameraModel();
//            $results = $camera->isUpdate(true)->save($result, ['id' => $data['id']]);
//            if ($results) {
//                $this->success("保存成功！", url('content/camera'));
//            } else {
//                $this->error("保存失败！");
//            }
//        }
//        $cameraModel = new CameraModel();
//        $datas = $cameraModel->find($data['id']);
//        $this->assign("datas", $datas);
//        return $this->fetch();
//    }

    /**
     * 删除随手拍
     * @adminMenu(
     *     'name'   => '删除随手拍',
     *     'parent' => 'camera',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function camera_delete()
    {
        $id = $this->request->param("id", 0, 'intval');
        $cameraModel = new CameraModel();
        $status = $cameraModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('content/camera'));
        } else {
            $this->error("删除失败！");
        }
    }
































    /**
     * 咨询列表
     * @adminMenu(
     *     'name'   => '咨询列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function question()
    {
        $data = $this->request->param();
        $where = [];
        $mobile = $this->request->param('mobile');
        if($mobile){
            $where['u.mobile'] = ['like',"%{$mobile}%"];
        }
        $status = $this->request->param('status');
        if($status != ''){
            $where['q.status'] = $status;
        }
        $order = $this->request->param('order');
        $orderby = ["id" => "DESC"];
        if($order == '1'){
            $orderby = ["money" => "DESC"];
        }
        if($order == '2'){
            $orderby = ["money" => "ASC"];
        }
        if(!empty($data['export'])){
            $list = Db::name('gxzh_question')->alias('q')
                ->join('__USER__ u', 'q.uid = u.id','LEFT')
                ->where($where)
                ->field("q.*,u.user_nickname")
                ->order($orderby)->paginate(10000000)
                ->each(function ($item, $key) {
                    $item['service_id'] = $item['service_id']?'一对一':'快速提问';
                    $item['status'] = $item['status']==1?'已解决':($item['status']==2?'撤销':'未解决');
                    $item['province'] = getprovincenamebycode($item['province']);
                    $item['city'] = getcitynamebycode($item['city']);
                    $item['dept1'] = getdeptnamebyids($item['dept1']);
                    $item['dept2'] = getdeptnamebyids($item['dept2']);
                    $item['pcount'] = Db::name("gxzh_answer")->where(['question_id'=>$item['id']])->count();
                    return $item;
                });
            $str = "ID,提问者,服务,标题,预算金额,省市,一级领域,二级领域,状态,创建时间,抢单数\n";
            foreach ($list as $v) {
                $str .= $v['id'].',"'.
                    $v['user_nickname'].'","'.
                    $v['service_id'].'","'.
                    $v['title'].'","'.
                    $v['money'].'","'.
                    $v['province'].'-'.$v['city'].'","'.
                    $v['dept1'].'","'.
                    $v['dept2'].'","'.
                    $v['status'].'","'.
                    date('Y-m-d H:i:s',$v['created_at']).'","'.
                    $v['pcount'].'"'."\n";
            }
            $filename = 'export.csv';
            $str = "\xEF\xBB\xBF".$str; //添加BOM
            export_csv($filename,$str);

            die;
        }
        $list = Db::name('gxzh_question')->alias('q')
            ->join('__USER__ u', 'q.uid = u.id','LEFT')
            ->where($where)
            ->field("q.*,u.user_nickname")
            ->order($orderby)->paginate(10)
            ->each(function ($item, $key) {
                $item['service_id'] = $item['service_id']?'一对一':'快速提问';
                $item['status'] = $item['status']==1?'已解决':($item['status']==2?'撤销':'未解决');
                $item['province'] = getprovincenamebycode($item['province']);
                $item['city'] = getcitynamebycode($item['city']);
                $item['dept1'] = getdeptnamebyids($item['dept1']);
                $item['dept2'] = getdeptnamebyids($item['dept2']);
                $item['pcount'] = Db::name("gxzh_answer")->where(['question_id'=>$item['id']])->count();
                return $item;
            });
        $list->appends(['mobile' => $mobile,'status' => $status]);
        $page = $list->render();
        $this->assign('data', $data);
        $this->assign('page', $page);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 回答列表
     * @adminMenu(
     *     'name'   => '回答列表',
     *     'parent' => 'default',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function answer()
    {
        $data = $this->request->param();
        $question = Db::name('gxzh_question')->alias('q')
            ->join('__USER__ u', 'q.uid = u.id','LEFT')
            ->where(['q.id'=>$data['id']])
            ->field("q.*,u.user_nickname")
            ->find();
        $question['service_id'] = $question['service_id']?'一对一':'快速提问';
        $question['status'] = $question['status']==1?'已解决':($question['status']==2?'撤销':'未解决');
        $question['province'] = getprovincenamebycode($question['province']);
        $question['city'] = getcitynamebycode($question['city']);
        $question['dept1'] = getdeptnamebyids($question['dept1']);
        $question['dept2'] = getdeptnamebyids($question['dept2']);
        $question['imgs'] = explode(',',$question['imgs']);

        $list = Db::name('gxzh_answer')->alias('a')
            ->join('__USER__ u', 'a.doctor_uid = u.id','LEFT')
            ->where(['a.question_id'=>$data['id']])
            ->field("a.*,u.user_nickname")
            ->select()
            ->each(function ($item, $key) {
                $item['status'] = $item['status']==1?'未被选择':'已选择';
                $item['chat_state'] = $item['chat_state']==1?'已结束':'未结束';
                $item['pay_status'] = $item['pay_status']==1?'已付款':'未付款';

                $item['redpack'] = Db::name('gxzh_redpack')->where(['out_trade_no'=>$item['out_trade_no']])->sum('money');

                return $item;
            });
        $this->assign("question", $question);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 账单管理
     * @adminMenu(
     *     'name'   => '账单管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function account()
    {
        $data = $this->request->param();
        $where = [];
        $keyword = $this->request->param('keyword');
        if($keyword){
            $where['u.id|u.user_nickname|u.user_login|u.mobile'] = ['like',"%{$keyword}%"];
        }
        $start = $this->request->param('start','1970-01-01');
        $end = $this->request->param('end',date('Y-m-d'));
        $where['created_at'] = ['between',[strtotime($start),strtotime($end)+86400]];

        $order = $this->request->param('order');
        $orderby = ["id" => "DESC"];
        if($order == '1'){
            $orderby = ["after" => "DESC"];
        }
        if($order == '2'){
            $orderby = ["after" => "ASC"];
        }
        if(!empty($data['export'])){
            $list = Db::name('gxzh_money_log')->alias('l')
                ->join('__USER__ u', 'l.uid = u.id','LEFT')
                ->where($where)
                ->field("l.*,u.user_nickname")
                ->order($orderby)->paginate(1000000)
                ->each(function ($item, $key) {

                    return $item;
                });
            $str = "id,user,type,action,before,after,op,amount,msg,order_id,created_at\n";
            foreach ($list as $v) {
                $str .= $v['id'].',"'.
                    $v['user_nickname'].'","'.
                    $v['type'].'","'.
                    $v['action'].'","'.
                    $v['before'].'","'.
                    $v['after'].'","'.
                    $v['op'].'","'.
                    $v['amount'].'","'.
                    $v['msg'].'","'.
                    $v['order_id'].'","'.
                    date('Y-m-d H:i:s',$v['created_at']).'"'."\n";
            }
            $filename = 'export.csv';
            $str = "\xEF\xBB\xBF".$str; //添加BOM
            export_csv($filename,$str);

            die;
        }
        $list = Db::name('gxzh_money_log')->alias('l')
            ->join('__USER__ u', 'l.uid = u.id','LEFT')
            ->where($where)
            ->field("l.*,u.user_nickname")
            ->order($orderby)->paginate(10)
            ->each(function ($item, $key) {

                return $item;
            });//echo Db::name("gxzh_money_log")->getLastSql();die;
        $list->appends(['keyword' => $keyword]);
        $page = $list->render();
        $this->assign('data', $data);
        $this->assign('page', $page);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 提现管理
     * @adminMenu(
     *     'name'   => '提现管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function withdraw()
    {
        $data = $this->request->param();
        $where = [];
        $mobile = $this->request->param('mobile');
        if($mobile){
            $where['u.mobile'] = ['like',"%{$mobile}%"];
        }
        $trade_sn = $this->request->param('trade_sn');
        if($trade_sn){
            $where['w.trade_sn'] = ['like',"%{$trade_sn}%"];
        }
        $status = $this->request->param('status');
        if($status != ''){
            $where['w.status'] = $status;
        }
        $list = Db::name('gxzh_withdraw')->alias('w')
            ->join('__USER__ u', 'w.uid = u.id','LEFT')
            ->where($where)
            ->field("w.*,u.user_nickname")
            ->order(["id" => "DESC"])->paginate(10)
            ->each(function ($item, $key) {
                $item['status'] = $item['status']==1?'审核通过':($item['status']==2?'驳回':'待审核');
                return $item;
            });//echo Db::name("gxzh_withdraw")->getLastSql();die;
        $list->appends(['mobile' => $mobile,'trade_sn' => $trade_sn,'status' => $status]);
        $page = $list->render();
        $this->assign('data', $data);
        $this->assign('page', $page);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 提现审核
     * @adminMenu(
     *     'name'   => '提现审核',
     *     'parent' => 'withdraw',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function withdrawcheck()
    {
        $data = $this->request->param();
        if (!empty($data['status'])) {
            $GxzhMoneyLogModel = new \app\api\model\GxzhMoneyLogModel();

            $withdrawinfo = Db::name('gxzh_withdraw')->where(['id'=>$data['id']])->find();
            //检查余额够不够
            $yue = $GxzhMoneyLogModel->balance($withdrawinfo['uid'],1);
            if($withdrawinfo['money']>$yue){
                $this->error("余额不足！");
            }
            $wdata = [
                'status' => $data['status'],
                'reject' => !empty($data['reject'])?$data['reject']:'',
                'updated_at' => time(),
            ];
            if (Db::name('gxzh_withdraw')->where(['id'=>$data['id']])->update($wdata) !== false) {
                if($data['status']==1){
                    $GxzhMoneyLogModel->addLog($withdrawinfo['uid'],1,'withdraw',$withdrawinfo['money'],'-','提现申请通过',$withdrawinfo['trade_sn']);
                    savemsg('提现申请通过',$withdrawinfo['uid'],'提现申请通过，提现金额：'.$withdrawinfo['money']);
                }
                if($data['status']==2){
                    savemsg('提现申请未通过',$withdrawinfo['uid'],'提现申请未通过，原因：'.$data['reject']);
                }

                $this->success("保存成功！");
            } else {
                $this->error("保存失败！");
            }
        }
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     * 退款管理
     * @adminMenu(
     *     'name'   => '退款管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function refund()
    {
        $data = $this->request->param();
        $where = [];
        $mobile = $this->request->param('mobile');
        if($mobile){
            $where['u.mobile'] = ['like',"%{$mobile}%"];
        }
        $trade_sn = $this->request->param('trade_sn');
        if($trade_sn){
            $where['r.trade_sn'] = ['like',"%{$trade_sn}%"];
        }
        $status = $this->request->param('status');
        if($status != ''){
            $where['r.status'] = $status;
        }
        $list = Db::name('gxzh_refund')->alias('r')
            ->join('__USER__ u', 'r.uid = u.id','LEFT')
            ->where($where)
            ->field("r.*,u.user_nickname")
            ->order(["id" => "DESC"])->paginate(10)
            ->each(function ($item, $key) {
                $item['status'] = $item['status']==1?'审核通过':($item['status']==2?'驳回':'待审核');
                $item['imgs'] = explode(',',$item['imgs']);
                $item['answer_id'] = Db::name('gxzh_answer')->where(['out_trade_no'=>$item['out_trade_no']])->value('id');
                return $item;
            });
        $list->appends(['mobile' => $mobile,'trade_sn' => $trade_sn,'status' => $status]);
        $page = $list->render();
        $this->assign('data', $data);
        $this->assign('page', $page);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 退款审核
     * @adminMenu(
     *     'name'   => '退款审核',
     *     'parent' => 'refund',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function refundcheck()
    {
        $data = $this->request->param();
        if (!empty($data['status'])) {
            $GxzhMoneyLogModel = new \app\api\model\GxzhMoneyLogModel();

            $refundinfo = Db::name('gxzh_refund')->where(['id'=>$data['id']])->find();

            $wdata = [
                'status' => $data['status'],
                'reject' => !empty($data['reject'])?$data['reject']:'',
                'updated_at' => time(),
            ];
            if (Db::name('gxzh_refund')->where(['id'=>$data['id']])->update($wdata) !== false) {
                if($data['status']==1){
                    //if($refundinfo['out_trade_no']){
                    //    $answer_info = Db::name('gxzh_answer')->where(['out_trade_no'=>$refundinfo['out_trade_no']])->find();
                    //$GxzhMoneyLogModel->addLog($answer_info['doctor_uid'],1,'refund',$refundinfo['money'],'-','提问者退款，审核通过',$refundinfo['trade_sn']);
                    //    savemsg('提问者退款，审核通过',$answer_info['doctor_uid'],'提问者退款，审核通过，退款金额：'.$refundinfo['money'].'。咨询问题：'.$answer_info['title']);
                    //}
                    $GxzhMoneyLogModel->addLog($refundinfo['uid'],1,'refund',$refundinfo['money'],'+','退款申请通过',$refundinfo['trade_sn']);
                    savemsg('退款申请通过',$refundinfo['uid'],'退款申请通过，退款金额：'.$refundinfo['money']);
                }
                if($data['status']==2){
                    savemsg('退款申请未通过',$refundinfo['uid'],'退款申请未通过，原因：'.$data['reject']);
                }
                $this->success("保存成功！");
            } else {
                $this->error("保存失败！");
            }
        }
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     * 用户审核
     * @adminMenu(
     *     'name'   => '用户审核',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function usercheck()
    {
        $data = $this->request->param();
        if (!empty($data['type'])) {

            $audata = [
                'auth_'.$data['type'] => $data['auth'],
            ];
            if (Db::name('user')->where(['id'=>$data['id']])->update($audata) !== false) {
                $this->success("成功！");
            } else {
                $this->error("失败！");
            }
        }
        $where['auth_identity|auth_title|auth_work|auth_other1|auth_other2'] = 2;
        $list = Db::name('user')
            ->where($where)
            ->order(["id" => "DESC"])->paginate(10)
            ->each(function ($item, $key) {
                $item['level'] = getlevelbyid($item['level']);
                return $item;
            });
        $page = $list->render();
        $this->assign('data', $data);
        $this->assign('page', $page);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 用户列表
     * @adminMenu(
     *     'name'   => '用户列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function userlist()
    {
        $data = $this->request->param();
        $where = ['user_type'=>2];
        $mobile = $this->request->param('mobile');
        if($mobile){
            $where['mobile'] = ['like',"%{$mobile}%"];
        }
        $list = Db::name('user')->where($where)->order(["id" => "DESC"])->paginate(10)
            ->each(function ($item, $key) {
                $item['province'] = getprovincenamebycode($item['province']);
                $item['city'] = getcitynamebycode($item['city']);
                $item['level'] = getlevelbyid($item['level']);
                return $item;
            });
        $list->appends(['mobile' => $mobile]);
        $page = $list->render();
        $this->assign('data', $data);
        $this->assign('page', $page);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 充值
     * @adminMenu(
     *     'name'   => '充值',
     *     'parent' => 'default',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function recharge()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $GxzhMoneyLogModel = new \app\api\model\GxzhMoneyLogModel();
            $res = $GxzhMoneyLogModel->addLog($data['uid'],1,'backstage',$data['amount'],'+','后台充值','');
            if ($res) {
                $this->success("成功！");
            } else {
                $this->error("失败！");
            }
        }
        $this->assign("data", $data);
        return $this->fetch();
    }

    /**
     * 推送
     * @adminMenu(
     *     'name'   => '推送',
     *     'parent' => 'default',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function push()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            if(!empty($data['all'])){
                pushAll($data['msg']);
            }
            if(!empty($data['uid'])){
                push('gxzh_'.$data['uid'], $data['msg']);
            }
            if (1) {
                $this->success("成功！");
            } else {
                $this->error("失败！");
            }
        }
        $this->assign("data", $data);
        return $this->fetch();
    }

    /**
     * 用户关系
     * @adminMenu(
     *     'name'   => '用户关系',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function relationship()
    {
        $data = $this->request->param();
        $this->assign("data", $data);
        $pid = '#';
        if ($this->request->isPost()) {
            $mobile = $this->request->param('mobile');
            $pid = Db::name('user')->where(['mobile'=>$mobile])->value('pid');
            $pid = $pid ? $pid : '#';
            $this->assign("pid", $pid);
            return $this->fetch();
        }
        if(!empty($data['id'])){
            header('content-type: application/json; charset=utf-8');
            if($data['id']=='#'){
                //初始化
                $pid = 0;
            }
            $pid = $data['id'];

            $list = Db::name('user')->field('id,mobile,user_nickname')->where(['user_type'=>2,'pid'=>$pid])->select();
            $children = [];
            foreach($list as $v){
                $haschildren = Db::name('user')->where(['pid'=>$v['id']])->count();
                $answer_times = Db::name("gxzh_answer")->where(['doctor_uid'=>$v['id'],'status'=>2,'pay_status'=>1])->count();
                $c = [
                    'id' => $v['id'],
                    'text' => '手机：'.$v['mobile'].'-推广人数：'.$haschildren.' -答题数：'.$answer_times.' -昵称：'.$v['user_nickname'],
                    'children' => $haschildren?true:false,
                ];
                array_push($children,$c);
            }

            if($pid==0){
                $ret[0] = [
                    'id' => 1,
                    'text' => 'admin',
                    'children' => $children
                ];
                echo json_encode($ret);die;
            }else{
                $ret = $children;
                echo json_encode($ret);die;
            }
        }
        $this->assign("pid", $pid);
        return $this->fetch();
    }

    /**
     * 用户留言
     * @adminMenu(
     *     'name'   => '用户留言',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function guestbook()
    {
        $data = $this->request->param();
        $list = Db::name('gxzh_guestbook')->alias('g')
            ->join('__USER__ u', 'g.uid = u.id','LEFT')
            ->where([])
            ->field("g.*,u.user_nickname")
            ->order(["id" => "DESC"])->paginate(10)
            ->each(function ($item, $key) {
                $item['imgs'] = explode(',',$item['imgs']);
                return $item;
            });
        $page = $list->render();
        $this->assign('data', $data);
        $this->assign('page', $page);
        $this->assign("list", $list);
        return $this->fetch();
    }

    /**
     * 用户信息
     * @adminMenu(
     *     'name'   => '用户信息',
     *     'parent' => 'default',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function userinfo()
    {
        $data = $this->request->param();
        $userinfo = Db::name('user')->where(['id'=>$data['id']])->find();

        $userinfo['province'] = getprovincenamebycode($userinfo['province']);
        $userinfo['city'] = getcitynamebycode($userinfo['city']);
        $userinfo['dept1'] = getdeptnamebyids($userinfo['dept1']);
        $userinfo['dept2'] = getdeptnamebyids($userinfo['dept2']);
        $userinfo['level'] = getlevelbyid($userinfo['level']);

        $userinfo['auth_identity'] = $userinfo['auth_identity']==1?'已审核':($userinfo['auth_identity']==2?'审核中':'未审核');
        $userinfo['auth_title'] = $userinfo['auth_title']==1?'已审核':($userinfo['auth_title']==2?'审核中':'未审核');
        $userinfo['auth_work'] = $userinfo['auth_work']==1?'已审核':($userinfo['auth_work']==2?'审核中':'未审核');
        $userinfo['auth_other1'] = $userinfo['auth_other1']==1?$userinfo['other1']:($userinfo['auth_other1']==2?'审核中':'未审核');
        $userinfo['auth_other2'] = $userinfo['auth_other2']==1?$userinfo['other2']:($userinfo['auth_other2']==2?'审核中':'未审核');

        $this->assign("userinfo", $userinfo);
        return $this->fetch();
    }

    /**
     * 导出统计数据
     * @adminMenu(
     *     'name'   => '导出统计数据',
     *     'parent' => 'default',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function export()
    {
        $list = Db::name("user")->field('id,user_nickname,mobile,pid')->where(['user_type'=>2])->select()
            ->each(function ($item, $key) {
                $item['answer_times'] = Db::name("gxzh_answer")->where(['doctor_uid'=>$item['id'],'status'=>2,'pay_status'=>1])->count();
                $item['team_count'] = Db::name("user")->where(['pid'=>$item['id']])->count();
                return $item;
            });
        $str = "ID,昵称,手机号,上级ID,答题数,推广人数\n";
        foreach ($list as $v) {
            $str .= $v['id'].',"'.
                $v['user_nickname'].'","'.
                $v['mobile'].'","'.
                $v['pid'].'","'.
                $v['answer_times'].'","'.
                $v['team_count'].'"'."\n";
        }
        $filename = 'export.csv';
        $str = "\xEF\xBB\xBF".$str; //添加BOM
        export_csv($filename,$str);

        die;
    }

}