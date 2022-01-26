<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Authentication
 *
 * @author Jonathan Diaz Morales <jonathan.dimor@gmail.com>
 */
require_once PROJECT_ROOT_PATH."/lib/jwt/jwt_utils.php";
class AuthenticationController{
    public function authenticate($idUsuario){
        $headers=array('alg'=>'HS256','typ'=>'JWT');
        $payload=array('idUser'=>$idUsuario,'exp'=>(time()+360));
        $jwt=generate_jwt($headers,$payload,'JgDm86#');
        $token=$jwt;
        return $token;
    }
    public function validateA(){
        $bearer_token=get_bearer_token();
        $is_jwt_valid=is_jwt_valid($bearer_token,'JgDm86#');
        return $is_jwt_valid;
    }
}