<?php
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use app\admin\model\DepartmentModel;
use think\Db;

class DepartmentController extends AdminBaseController
{
    /**
     * 科室领域
     * @adminMenu(
     *     'name'   => '科室领域',
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
    public function index()
    {
        $DepartmentModel = new DepartmentModel();
        $keyword = $this->request->param('keyword');

        if (empty($keyword)) {
            $categoryTree = $DepartmentModel->adminCategoryTableTree();
            $this->assign('category_tree', $categoryTree);
        } else {
            $categories = $DepartmentModel->where('name', 'like', "%{$keyword}%")->select();
            $this->assign('categories', $categories);
        }

        $this->assign('keyword', $keyword);

        return $this->fetch();
    }

    /**
     * 添加科室领域
     * @adminMenu(
     *     'name'   => '添加科室领域',
     *     'parent' => 'index',
     *     'display'=> false,
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
    public function add()
    {
        $data = $this->request->param();
        $DepartmentModel = new DepartmentModel();
        if ($this->request->isPost()) {
            
            $result = $DepartmentModel->addCategory($data);

            if ($result === false) {
                $this->error('添加失败!');
            }

            $this->success('添加成功!', url('Department/index'));
        }
        $parentId            = $this->request->param('parent', 0, 'intval');
        
        $categoriesTree      = $DepartmentModel->adminCategoryTree($parentId);

        $this->assign('categories_tree', $categoriesTree);
        return $this->fetch();
    }

    /**
     * 编辑科室领域
     * @adminMenu(
     *     'name'   => '编辑科室领域',
     *     'parent' => 'index',
     *     'display'=> false,
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
    public function edit()
    {

        $data = $this->request->param();
        $DepartmentModel = new DepartmentModel();
        if ($this->request->isPost()) {
            $result = $DepartmentModel->editCategory($data);

            if ($result === false) {
                $this->error('保存失败!');
            }

            $this->success('保存成功!');
        }
        
        $id = $this->request->param('id', 0, 'intval');
        if ($id > 0) {
            $category            = $DepartmentModel->get($id)->toArray();

            $categoriesTree = $DepartmentModel->adminCategoryTree($category['parent_id'], $id);

            $this->assign($category);
            $this->assign('categories_tree', $categoriesTree);
            return $this->fetch();
        } else {
            $this->error('操作错误!');
        }

    }

    /**
     * 科室领域排序
     * @adminMenu(
     *     'name'   => '科室领域排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function sort()
    {
        $ids = $this->request->post("list_orders/a");
        $DepartmentModel = new DepartmentModel();
        if (!empty($ids)) {
            foreach ($ids as $key => $r) {
                $data['list_order'] = $r;
                $DepartmentModel->where(['id' => $key])->update($data);
            }
        }
        $this->success("排序更新成功！");
    }

    /**
     * 科室领域显示隐藏
     * @adminMenu(
     *     'name'   => '科室领域显示隐藏',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function toggle()
    {
        if ($this->request->isPost()) {
            $DepartmentModel = new DepartmentModel();
            $data      = $this->request->param();

            if (isset($data['ids']) && !empty($data["display"])) {
                $ids = $this->request->param('ids/a');
                $DepartmentModel->where('id', 'in', $ids)->update(['status' => 1]);
                $this->success("更新成功！");
            }

            if (isset($data['ids']) && !empty($data["hide"])) {
                $ids = $this->request->param('ids/a');
                $DepartmentModel->where('id', 'in', $ids)->update(['status' => 0]);
                $this->success("更新成功！");
            }
        }
    }

    /**
     * 删除科室领域
     * @adminMenu(
     *     'name'   => '删除科室领域',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $DepartmentModel = new DepartmentModel();
        $id = $this->request->param('id');
        //获取删除的内容
        $findCategory = $DepartmentModel->where('id', $id)->find();

        if (empty($findCategory)) {
            $this->error('分类不存在!');
        }
        //判断此分类有无子分类（不算被删除的子分类）
        $categoryChildrenCount = $DepartmentModel->where(['parent_id' => $id])->count();

        if ($categoryChildrenCount > 0) {
            $this->error('此分类有子类无法删除!');
        }

        $this->error('此分类有用户和信息无法删除!');
    }
}
