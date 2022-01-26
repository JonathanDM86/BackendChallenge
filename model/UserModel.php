<?php
/**
 * Description of UserModel
 *
 * @author Jonathan Diaz Morales
 * Clases del modelo de usuario que extiende Database
 * para acceder a la base de datos
 */
require_once PROJECT_ROOT_PATH."/model/Database.php";
class UserModel extends Database{
    public function addUsers($aFields){
        $FirstName=$aFields['FirstName'];
        $LastName=$aFields['LastName'];
        $Email=$aFields['Email'];
        $Password=md5($aFields['Password']);
        $idCountry=$this->selectCountry($aFields['Country']);
        $query="INSERT INTO ".TABLE_USER." (FirstName,LastName,Email,Password,id_country) 
        VALUES (?,?,?,?,?)";
        $params=array("ssssi",$FirstName,$LastName,$Email,$Password,$idCountry[0]['id_country']);
        return $this->addUser($query,$params);
    }
    public function deleteUsers($Email,$idUser){
        $query="UPDATE ".TABLE_USER." SET status='D' WHERE Email=? AND id_user=?";
        $params=array("si",$Email,$idUser);
        return $this->deleteUser($query,$params);
    }
    public function updateUsers($aFields,$idUser){
        $FirstName=(isset($aFields['FirstName'])?$aFields['FirstName']:'');
        $LastName=(isset($aFields['LastName'])?$aFields['LastName']:'');
        $Email=(isset($aFields['Email'])?$aFields['Email']:'');
        $Password=(isset($aFields['Password'])?md5($aFields['Password']):'');
        $idCountry=(isset($aFields['Country'])?$this->selectCountry($aFields['Country']):0);
        $qu="";
        if(isset($FirstName) && trim($FirstName)!='') $qu.=", FirstName='$FirstName'";
        if(isset($LastName) && trim($LastName)!='') $qu.=", LastName='$LastName'";
        if(isset($Email) && trim($Email)!='') $qu.=", Email='$Email'";
        if(isset($Password) && trim($Password)!='') $qu.=", Password='$Password'";
        if(isset($idCountry) && (is_array($idCountry) && $idCountry[0]['id_country']>0)) $qu.=", id_country=".$idCountry[0]['id_country']."";
        $query="UPDATE ".TABLE_USER." SET id_user=$idUser $qu WHERE id_user=?";
        $params=array("i",$idUser);
        return $this->updateUser($query,$params);
    }
    public function valEmail($Email,$idUser){
        if(!filter_var($Email,FILTER_VALIDATE_EMAIL)){
            $aValE=["Err" =>"Invalid email address"];
            return $aValE;
        }
        else return $this->selectEmail($Email,$idUser);
    }
    public function valCountry($codeCountry){
        $response=$this->selectCountry($codeCountry);
        if(count($response)>0){return true;}
        else{return false;}
    }
}