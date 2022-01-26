<?php
/**
 * Description of BaseController
 *
 * @author Jonathan Díaz Morales
 */
class BaseController {
    public function __call($name,$arguments){
        $this->sendOutput('', array('HTTP/1.1 404 Not Found'));
    }
    /**
     * Get URI elements.
     * 
     * @return array
     */
    protected function getUriSegments(){
        $request_uri= filter_input(INPUT_SERVER,'REQUEST_URI');
        $uri=parse_url($request_uri,PHP_URL_PATH);
        $uri_r=explode('/',$uri);
        return $uri_r;
    }
    
    /**
     * Get querystring params.
     * 
     * @return array
     */
    protected function getQueryStringParams(){
        $query=array();
        $query_string=filter_input(INPUT_SERVER,'QUERY_STRING');
        parse_str($query_string,$query);
        return $query;
    }
    
    /**
     * Get data froM json post.
     * 
     * @return array
     */
    protected function getDataJson(){
        $data = json_decode(file_get_contents("php://input"),true);
        return $data;
    }
    
    /**
     * Send API output.
     *
     * @param mixed  $data
     * @param string $httpheaders
     */
    protected function sendOutput($data,$httpHeaders=array()){
        header_remove('Set-Cookie');
        if(is_array($httpHeaders)&&count($httpHeaders)){
            foreach ($httpHeaders as $httpHeader){
                header($httpHeader);
            }
        }
        echo $data;
        exit;
    }
}