<?php
namespace app\admin\model;

use think\db\Query;
use think\Model;
use tree\Tree;

class DepartmentModel extends Model
{
    protected $table = 'cmf_gxzh_department';

    /**
     * 生成分类 select树形结构
     * @param int $selectId   需要选中的分类 id
     * @param int $currentCid 需要隐藏的分类 id
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function adminCategoryTree($selectId = 0, $currentCid = 0)
    {
        $categories = $this->order("list_order ASC")
            ->where(function (Query $query) use ($currentCid) {
                if (!empty($currentCid)) {
                    $query->where('id', 'neq', $currentCid);
                }
            })
            ->select()->toArray();

        $tree       = new Tree();
        $tree->icon = ['&nbsp;&nbsp;│', '&nbsp;&nbsp;├─', '&nbsp;&nbsp;└─'];
        $tree->nbsp = '&nbsp;&nbsp;';

        $newCategories = [];
        foreach ($categories as $item) {
            $item['selected'] = $selectId == $item['id'] ? "selected" : "";

            array_push($newCategories, $item);
        }

        $tree->init($newCategories);
        $str     = '<option value=\"{$id}\" {$selected}>{$spacer}{$name}</option>';
        $treeStr = $tree->getTree(0, $str);

        return $treeStr;
    }

    /**
     * 分类树形结构
     * @param int    $currentIds
     * @param string $tpl
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function adminCategoryTableTree($currentIds = 0, $tpl = '')
    {
        $categories = $this->order("list_order")->select()->toArray();

        $tree       = new Tree();
        $tree->icon = ['&nbsp;&nbsp;│', '&nbsp;&nbsp;├─', '&nbsp;&nbsp;└─'];
        $tree->nbsp = '&nbsp;&nbsp;';

        if (!is_array($currentIds)) {
            $currentIds = [$currentIds];
        }

        $newCategories = [];
        foreach ($categories as $item) {
            $item['parent_id_node'] = ($item['parent_id']) ? ' class="child-of-node-' . $item['parent_id'] . '"' : '';
            $item['style']          = empty($item['parent_id']) ? '' : 'display:none;';
            $item['status_text']    = empty($item['status']) ? '<span class="label label-warning">隐藏</span>' : '<span class="label label-success">显示</span>';
            $item['checked']        = in_array($item['id'], $currentIds) ? "checked" : "";
            $item['img']            = empty($item['img']) ? '' : '<img src="'.$item['img'].'" width=80 height=80>';
            $item['str_action']     = '<a class="btn btn-xs btn-primary" href="' . url("Department/add", ["parent" => $item['id']]) . '">添加子分类</a>  <a class="btn btn-xs btn-primary" href="' . url("Department/edit", ["id" => $item['id']]) . '">' . lang('EDIT') . '</a>  <a class="btn btn-xs btn-danger js-ajax-delete" href="' . url("Department/delete", ["id" => $item['id']]) . '">' . lang('DELETE') . '</a> ';
            if ($item['status']) {
                $item['str_action'] .= '<a class="btn btn-xs btn-warning js-ajax-dialog-btn" data-msg="您确定隐藏此分类吗" href="' . url('Department/toggle', ['ids' => $item['id'], 'hide' => 1]) . '">隐藏</a>';
            } else {
                $item['str_action'] .= '<a class="btn btn-xs btn-success js-ajax-dialog-btn" data-msg="您确定显示此分类吗" href="' . url('Department/toggle', ['ids' => $item['id'], 'display' => 1]) . '">显示</a>';
            }
            array_push($newCategories, $item);
        }

        $tree->init($newCategories);

        if (empty($tpl)) {
            $tpl = " <tr id='node-\$id' \$parent_id_node style='\$style' data-parent_id='\$parent_id' data-id='\$id'>
                        <td style='padding-left:20px;'><input type='checkbox' class='js-check' data-yid='js-check-y' data-xid='js-check-x' name='ids[]' value='\$id' data-parent_id='\$parent_id' data-id='\$id'></td>
                        <td><input name='list_orders[\$id]' type='text' size='3' value='\$list_order' class='input-order'></td>
                        <td>\$id</td>
                        <td>\$spacer \$name</td>
                        <td>\$img</td>
                        <td>\$status_text</td>
                        <td>\$str_action</td>
                    </tr>";
        }
        $treeStr = $tree->getTree(0, $tpl);

        return $treeStr;
    }

    /**
     * 添加分类
     * @param $data
     * @return bool
     */
    public function addCategory($data)
    {
        $result = true;
        self::startTrans();
        try {
            if ($data['img'] && strpos($data['img'],'upload')===false){
                $data['img'] = '/upload/'.$data['img'];
            }
            $this->allowField(true)->save($data);
            $id = $this->id;
            if (empty($data['parent_id'])) {

                $this->where('id', $id)->update(['path' => '0-' . $id]);
            } else {
                $parentPath = $this->where('id', intval($data['parent_id']))->value('path');
                $this->where('id', $id)->update(['path' => "$parentPath-$id"]);

            }
            self::commit();
        } catch (\Exception $e) {
            self::rollback();
            $result = false;
        }

        return $result;
    }

    public function editCategory($data)
    {
        $result = true;

        $id          = intval($data['id']);
        $parentId    = intval($data['parent_id']);
        $oldCategory = $this->where('id', $id)->find();

        if (empty($parentId)) {
            $newPath = '0-' . $id;
        } else {
            $parentPath = $this->where('id', intval($data['parent_id']))->value('path');
            if ($parentPath === false) {
                $newPath = false;
            } else {
                $newPath = "$parentPath-$id";
            }
        }

        if (empty($oldCategory) || empty($newPath)) {
            $result = false;
        } else {

            $data['path'] = $newPath;
            if ($data['img'] && strpos($data['img'],'upload')===false){
                $data['img'] = '/upload/'.$data['img'];
            }
            $this->isUpdate(true)->allowField(true)->save($data, ['id' => $id]);

            $children = $this->field('id,path')->where('path', 'like', $oldCategory['path'] . "-%")->select();
            if (!$children->isEmpty()) {
                foreach ($children as $child) {
                    $childPath = str_replace($oldCategory['path'] . '-', $newPath . '-', $child['path']);
                    $this->where('id', $child['id'])->update(['path' => $childPath], ['id' => $child['id']]);
                }
            }
        }


        return $result;
    }


}