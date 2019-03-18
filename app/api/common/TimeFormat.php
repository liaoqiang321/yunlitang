<?php
namespace app\api\common;

class TimeFormat
{
    public function transTime($good_time)
    {
        $ytime = date("Y-m-d H:i",$good_time);
        $rtime = date("n月j日 H:i",$good_time);
        $htime = date("H:i",$good_time);
        $time_difference = time() - $good_time;
        $today_time = strtotime("today");
        $yesterday_time = strtotime("yesterday");
        $time1 = time() - $today_time;
        $time2 = time() - $yesterday_time;
        if($time_difference < $time1){
            $str = '今天';
        }else if($time_difference < $time2){
            $str = '昨天';
        }else{
            $str = date("Y-m-d", $good_time);
        }
        return $str;
    }

    //日期快捷搜索
    public function fast_date_search($para)
    {
        if ($para['key'] == 'all_year'){
            $time = [
                $start_time = date("Y-01-01", time()),
                $end_time = date("Y-12-31", time())
            ];
        }elseif ($para['key'] == 'this_quarter'){
            if (date("m") >= 1 && date("m") <= 3){
                $time = [
                    $start_time = date("Y-01-01", time()),
                    $end_time = date("Y-03-31", time())
                ];
            }elseif (date("m") >= 4 && date("m") <= 6){
                $time = [
                    $start_time = date("Y-04-01", time()),
                    $end_time = date("Y-06-31", time())
                ];
            }elseif (date("m") >= 7 && date("m") <= 9){
                $time = [
                    $start_time = date("Y-07-01", time()),
                    $end_time = date("Y-09-31", time())
                ];
            }elseif (date("m") >= 10 && date("m") <= 12){
                $time = [
                    $start_time = date("Y-10-01", time()),
                    $end_time = date("Y-12-31", time())
                ];
            }
        }elseif ($para['key'] == 'last_quarter'){
            if (date("m") >= 1 && date("m") <= 3){
                $time = [
                    $start_time = date('Y-10-1', strtotime('-1 year', time())),
                    $end_time = date('Y-12-31', strtotime('-1 year', time()))
                ];
            }elseif (date("m") >= 4 && date("m") <= 6){
                $time = [
                    $start_time = date("Y-01-01", time()),
                    $end_time = date("Y-03-31", time())
                ];
            }elseif (date("m") >= 7 && date("m") <= 9){
                $time = [
                    $start_time = date("Y-04-01", time()),
                    $end_time = date("Y-06-31", time())
                ];
            }elseif (date("m") >= 10 && date("m") <= 12){
                $time = [
                    $start_time = date("Y-7-01", time()),
                    $end_time = date("Y-9-31", time())
                ];
            }
        }elseif ($para['key'] == 'this_month'){
                $time = [
                    $start_time = date("Y-m-01", time()),
                    $end_time = date("Y-m-31", time())
                ];
        }elseif ($para['key'] == 'last_month'){
            $time = [
                $start_time = date("Y-m-01", strtotime('-1 month', time())),
                $end_time = date("Y-m-31", strtotime('-1 month', time()))
            ];
        }
        return $time;
    }
}