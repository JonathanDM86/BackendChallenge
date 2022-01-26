<?php
/**
 * Description of Database
 *
 * @author Jonathan Díaz Morales
 * Clases de modelo necesarias para conexion a BD
 */
class Database {
    protected $connection = null;
    
    public function __construct(){
        try {
            $this->connection=new mysqli(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_DATABASE_NAME);
            if(mysqli_connect_errno()){
                throw new Exception("Err: Could not connect to database.");   
            }
        }catch (Exception $e){
           throw new Exception("Err: Not connect. ".$e->getMessage()); 
        }
    }
    
    public function select($query="",$params=[]){
        try{
            $stmt=$this->executeStatement($query,$params);
            $result=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);				
            $stmt->close();
            return $result;
        }catch(Exception $e){
            throw New Exception("Err: Could not select. ".$e->getMessage());
        }
        return false;
    }
    public function addUser($query="",$params=[]){
        try{
            $stmt= $this->executeStatement($query,$params);
            $result=$stmt->error;
            $stmt->close();
            return $result;
        } catch (Exception $e) {
            throw New Exception("Err: Could not add user. ",$e->getMessage());
        }
    }
    public function deleteUser($query="",$params=[]){
        try{
            $stmt= $this->executeStatement($query,$params);
            $result=$stmt->error;
            $stmt->close();
            return $result;
        } catch (Exception $e) {
            throw New Exception("Err: Could not delete user. ",$e->getMessage());
        }
    }
    public function updateUser($query="",$params=[]){
        try{
            $stmt= $this->executeStatement($query,$params);
            $result=$stmt->error;
            $stmt->close();
            return $result;
        }
        catch (Exception $e) {
            throw New Exception("Err: Could not update user. ",$e->getMessage());
        }
    }
    public function selectCountry($code){
        $query="SELECT id_country FROM c_countrys WHERE code = ?";
        return $this->select($query,["s",$code]);
    }
    public function selectEmail($email,$idUser){
        $qUser='';
        if($idUser>0){$qUser.=" AND id_user = ?";}
        $query="SELECT id_user FROM ".TABLE_USER." WHERE Email = ? $qUser";
        if(trim($qUser)!=''){$params=array("si",$email,$idUser);}
        else {$params=array("s",$email);}
        return $this->select($query,$params);
    }
    public function loginV($query="",$params=[]){
        try{
            $stmt=$this->executeStatement($query,$params);
            $result=$stmt->get_result()->fetch_all(MYSQLI_ASSOC);				
            $stmt->close();
            return $result;
        }catch(Exception $e){
            throw New Exception("Err: Could not authenticate user. ".$e->getMessage());
        }
        return false;
    }
    public function addRelation($query="",$params=[]){
        try{
            $stmt= $this->executeStatement($query,$params);
            $result=$stmt->error;
            $stmt->close();
            return $result;
        }
        catch(Exception $e){throw New Exception("Err: Could not add relationship. ",$e->getMessage());}
    }
    public function deleteRelation($query="",$params=[]){
        try{
            $stmt= $this->executeStatement($query,$params);
            $result=$stmt->error;
            $stmt->close();
            return $result;
        }
        catch(Exception $e){throw New Exception("Err: Could not delete relationship. ",$e->getMessage());}
    }
    private function executeStatement($query="",$params=[]){
        try{
            $stmt=$this->connection->prepare($query);
            if($stmt===false){
                throw New Exception("Unable to do prepared statement:".$query);
            }
            if($params){
                $ref=new ReflectionClass('mysqli_stmt');
                $method=$ref->getMethod('bind_param');
                $method->invokeArgs($stmt,$this->refValues($params));
            }
            $stmt->execute();
            return $stmt;
        }catch(Exception $e){
            throw New Exception("Err: Could not prepare query. ".$e->getMessage());
        }
    }
    private function refValues($arr=[]){
        $refs=array();
        foreach($arr as $key => $value){$refs[$key]=&$arr[$key];}
        return $refs;
    }
}