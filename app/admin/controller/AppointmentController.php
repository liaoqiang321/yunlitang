<?php
/**
 * Created by PhpStorm.
 * User: pc
 * Date: 2019/3/8
 * Time: 14:46
 */

namespace app\admin\controller;


use app\admin\model\AppointmentModel;
use app\admin\model\InfoModel;
use cmf\controller\AdminBaseController;

/**
 * Class AppointmentController
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   =>'预约管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 0,
 *     'icon'   =>'',
 *     'remark' =>''
 * )
 */
class AppointmentController extends AdminBaseController
{
    /**
     * 预约列表
     * @adminMenu(
     *     'name'   => '预约列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        if($this->request->ispost()){
            $data   = $this->request->param();
            //*************************************************************提交预约后续入库代码************************************************************************************
        }
        $appointmentModel = new AppointmentModel();
        $appointment = $appointmentModel->order('id', 'desc')->paginate('8');
        $this->assign("appointment", $appointment);
        return $this->fetch();
    }


    /**
     * 预约审核
     * @adminMenu(
     *     'name'   => '预约审核',
     *     'parent' => 'appointment',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function appointment_verify()
    {
        $data = $this->request->param();
        if (!empty($data['status'])) {
            $appointment = new AppointmentModel();
            if($data['status'] == 1){
                $results = $appointment->where('id', '=', $data['id'])->update(['status' => '1', 'update_time' => time()]);
            }elseif ($data['status'] == 2){
                $refuse_reason = $data['refuse_reason'] ?: '';
                $results = $appointment->where('id', '=', $data['id'])->update(['status' => '2', 'refuse_reason' => $refuse_reason, 'update_time' => time()]);
            }
            if ($results) {
                $this->success("添加成功");
            } else {
                $this->error("添加失败");
            }
        }
        $this->assign('data', $data);
        return $this->fetch();
    }

    /**
     * 添加预约
     * @adminMenu(
     *     'name'   => '添加预约',
     *     'parent' => 'appointment',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function appointment_add()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $resules['title'] = $data['title'];
            $resules['abstract'] = $data['abstract'];
            $resules['type'] = $data['type'];
            $resules['hall_type'] = $data['hall_type'];
            $resules['content'] = isset($data['content']) ? htmlspecialchars_decode($data['content']) : '';
            $resules['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
            $resules['video'] = $data['post']['more']['video'];
            $appointment = new AppointmentModel();
            $appointment->data($resules);
            $result = $appointment->save();
            if ($result) {
                $this->success("添加成功", url("appointment/index"));
            } else {
                $this->error("添加失败");
            }
        }
        return $this->fetch();
    }

    /**
     * 编辑预约
     * @adminMenu(
     *     'name'   => '编辑预约',
     *     'parent' => 'appointment',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function appointment_edit()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $result['title'] = $data['title'];
            $result['abstract'] = $data['abstract'];
//            $result['type'] = $data['type'];
            $result['hall_type'] = $data['hall_type'];
            $result['content'] = htmlspecialchars_decode($data['content']);
            $result['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
            $result['video'] = $data['post']['more']['video'];
//            $result['create_time'] = $data['create_time'];
//            $result['update_time'] = $data['update_time'];
            $hall = new AppointmentModel();
            $results = $hall->isUpdate(true)->save($result, ['id' => $data['id']]);
            if ($results) {
                $this->success("保存成功！", url('appointment/index'));
            } else {
                $this->error("保存失败！");
            }
        }
        $articleModel = new ArticleModel();
        $datas = $articleModel->find($data['id']);
        $this->assign("datas", $datas);
        return $this->fetch();
    }

    /**
     * 删除预约
     * @adminMenu(
     *     'name'   => '删除预约',
     *     'parent' => 'appointment',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function appointment_delete()
    {
        $id = $this->request->param("id", 0, 'intval');
        $appointmentModel = new AppointmentModel();
        $status = $appointmentModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('appointment/index'));
        } else {
            $this->error("删除失败！");
        }
    }

    /**
     * 关于云礼堂
     * @adminMenu(
     *     'name'   => '关于云礼堂',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function about()
    {
        $data = new InfoModel();
        if($this->request->isPost()){
            $about = $this->request->param('about');
            $tem = $data->find(1);
            if ($tem){
                $result = $data->where('id', '=', 1)->update(['about' => htmlspecialchars_decode($about)]);
            }else{
                $result = '';
            }

            if($result){
                $this->success('保存成功');
            }else{
                $this->error('保存失败');
            }
        }
        $this->assign('data', $data);
        return $this->fetch();
    }


}