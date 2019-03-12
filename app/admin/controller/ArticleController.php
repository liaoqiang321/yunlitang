<?php
namespace app\admin\controller;

use app\admin\model\ArticleModel;
use app\admin\model\HallTypeModel;
use app\admin\model\InformationTypeModel;
use cmf\controller\AdminBaseController;

use think\Db;

/**
 * Class ArticleController
 * @package app\admin\controller
 * @adminMenuRoot(
 *     'name'   =>'图文管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 0,
 *     'icon'   =>'',
 *     'remark' =>''
 * )
 */
class ArticleController extends AdminBaseController
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
        $articleModel = new ArticleModel();
        $hall = $articleModel->where('type', '=', '礼堂')->order('id', 'desc')->paginate('10');
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
            $resules['hall_type_id'] = $data['hall_type_id'];
            $resules['content'] = isset($data['content']) ? htmlspecialchars_decode($data['content']) : '';
            $resules['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
            $resules['video'] = $data['post']['more']['video'];
            $hall = new ArticleModel();
            $hall->data($resules);
            $result = $hall->save();
            if ($result) {
                $this->success("添加成功", url("article/hall_add"));
            } else {
                $this->error("添加失败");
            }
        }
        $hall_type = new HallTypeModel();
        $hall_type_list = $hall_type->select();
        $this->assign('hall_type_list', $hall_type_list);
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
//            $result['type'] = $data['type'];
            $result['hall_type'] = $data['hall_type'];
            $result['content'] = htmlspecialchars_decode($data['content']);
            $result['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
            $result['video'] = $data['post']['more']['video'];
//            $result['create_time'] = $data['create_time'];
//            $result['update_time'] = $data['update_time'];
            $hall = new ArticleModel();
            $results = $hall->isUpdate(true)->save($result, ['id' => $data['id']]);
            if ($results) {
                $this->success("保存成功！", url('article/hall'));
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
     * 删除礼堂
     * @adminMenu(
     *     'name'   => '删除礼堂',
     *     'parent' => 'hall',
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
        $articleModel = new ArticleModel();
        $status = $articleModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('article/hall'));
        } else {
            $this->error("删除失败！");
        }
    }
    /**
     * 添加礼堂分类
     * @adminMenu(
     *     'name'   => 添加礼堂分类',
     *     'parent' => 'hall',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function hall_type_add()
    {
        if($this->request->isPost()){
            $hall_type = $this->request->param('hall_type');
            $hall_type_model = new HallTypeModel();
            $result = !empty($hall_type) ? $hall_type_model->data(['name' => $hall_type])->save() : '';
            if ($result) {
                $this->success("添加成功！");
            } else {
                $this->error("添加失败！");
            }
        }
        return $this->fetch();

    }
    /**
     * 编辑礼堂分类
     * @adminMenu(
     *     'name'   => 编辑礼堂分类',
     *     'parent' => 'hall',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function hall_type_edit()
    {
        $id = $this->request->param("id", 0, 'intval');
        $articleModel = new ArticleModel();
        $status = $articleModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('article/hall'));
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
        $articleModel = new ArticleModel();
        $information = $articleModel->where('type', '=', '资讯')->order('id', 'desc')->paginate('10');
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
            $resules['information_type_id'] = $data['information_type_id'];
            $resules['content'] = isset($data['content']) ? htmlspecialchars_decode($data['content']) : '';
            $resules['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
//            $resules['video'] = $data['post']['more']['video'];
            $hall = new ArticleModel();
            $hall->data($resules);
            $result = $hall->save();
            if ($result) {
                $this->success("添加成功", url("article/information_add"));
            } else {
                $this->error("添加失败");
            }
        }
        $information_type = new InformationTypeModel();
        $information_type_list = $information_type->select();
        $this->assign('information_type_list', $information_type_list);
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
            $result['information_type'] = $data['information_type'];
            $result['content'] = htmlspecialchars_decode($data['content']);
            $result['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
//            $result['video'] = $data['post']['more']['video'];
//            $result['create_time'] = $data['create_time'];
//            $result['update_time'] = $data['update_time'];
            $hall = new ArticleModel();
            $results = $hall->isUpdate(true)->save($result, ['id' => $data['id']]);
            if ($results) {
                $this->success("保存成功！", url('article/information'));
            } else {
                $this->error("保存失败！");
            }
        }
        $hallModel = new ArticleModel();
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
        $articleModel = new ArticleModel();
        $status = $articleModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('article/information'));
        } else {
            $this->error("删除失败！");
        }
    }
    /**
     * 添加资讯分类
     * @adminMenu(
     *     'name'   => '添加资讯分类',
     *     'parent' => 'information',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function information_type_add()
    {
        if($this->request->isPost()){
            $information_type = $this->request->param('information_type');
            $information_type_model = new InformationTypeModel();
            $result = !empty($information_type) ? $information_type_model->data(['name' => $information_type])->save() : '';
            if ($result) {
                $this->success("添加成功！");
            } else {
                $this->error("添加失败！");
            }
        }
        return $this->fetch();
    }

    /**
     * 机构团体管理
     * @adminMenu(
     *     'name'   => '机构团体管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function group()
    {
        $articleModel = new ArticleModel();
        $group = $articleModel->where('type', '=', '机构团体')->order('id', 'desc')->paginate('10');
        $this->assign("group", $group);
        return $this->fetch();
    }

    /**
     * 添加机构团体
     * @adminMenu(
     *     'name'   => '添加机构团体',
     *     'parent' => 'group',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function group_add()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $resules['title'] = $data['title'];
            $resules['abstract'] = $data['abstract'];
            $resules['type'] = $data['type'];
            $resules['content'] = isset($data['content']) ? htmlspecialchars_decode($data['content']) : '';
            $resules['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
//            $resules['video'] = $data['post']['more']['video'];
            $hall = new ArticleModel();
            $hall->data($resules);
            $result = $hall->save();
            if ($result) {
                $this->success("添加成功", url("article/group"));
            } else {
                $this->error("添加失败");
            }
        }
        return $this->fetch();
    }

    /**
     * 编辑机构团体
     * @adminMenu(
     *     'name'   => '编辑机构团体',
     *     'parent' => 'group',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function group_edit()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $result['title'] = $data['title'];
            $result['abstract'] = $data['abstract'];
            $result['content'] = htmlspecialchars_decode($data['content']);
            $result['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
//            $result['video'] = $data['post']['more']['video'];
//            $result['create_time'] = $data['create_time'];
//            $result['update_time'] = $data['update_time'];
            $hall = new ArticleModel();
            $results = $hall->isUpdate(true)->save($result, ['id' => $data['id']]);
            if ($results) {
                $this->success("保存成功！", url('article/group'));
            } else {
                $this->error("保存失败！");
            }
        }
        $hallModel = new ArticleModel();
        $datas = $hallModel->find($data['id']);
        $this->assign("datas", $datas);
        return $this->fetch();
    }

    /**
     * 删除机构团体
     * @adminMenu(
     *     'name'   => '删除机构团体',
     *     'parent' => 'group',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function group_delete()
    {
        $id = $this->request->param("id", 0, 'intval');
        $articleModel = new ArticleModel();
        $status = $articleModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('article/information'));
        } else {
            $this->error("删除失败！");
        }
    }

    /**
     * 志愿者管理
     * @adminMenu(
     *     'name'   => '志愿者管理',
     *     'parent' => 'default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 0,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function volunteer()
    {
        $articleModel = new ArticleModel();
        $volunteer = $articleModel->where('type', '=', '志愿者')->order('id', 'desc')->paginate('10');
        $this->assign("volunteer", $volunteer);
        return $this->fetch();
    }

    /**
     * 添加志愿者
     * @adminMenu(
     *     'name'   => '添加志愿者',
     *     'parent' => 'volunteer',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function volunteer_add()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
            $resules['title'] = $data['title'];
            $resules['abstract'] = $data['abstract'];
            $resules['type'] = $data['type'];
            $resules['content'] = isset($data['content']) ? htmlspecialchars_decode($data['content']) : '';
            $resules['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
//            $resules['video'] = $data['post']['more']['video'];
            $hall = new ArticleModel();
            $hall->data($resules);
            $result = $hall->save();
            if ($result) {
                $this->success("添加成功", url("article/volunteer"));
            } else {
                $this->error("添加失败");
            }
        }
        return $this->fetch();
    }

    /**
     * 编辑志愿者
     * @adminMenu(
     *     'name'   => '编辑志愿者',
     *     'parent' => 'volunteer',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function volunteer_edit()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $result['title'] = $data['title'];
            $result['abstract'] = $data['abstract'];
            $result['content'] = htmlspecialchars_decode($data['content']);
            $result['cover'] = isset($data['cover']) ? $data['cover'][0] : '';
//            $result['video'] = $data['post']['more']['video'];
//            $result['create_time'] = $data['create_time'];
//            $result['update_time'] = $data['update_time'];
            $hall = new ArticleModel();
            $results = $hall->isUpdate(true)->save($result, ['id' => $data['id']]);
            if ($results) {
                $this->success("保存成功！", url('article/volunteer'));
            } else {
                $this->error("保存失败！");
            }
        }
        $hallModel = new ArticleModel();
        $datas = $hallModel->find($data['id']);
        $this->assign("datas", $datas);
        return $this->fetch();
    }

    /**
     * 删除机构团体
     * @adminMenu(
     *     'name'   => '删除机构团体',
     *     'parent' => 'volunteer',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '',
     *     'param'  => ''
     * )
     */
    public function volunteer_delete()
    {
        $id = $this->request->param("id", 0, 'intval');
        $articleModel = new ArticleModel();
        $status = $articleModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('article/volunteer'));
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
        $articleModel = new ArticleModel();
        $camera = $articleModel->order('id', 'desc')->paginate('10');
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
            $camera = new ArticleModel();
            $camera->data($resules);
            $result = $camera->save();
            if ($result) {
                $this->success("添加成功", url("article/camera_add"));
            } else {
                $this->error("添加失败");
            }
        }
        return $this->fetch();
    }

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
        $cameraModel = new ArticleModel();
        $status = $cameraModel->where('id', '=', $id)->delete();
        if ($status) {
            $this->success("删除成功！", url('content/camera'));
        } else {
            $this->error("删除失败！");
        }
    }

}