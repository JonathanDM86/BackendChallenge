<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require __DIR__."/inc/bootstrap.php";
require PROJECT_ROOT_PATH ."/controller/Api/LoginController.php";

$objFeedController=new LoginController();
$objFeedController->loginAction();