<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
require __DIR__."/inc/bootstrap.php";
require_once PROJECT_ROOT_PATH."/lib/jwt/jwt_utils.php";
$request_uri=filter_input(INPUT_SERVER,'REQUEST_URI');
$uri=parse_url($request_uri,PHP_URL_PATH);
$uri_r=explode('/',$uri);
$c_uri= count($uri_r);
$bearer_token=get_bearer_token();
if(array_key_exists($uri_r[$c_uri-2],$routes) && array_key_exists($uri_r[$c_uri-1],$routes[$uri_r[$c_uri-2]])){
    
    switch (trim($uri_r[$c_uri-2])){
        case 'user':
            require PROJECT_ROOT_PATH ."/controller/Api/UserController.php";
            $objFeedController=new UserController();  
        break;
        case 'relationships':
            require PROJECT_ROOT_PATH ."/controller/Api/RelationsController.php";
            $objFeedController=new RelationsController();
        break;
    }
    if($routes[$uri_r[$c_uri-2]][$uri_r[$c_uri-1]]['auth']){
        $is_jwt_valid=is_jwt_valid($bearer_token,$secretWord);
        if($is_jwt_valid){
            $idUser=getIdUser($bearer_token);
            $strMethodName=$routes[$uri_r[$c_uri-2]][$uri_r[$c_uri-1]]['route'];
            $objFeedController->{$strMethodName}($idUser);
        }
        else{
            header('HTTP/1.1 401 Unauthorized');
            echo json_encode(array('result'=>'false','response'=>"Please login first."));
        }
    }
    else{
        $strMethodName=$routes[$uri_r[$c_uri-2]][$uri_r[$c_uri-1]]['route'];
        $objFeedController->{$strMethodName}();
    }
}
else{
    header('Content-Type:application/json');
    header("HTTP/1.1 400 Bad Request");
    $result=json_encode(array('result'=>'No resource with given URL found.')); 
    echo $result;
}