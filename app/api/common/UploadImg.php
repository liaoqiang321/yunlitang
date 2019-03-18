<?php
namespace app\api\common;

class UploadImg
{
    public function saveBase64Img($base64string, $savePath, $old_img = '', $img_name = '', $allowType = 'jpg,bmp,gif,png', $maxSize = 3072, $type = '')
    {
        if (empty($base64string)) {
            return 'EMPTY';
        }
        // 处理存储地址，该地址不能以‘/’开头
        $savePath = trim($savePath, '/') . '/';
        // 数据以逗号分隔，第二部分为图片数据，第一部分为图片mine信息
        $img_arr = explode(',', $base64string);

        $mime = $img_arr[0]; // data:image/jpeg;base64
        $tmp = explode(';', $mime);
        // 获取加密类型
        $mime_info['encry'] = $tmp[1];
        // 获取mine类型
        $tmp1 = explode(':', $tmp[0]);
        $mime = $tmp1[1];
        // 获取类型/子类型
        $mime_info['mime'] = $mime;
        switch ($mime) {
            case 'image/bmp':
                $mime_info['suffix'] = 'bmp';
                break;
            case 'image/gif':
                $mime_info['suffix'] = 'gif';
                break;
            case 'image/jpeg':
                $mime_info['suffix'] = 'jpg';
                break;
            case 'image/jpg':
                $mime_info['suffix'] = 'jpg';
                break;
            case 'image/png':
                $mime_info['suffix'] = 'png';
                break;
            default:

                break;
        }
        /* 如果后缀名为空，或者不在允许的类型之中，返回false */
        if (empty($mime_info['suffix']) || !in_array($mime_info['suffix'], explode(',', $allowType))) {
            return 'NOT_ALLOW_TYPE';
        }
        // 计算图片流大小
        $strLength = strlen($img_arr[1]);
        $fileLength_byte = $strLength - ($strLength / 8) * 2; // Byte
        $fileLength = ceil($fileLength_byte / 1024); // Kb
        /* 如果文件大小大于限制的大小，返回false */
        if ($fileLength > $maxSize) {
            return 'MAX_SIZE';
        }
        // 检测目标文件夹是否存在
        if (!file_exists($savePath)) {
            mkdir($savePath);
        }
        // 取出图片源数据
        $img = $img_arr[1];
        // 将编码过的数据转换为图片对象
        $img = base64_decode($img);
        // 设置存储的图片名称
        if (empty($img_name)) {
            $img_name = uniqid();
        }
        // 对图片重命名，并存储到指定路径
        $img_path = $savePath . $img_name . '.' . $mime_info['suffix'];
        $res = file_put_contents($img_path, $img);
        if (!empty($old_img)) {
            unlink(trim($old_img, '/'));
        }
        // 处理返回的地址，以 / 开头，方便存入数据库以及其它地方调用
        if ($type) {
            $img_path = $img_path;
        } else {
//            $img_path = '/' . $img_path;
            $img_path = $img_path;
        }
        return $img_path;
    }
}