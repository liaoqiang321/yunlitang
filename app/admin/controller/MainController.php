<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;
use app\admin\model\Menu;

class MainController extends AdminBaseController
{

    /**
     *  后台欢迎页
     */
    public function index()
    {
        $data = $this->request->param();
        if ($this->request->isPost()) {
            $month = $data['month'];
            $month_time = strtotime($month);
            $mdays = date( 't', $month_time );
            $month_time_end = $month_time + $mdays*86400;
            $income_month = Db::name('gxzh_order')->where(['pay_status'=>1,'created_at'=>['between',[$month_time,$month_time_end]]])->sum('money');

            $this->success("成功！",'',['income_month'=>round($income_month,2)]);
            return;
        }
        $today_time = strtotime(date('Y-m-d'));
        $today_users = Db::name('user')->where(['user_type'=>2,'create_time'=>['>',$today_time]])->count();
        $today_active = Db::name('user')->where(['user_type'=>2,'last_login_time'=>['>',$today_time]])->count();
        $today_questions = Db::name('gxzh_question')->where(['created_at'=>['>',$today_time]])->count();
        $today_answers = Db::name('gxzh_answer')->where(['created_at'=>['>',$today_time]])->count();

        $today_orders = Db::name('gxzh_order')->where(['created_at'=>['>',$today_time]])->count();
        $today_orders_money = Db::name('gxzh_order')->where(['pay_status'=>1,'created_at'=>['>',$today_time]])->sum('money');

        $all_users = Db::name('user')->where(['user_type'=>2])->count();
        $all_questions = Db::name('gxzh_question')->where([])->count();
        $all_answers = Db::name('gxzh_answer')->where([])->count();
        $all_orders = Db::name('gxzh_answer')->where(['pay_status'=>1])->count();

        $income = Db::name('gxzh_order')->where(['pay_status'=>1])->sum('money');
        $income_month = Db::name('gxzh_order')->where(['pay_status'=>1])->sum('money');

        $this->assign('today_users', $today_users);
        $this->assign('today_active', $today_active);
        $this->assign('today_questions', $today_questions);
        $this->assign('today_answers', $today_answers);

        $this->assign('today_orders', $today_orders);
        $this->assign('today_orders_money', $today_orders_money);

        $this->assign('all_users', $all_users);
        $this->assign('all_questions', $all_questions);
        $this->assign('all_answers', $all_answers);
        $this->assign('all_orders', $all_orders);

        $this->assign('income', $income);
        $this->assign('income_month', $income_month);

        return $this->fetch();
    }

    public function dashboardWidget()
    {
        $dashboardWidgets = [];
        $widgets          = $this->request->param('widgets/a');
        if (!empty($widgets)) {
            foreach ($widgets as $widget) {
                if ($widget['is_system']) {
                    array_push($dashboardWidgets, ['name' => $widget['name'], 'is_system' => 1]);
                } else {
                    array_push($dashboardWidgets, ['name' => $widget['name'], 'is_system' => 0]);
                }
            }
        }

        cmf_set_option('admin_dashboard_widgets', $dashboardWidgets, true);

        $this->success('更新成功!');

    }

}
