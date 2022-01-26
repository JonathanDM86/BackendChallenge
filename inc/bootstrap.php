<?php

/* 
 * Archivo para la inicializacion de rutas del MVC
 */
define("PROJECT_ROOT_PATH",__DIR__."/../");
// include main configuration file
require_once PROJECT_ROOT_PATH."/inc/conf.php";

// include the base controller file
require_once PROJECT_ROOT_PATH."/controller/Api/BaseController.php";

// include the use model file
require_once PROJECT_ROOT_PATH."/model/UserModel.php";
require_once PROJECT_ROOT_PATH."/model/RelationsModel.php";
require_once PROJECT_ROOT_PATH."/model/LoginModel.php";
require_once PROJECT_ROOT_PATH."/controller/Api/AuthenticationController.php";