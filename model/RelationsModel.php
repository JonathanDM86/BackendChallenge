<?php
/**
 * Description of RelationsModel
 * Clases del modelo de relaciones que extiende Database
 * para acceder a la base de datos
 * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
 */
require_once PROJECT_ROOT_PATH."/model/Database.php";
class RelationsModel extends Database{
    public function addRelations($idUserA,$idUserR){
        $date=date('Y-m-d');
        $time=date('H:i:s');
        $query="INSERT INTO t_relations (id_userA,id_userR,date_add,time_add) VALUES (?,?,?,?)";
        $params=array("iiss",$idUserA,$idUserR,$date,$time);
        return $this->addRelation($query,$params);
    }
    public function deleteRelations($idUserA,$idUserR){
        $query="UPDATE t_relations SET status='D' where id_userA=? AND id_userR=?";
        $params=array("ii",$idUserA,$idUserR);
        return $this->deleteRelation($query,$params); 
    }
    
    public function listRelations($idUser,$depth) {
        $query="SELECT u.FirstName,u.LastName,u.Email,c.`name` as Country,b.badge as Badge FROM t_users as u 
        INNER JOIN t_relations as r ON u.id_user=r.id_userR
        INNER JOIN c_countrys as c ON u.id_country=c.id_country
        INNER JOIN c_badges as b ON u.id_badge=b.id_badge
        WHERE r.`status`='A'";
        if($depth==1){
            $query.=" AND r.id_userA=?";
            $params=array("i",$idUser);
        }
        if($depth==2){
            $query.=" AND r.id_userA IN (SELECT id_userR 
            FROM t_relations WHERE id_userA=?) AND r.id_userR <> ?";
            $params=array("ii",$idUser,$idUser);
        }
        return $this->select($query,$params);
    }
    public function valEmail($Email,$idUser){
        if(!filter_var($Email,FILTER_VALIDATE_EMAIL)){
            $aValE=["Err" =>"Invalid email address"];
            return $aValE;
        }
        else return $this->selectEmail($Email,$idUser);
    }
    public function valRelation($idUserA,$idUserR){
        $query="SELECT id_relation FROM t_relations WHERE status='A' AND id_userA=? AND id_userR=?";
        $params=array("ii",$idUserA,$idUserR);
        return $this->select($query, $params);
    }
    public function getRandom($idUser) {
        $query="SELECT id_user FROM t_users 
        WHERE id_user NOT IN (SELECT id_userR FROM t_relations WHERE id_userA=?) AND id_user <>? ";
        $params=array("ii",$idUser,$idUser);
        return $this->select($query, $params);
    }
    
    public function getBadges($idUser) {
        $query="SELECT id_badge FROM c_badges WHERE 
        (SELECT COUNT(id_relation) FROM t_relations WHERE id_userA=? AND `status`='A' 
        GROUP BY id_userA) BETWEEN min AND max";
        $params=array("i",$idUser);
        return $this->select($query,$params);
    }
    public function updateBadge($idUser,$idBadge) {
        $query="UPDATE t_users SET id_badge=? WHERE id_user=?";
        $params=array("Ii",$idBadge,$idUser);
        return $this->updateUser($query,$params);
    }
}