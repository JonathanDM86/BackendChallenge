<?php
/**
 * Description of RelationsController
 * Clases para realizar las acciones para las relaciones entre usuarios
 * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
 */
class RelationsController extends BaseController{
    public function addAction($idUserA){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $aQStP=$this->getDataJson();
        if(strtoupper($requestMethod)=='POST'&&(is_array($aQStP)&&count($aQStP)>0)){
            try{
                $rModel=new RelationsModel();
                if(isset($aQStP['Email']) && $aQStP['Email']){
                    $respEmail=$rModel->valEmail($aQStP['Email'],0);
                    if(count($respEmail)>0 && !isset($respEmail["Err"])){
                        $idUserR=$respEmail[0]['id_user'];
                        $valR=$rModel->valRelation($idUserA,$idUserR);
                        if(empty($valR) && $idUserA!=$idUserR){
                            $resp=$rModel->addRelations($idUserA,$idUserR);
                            if(trim($resp)==""){
                                $result=true;$response="Relationship added";
                                $this->updateBadges($idUserA);
                            }
                            else{ $result=false; $response=$resp;}
                        }
                        else{
                            $result=false;
                            $response="Exist a relationship with this email or you can't add a relationship with yourself."; 
                        }
                    }
                    else{
                        $result=false;
                        $response="Invalid Email or Email not exists.";
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
                $strErrorDesc='Something went wrong! Please contact support. '.$e->getMessage();
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
    
    public function deleteAction($idUserA){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $aQStP=$this->getDataJson();
        if(strtoupper($requestMethod)=='POST'&&(is_array($aQStP)&&count($aQStP)>0)){
            try{
                $rModel=new RelationsModel();
                if(isset($aQStP['Email']) && $aQStP['Email']){
                    $respEmail=$rModel->valEmail($aQStP['Email'],0);
                    if(count($respEmail)>0 && !isset($respEmail["Err"])){
                        $idUserR=$respEmail[0]['id_user'];
                        $valR=$rModel->valRelation($idUserA,$idUserR);
                        if(empty($valR) || ($idUserA==$idUserR)){
                            $result=false;
                            $response="Not exist a relationship with this email or you can't delete a relationship with yourself."; 
                        }
                        else{
                            $resp=$rModel->deleteRelations($idUserA,$idUserR);
                            if(trim($resp)==""){
                                $result=true;$response="Relationship deleted";
                                $this->updateBadges($idUserA);
                            }
                            else{ $result=false; $response=$resp;}
                        }
                    }
                    else{
                        $result=false;
                        $response="Invalid Email or Email not exists.";
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
                $strErrorDesc='Something went wrong! Please contact support. '.$e->getMessage();
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

    public function listAction(){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $aQStP=$this->getQueryStringParams();
        if(strtoupper($requestMethod)=='GET' && (is_array($aQStP) && count($aQStP)>0)){
            try{
                $rModel=new RelationsModel();
                if(isset($aQStP['Email']) && $aQStP['Email']){
                    $respEmail=$rModel->valEmail($aQStP['Email'],0);
                    if(count($respEmail)>0 && !isset($respEmail["Err"])){
                        $idUser=$respEmail[0]['id_user'];
                        $depth=1;
                        if(isset($aQStP['Depth'])&&$aQStP['Depth']&&($aQStP['Depth']>0&&$aQStP['Depth']<3)){
                            $depth=$aQStP['Depth'];
                        }
                        $resp=$rModel->listRelations($idUser,$depth);
                        if(empty($resp)){
                            $result=false;
                            $response="No relationships registered for this Email.";
                        }
                        else{
                            $result=true;
                            $response=$resp;
                        }
                    }
                    else{
                        $result=false;
                        $response="Invalid Email or Email not exists.";
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
                $strErrorDesc='Something went wrong! Please contact support. '.$e->getMessage();
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

    public function randomAction($idUser){
        $strErrorDesc='';
        $requestMethod=filter_input(INPUT_SERVER,'REQUEST_METHOD');
        $aQStP=$this->getDataJson();
        if(strtoupper($requestMethod)=='POST'&&(is_array($aQStP)&&count($aQStP)>0)){
            try{
                $rModel=new RelationsModel();
                if(isset($aQStP['Random']) && $aQStP['Random']){
                    $random=$aQStP['Random'];
                    $resRandom=$rModel->getRandom($idUser);
                    if(!empty($resRandom)){
                        $arrUsers=$arrayResp=array();
                        foreach($resRandom as $value) {$arrUsers[]=$value['id_user'];}
                        shuffle($arrUsers);
                        $arrayU=array_slice($arrUsers,0,$random);
                        foreach ($arrayU as $idUserR) {
                            $resp=$rModel->addRelations($idUser,$idUserR);
                            if(trim($resp)=="") {$result=true;$response="Relationship added";}
                            else{ $result=false; $response=$resp;}
                            $arrayResp[]=array('result'=>$result,'response'=>$response);
                        }
                        $this->updateBadges($idUser);
                    }
                    else{
                        $result=false;
                        $strErrorDesc = 'No users to add a relationships';
                        $strErrorHeader = 'HTTP/1.1 200 OK';
                    }
                }
                else{
                    $result=false;
                    $strErrorDesc = 'Missing Fields "Random"';
                    $strErrorHeader = 'HTTP/1.1 200 OK';
                }
            }
            catch(Error $e){
                $result=false;
                $strErrorDesc='Something went wrong! Please contact support. '.$e->getMessage();
                $strErrorHeader='HTTP/1.1 500 Internal Server Error';
            }
        }
        else{
            $result=false;
            $strErrorDesc = 'Method not supported or no parameters Random.';
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }
        if(!$strErrorDesc){
            $this->sendOutput(json_encode($arrayResp),
                array('Content-Type:application/json','HTTP/1.1 200 OK')
            );
        }
        else{
            $this->sendOutput(json_encode(array('result'=>$result,'response'=>$strErrorDesc)),
                array('Content-Type:application/json',$strErrorHeader)
            );
        }
    }
    
    private function updateBadges($idUser){
        $rModel=new RelationsModel();
        $resBadge=$rModel->getBadges($idUser);
        $idBadge=5;
        if(!empty($resBadge)){$idBadge=$resBadge[0]['id_badge'];}
        $rModel->updateBadge($idUser,$idBadge);
    }
}