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

//foreach ($camera_list as $key => $item){
//$item->format_time = $time_format->transTime($item->create_time);
//$data[$item['format_time']][] = $item->toArray();
//}
//$camera_list = $data;
}