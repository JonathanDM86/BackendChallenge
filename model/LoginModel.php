<?php
/**
 * Description of LoginModel
 *
 * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
 */
require_once PROJECT_ROOT_PATH."/model/Database.php";
class LoginModel extends Database{
    public function login($data) {
        $Email=$data['Email'];
        $Password=md5($data['Password']);
        $query="SELECT id_user FROM ".TABLE_USER." WHERE Email=? AND Password=?";
        $params=array("ss",$Email,$Password);
        return $this->loginV($query,$params);
    }
}