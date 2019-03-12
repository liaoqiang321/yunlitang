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
use app\admin\model\MemberModel;
use cmf\controller\AdminBaseController;

/**
 * Class MemberController
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   =>'会员管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 0,
 *     'icon'   =>'',
 *     'remark' =>''
 * )
 */
class MemberController extends AdminBaseController
{
    /**
     * 会员列表
     * @adminMenu(
     *     'name'   => '会员列表',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function member()
    {
        $memberModel = new MemberModel();
        $member = $memberModel->order('id', 'desc')->paginate('3');
        $this->assign("member", $member);
        return $this->fetch();
    }

    /**
     * 编辑会员信息
     * @adminMenu(
     *     'name'   => '编辑会员信息',
     *     'parent' => 'member',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function member_edit()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $result['name'] = $data['name'];
            $result['account'] = $data['account'];
//            $result['type'] = $data['type'];
            $result['mobile'] = $data['mobile'];
            $result['update_time'] = $data['update_time'];
            $member = new MemberModel();
            $results = $member->isUpdate(true)->save($result, ['id' => $data['id']]);
            if ($results) {
                $this->success("保存成功！", url('member/member'));
            } else {
                $this->error("保存失败！");
            }
        }
        $memberModel = new MemberModel();
        $datas = $memberModel->find($data['id']);
        $this->assign("datas", $datas);
        return $this->fetch();
    }
}