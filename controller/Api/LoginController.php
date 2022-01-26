<?php

/**
 * Description of LoginController
 *
 * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
 */
class LoginController extends BaseController{
    public function loginAction(){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $data=$this->getDataJson();
        if(strtoupper($requestMethod)=='POST'){
            $vData=$this->validateData($data);
            $vEmail=$this->validateEmail($data['Email']);
            if($vData && $vEmail){
                $loginModel=new LoginModel();
                $resp=$loginModel->login($data);
                if(!empty($resp)){
                    $idUser=$resp[0]['id_user'];
                    if($idUser>0){
                        $result=true;
                        $response='Successful login.';
                        $auth= new AuthenticationController();
                        $token=$auth->authenticate($idUser);
                    }
                    else{
                        $result=false;
                        $strErrorDesc = 'Access denied | Login failed.';
                        $strErrorHeader = 'HTTP/1.1 200 OK';
                    }
                }
                else{
                    $result=false;
                    $strErrorDesc = 'Access denied | Login failed.';
                    $strErrorHeader = 'HTTP/1.1 200 OK';
                }
            }
            else{
                $result=false;
                $strErrorDesc = 'Please fill in all the required fields and with valid data.';
                $strErrorHeader = 'HTTP/1.1 200 OK';
            }
        }
        else{
            $result=false;
            $strErrorDesc = 'Method not supported.';
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity.';
        }
        if(!$strErrorDesc){
            $this->sendOutput(json_encode(
                array('result'=>$result,'response'=>$response,'token'=>$token)),
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
     * Validate data for add users
     * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
     * @param array Query String Params
     * @return boolean True if all fields exist and are not empty
     */
    private function validateData($data){
        $aData=['Email'=>'Email','Password'=>'Password'];
        $err=0;
        foreach($data as $key => $value){
            if(!array_key_exists($key,$aData) || trim($value)==""){$err++;}
        }
        if($err>0) return false;
        else return true;
    }
    private function validateEmail($email){
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)) return false;
        else return true;
    }
}
