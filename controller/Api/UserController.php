<?php
/**
 * Description of UserController
 * Clases para realizar las acciones para los usuarios
 * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
 */
require_once PROJECT_ROOT_PATH."/lib/Faker-master/src/autoload.php";
class UserController extends BaseController{
     /**
     * "/user/import" Endpoint - Import
     * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
     */
    public function importAction(){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $aQSP=$this->getQueryStringParams();        
        if(strtoupper($requestMethod)=='GET'){
            try{
                $err=0;
                $userModel = new UserModel();
                $intLimit=5; $codeCountry='US';
                if(isset($aQSP['Number']) && $aQSP['Number']){
                    $intLimit=$aQSP['Number'];
                }
                if(isset($aQSP['Country']) && $aQSP['Country']){
                    $codeCountry=$aQSP['Country'];
                    $resCountry=$userModel->valCountry($codeCountry);
                   if(!$resCountry) $err++;
                }
                if($err>0){
                    $result=false;
                    $strErrorDesc='Invalid country code.';
                    $strErrorHeader='HTTP/1.1 200 OK';
                }
                else{
                    $faker=Faker\Factory::create();
                    for($i=1;$i<=$intLimit;$i++){
                        $FirstName=$faker->firstName;
                        $LastName=$faker->lastName;
                        $Email=$faker->email;
                        $Password=$faker->password(6,10);
                        $Country=$codeCountry;
                        $respEmail=$userModel->valEmail($Email,0);
                        if(count($respEmail)>0){$i--;}
                        else{
                            $aData=['FirstName'=>$FirstName,'LastName'=>$LastName,'Email'=>$Email,
                            'Password'=>md5($Password),'Country'=>$Country];
                            $response=$userModel->addUsers($aData);
                            if(trim($response)=="") {$result=true;$response="User added: $FirstName $LastName $Email '$Password' $Country";}
                            else $result=false;
                            $aOutPut[]=array('result'=>$result,'response'=>$response);
                        }
                    }
                }
            }
            catch(Error $e){
                $result=false;
                $strErrorDesc=$e->getMessage().'Something went wrong! Please contact support.';
                $strErrorHeader='HTTP/1.1 500 Internal Server Error';
            }
        }
        else{
            $result=false;
            $strErrorDesc = 'Method not supported.';
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }
        if(!$strErrorDesc){
            $this->sendOutput(json_encode($aOutPut),
                array('Content-Type:application/json','HTTP/1.1 200 OK')
            );
        }
        else{
            $this->sendOutput(json_encode(array('result'=>'false','response'=>$strErrorDesc)),
                array('Content-Type:application/json',$strErrorHeader)
            );
        }
    }
    /**
     * "/user/add" Endpoint - Add users
     * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
     */
    public function addAction(){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $aQStP=$this->getQueryStringParams();
        if(strtoupper($requestMethod)=='GET' && (is_array($aQStP) && count($aQStP)>0)){
            try{
                $userModel = new UserModel();
                $valD=$this->validateData($aQStP);
                $valE=$valC=true;
                if(isset($aQStP['Email']) && $aQStP['Email']){
                    $respEmail=$userModel->valEmail($aQStP['Email'],0);
                    if(count($respEmail)>0){$valE=false;}
                }
                if(isset($aQStP['Country']) && $aQStP['Country']){
                    $codeCountry=$aQStP['Country'];
                    $resCountry=$userModel->valCountry($codeCountry);
                   if(!$resCountry) $valC=false;
                }
                if($valD && $valE && $valC){
                    $response=$userModel->addUsers($aQStP);
                    if(trim($response)=="") {$result=true;$response="User added";}
                    else $result=false;
                }
                else{
                    $result=false;
                    $strErrorDesc = 'Missing Fields or Email/ Country code not valid.';
                    $strErrorHeader = 'HTTP/1.1 200 OK';
                }
            }
            catch(Error $e){
                $result=false;
                $strErrorDesc=$e->getMessage().'Something went wrong! Please contact support.';
                $strErrorHeader='HTTP/1.1 500 Internal Server Error';
            }
        }
        else{
            $result=false;
            $strErrorDesc = 'Method not supported or no parameters.';
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }
        if(!$strErrorDesc){
            $this->sendOutput(json_encode(array('result'=>$result,'response'=>$response)),
                array('Content-Type:application/json','HTTP/1.1 200 OK')
            );
        }
        else{
            $this->sendOutput(json_encode(array('result'=>'false','response'=>$strErrorDesc)),
                array('Content-Type:application/json',$strErrorHeader)
            );
        }
    }
     /**
     * "/user/delete" Endpoint - Delete users
     * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
     */
    public function deleteAction($idUser){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $aQStP=$this->getDataJson();
        if(strtoupper($requestMethod)=='POST' && (is_array($aQStP) && count($aQStP)>0)){
            try{
                $userModel=new UserModel();
                if(isset($aQStP['Email']) && $aQStP['Email']){
                    $respEmail=$userModel->valEmail($aQStP['Email'],$idUser);
                    if(count($respEmail)>0 && !isset($respEmail["Err"])){
                        $response=$userModel->deleteUsers($aQStP['Email'],$idUser);
                        if(trim($response)=="") {$result=true;$response="User deleted";}
                        else $result=false;
                    }
                    else{
                        $result=false;
                        $response="Invalid Email or Email not exists or Is not your Email.";
                    }
                }
                else{
                    $result=false;
                    $strErrorDesc = 'Missing Fields';
                    $strErrorHeader = 'HTTP/1.1 200 OK';
                }
            }
            catch(Error $e){
                $result=false;
                $strErrorDesc=$e->getMessage().'Something went wrong! Please contact support.';
                $strErrorHeader='HTTP/1.1 500 Internal Server Error';
            }
        }
        else{
            $result=false;
            $strErrorDesc = 'Method not supported or no parameters.';
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }
        if(!$strErrorDesc){
            $this->sendOutput(json_encode(array('result'=>$result,'response'=>$response)),
                array('Content-Type:application/json','HTTP/1.1 200 OK')
            );
        }
        else{
            $this->sendOutput(json_encode(array('result'=>$result,'response'=>$strErrorDesc)),
                array('Content-Type:application/json',$strErrorHeader)
            );
        }
    }
     /**
     * "/user/update" Endpoint - Update users
     * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
     */
    public function updateAction($idUser){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $aQStP=$this->getDataJson();
        if(strtoupper($requestMethod)=='POST' && count($aQStP)>0){
            try{
                $userModel = new UserModel();
                $valD=$this->validateDataUpdate($aQStP);
                $valE=$valC=true;
                if(isset($aQStP['Email']) && $aQStP['Email']){
                    $respEmail=$userModel->valEmail($aQStP['Email'],$idUser);
                    if(count($respEmail)>0){$valE=false;}
                }
                if(isset($aQStP['Country']) && $aQStP['Country']){
                    $codeCountry=$aQStP['Country'];
                    $resCountry=$userModel->valCountry($codeCountry);
                   if(!$resCountry) $valC=false;
                }
                if($valD && $valE && $valC){
                    $response=$userModel->updateUsers($aQStP,$idUser);
                    if(trim($response)==""){$result=true;$response="User updated";}
                    else $result=false;
                }
                else{
                    $result=false;
                    $strErrorDesc = 'At least one field is required to update user information or a valid Email or a valid country code.';
                    $strErrorHeader = 'HTTP/1.1 200 OK';
                }
            }
            catch(Error $e){
                $result=false;
                $strErrorDesc=$e->getMessage().'Something went wrong! Please contact support.';
                $strErrorHeader='HTTP/1.1 500 Internal Server Error';
            }
        }
        else{
            $result=false;
            $strErrorDesc = 'Method not supported or not valid parameters.';
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }
        if(!$strErrorDesc){
            $this->sendOutput(json_encode(array('result'=>$result,'response'=>$response)),
                array('Content-Type:application/json','HTTP/1.1 200 OK')
            );
        }
        else{
            $this->sendOutput(json_encode(array('result'=>'false','response'=>$strErrorDesc)),
                array('Content-Type:application/json',$strErrorHeader)
            );
        }
    }
    /**
     * Validate data for add users
     * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
     * @param array Query String Params
     * @return boolean True if all fields exist and are not empty
     */
    private function validateData($queryStringP){
        $aDAta=[
            'FirstName'=>'First Name',
            'LastName'=>'Last Name',
            'Email'=>'Email',
            'Password'=>'Password',
            'Country'=>'Country',
            ];
        $err=0;
        foreach($queryStringP as $key => $value){
            if(!array_key_exists($key,$aDAta) || trim($value)==""){$err++;}
        }
        if($err>0) return false;
        else return true;
    }
    
    /**
     * Validate data for update user
     * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
     * @param array Query String Params
     * @return boolean True If at least one of the fields is not empty
     */
    private function validateDataUpdate($queryStringP){
        $aDAta=[
            'FirstName'=>'First Name',
            'LastName'=>'Last Name',
            'Email'=>'Email',
            'Password'=>'Password',
            'Country'=>'Country',
            ];
        $ok=0;
        foreach($queryStringP as $key => $value){
            if(array_key_exists($key,$aDAta) && trim($value)!=""){$ok++;}
        }
        if($ok>0) return true;
        else return false;
    }
}