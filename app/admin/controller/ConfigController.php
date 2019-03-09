<?php

namespace app\admin\controller;

use cmf\controller\AdminBaseController;

use think\Db;

class ConfigController extends AdminBaseController
{
    protected $group = [
        1 => '用户',
        2 => '站点',
        3 => '服务',
        4 => '文本标签',
    ];
    protected $type = [1 => '字符', 2 => '文本', 3 => '图片', 4 => '数组', 5 => '富文本'];

    /**
     * 配置管理
     * @adminMenu(
     *     'name'   => '配置管理',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '配置管理',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $data = $this->request->param();
        $where = [];
        if(isset($data['group'])){
            $where['group'] = ['in', $data['group']];
        }
        if(isset($data['type'])){
            $where['type'] = ['in', $data['type']];
        }
        if(isset($data['status'])){
            $where['status'] = ['in', $data['status']];
        }
        $config = Db::name('gxzh_config')->where($where)->order('sort')->select();
        $this->assign('data', $data);
        $this->assign('config', $config);
        $this->assign('group', $this->group);
        $this->assign('type', $this->type);
        return $this->fetch();
    }

    /**
     * 添加配置
     * @adminMenu(
     *     'name'   => '添加配置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加配置',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
            $data['created_at'] = time();

            $ids = Db::name('gxzh_config')->insert($data);

            if ($ids) {
                cache('gxzh_config', null);
                $this->success("成功！");
            } else {
                $this->error("失败！");
            }
        }
        $this->assign('group', $this->group);
        $this->assign('type', $this->type);
        return $this->fetch();
    }

    /**
     * 编辑配置
     * @adminMenu(
     *     'name'   => '编辑配置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑配置',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $data['updated_at'] = time();

            $ids = Db::name('gxzh_config')->update($data);

            if ($ids) {
                cache('gxzh_config', null);
                $this->success("成功！");
            } else {
                $this->error("失败！");
            }

        }
        $config = Db::name('gxzh_config')->where(['id' => $data['id']])->find();
        $this->assign('config', $config);
        $this->assign('group', $this->group);
        $this->assign('type', $this->type);
        return $this->fetch();
    }

    /**
     * 排序配置
     * @adminMenu(
     *     'name'   => '排序配置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '排序配置',
     *     'param'  => ''
     * )
     */
    public function sort()
    {
        $ids = $this->request->post("list_orders/a");

        if (!empty($ids)) {
            foreach ($ids as $key => $r) {
                $data['sort'] = $r;
                Db::name('gxzh_config')->where(['id' => $key])->update($data);
            }
        }
        $this->success("排序更新成功！");
    }

    /**
     * 隐藏配置
     * @adminMenu(
     *     'name'   => '隐藏配置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '隐藏配置',
     *     'param'  => ''
     * )
     */
    public function toggle()
    {
        if ($this->request->isPost()) {
            $data      = $this->request->param();

            if (isset($data['ids']) && !empty($data["display"])) {
                $ids = $this->request->param('ids/a');
                Db::name('gxzh_config')->where('id', 'in', $ids)->update(['status' => 1]);
                $this->success("更新成功！");
            }

            if (isset($data['ids']) && !empty($data["hide"])) {
                $ids = $this->request->param('ids/a');
                Db::name('gxzh_config')->where('id', 'in', $ids)->update(['status' => 0]);
                $this->success("更新成功！");
            }
        }
    }

    /**
     * 删除配置
     * @adminMenu(
     *     'name'   => '删除配置',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除配置',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        Db::name('gxzh_config')->where('id', $id)->delete();
        $this->success("删除成功！");
    }

    /**
     * 设置配置
     * @adminMenu(
     *     'name'   => '设置配置',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '设置配置',
     *     'param'  => ''
     * )
     */
    public function read()
    {
        $data = $this->request->param();
        $groupid = $data['groupid']??1;
        $config = Db::name('gxzh_config')->where(['group'=>$groupid,'status'=>1])->order('sort')->select();
        $this->assign('config', $config);
        $this->assign('groupid', $groupid);
        $this->assign('group', $this->group);
        $this->assign('type', $this->type);
        return $this->fetch();
    }

    /**
     * 保存配置
     * @adminMenu(
     *     'name'   => '保存配置',
     *     'parent' => 'read',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '保存配置',
     *     'param'  => ''
     * )
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();

            foreach ($data as $k => $v) {
                $arr = explode('_', $k);
                $_data['id'] = $arr[1];
                $_data['value'] = $v;
                if ($arr[2]==3) {//图片类型
                    if ($_data['value']){
                        $_data['value'] = '/upload/' . $_data['value'];
                    }else{
                        continue;
                    }
                }
                if ($arr[2]==5){
                    $_data['value'] = htmlspecialchars_decode($v);
                }
                Db::name('gxzh_config')->update($_data);
            }

            cache('gxzh_config', null);
            $this->success('编辑成功');
        }
    }

    /**
     * 分销设置
     * @adminMenu(
     *     'name'   => '分销设置',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function distribution()
    {
        if ($this->request->isPost()) {
            $data = $this->request->param();
            Db::name('gxzh_distribution')->where(['name'=>'index'])->update(['value'=>json_encode($data['config'])]);
            $this->success('成功');
        }
        $config = Db::name('gxzh_distribution')->where(['name'=>'index'])->find();
        $this->assign('config', json_decode($config['value'],true));
        return $this->fetch();
    }

}