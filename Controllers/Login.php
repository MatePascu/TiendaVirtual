<?php 
	class Login extends Controllers{
		public function __construct(){
      session_start();
			if(isset($_SESSION['login'])){ // isset comprueba si existe una variable
				header('Location: '.base_url().'/dashboard');
			}
			parent::__construct();
		}

		public function login(){
			$data['page_tag'] = "Login - Tienda Virtual";
			$data['page_title'] = "Tienda Virtual";
			$data['page_name'] = "login";
			$data['page_functions_js'] = "functions_login.js";
			$this->views->getView($this, "login", $data);
		}

    public function loginUser(){
      if($_POST){
        if(empty($_POST['txtEmail']) || empty($_POST['txtPassword'])){
          $arrResponse = array('status' => false, 'msg' => 'Error de datos');
        }else{
          $strUsuario = strtolower(strClean($_POST['txtEmail']));
          $strPassword = hash('SHA256', $_POST['txtPassword']);
          $requestUser = $this->model->loginUser($strUsuario, $strPassword);
          if(empty($requestUser)){
            $arrResponse = array('status' => false, 'msg' => 'El usuario o la contraseña es incorrecto');
          }else{
            $arrData = $requestUser;
            if($arrData['status'] == 1){
              $_SESSION['idUser'] = $arrData['idpersona'];
              $_SESSION['login'] = true;
              $arrData = $this->model->sessionLogin($_SESSION['idUser']);
              $_SESSION['userData'] = $arrData;
              $arrResponse = array('status' => true, 'msg' => 'ok');
            }else{
              $arrResponse = array('status' => false, 'msg' => 'Usuario inactivo');
            }
          }
        }
        echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
      }
      die();
    }

    public function resetPass(){
      if($_POST){
        if(empty($_POST['txtEmailReset'])){
          $arrResponse = array('status' => false, 'msg' => 'Error de datos');
        }else{
          $token = token(); // Funcion token definida en archivo helpers
          $strEmail = strtolower(strClean($_POST['txtEmailReset']));
          $arrData = $this->model->getUserEmail($strEmail);
          if(empty($arrData)){
            $arrResponse = array('status' => false, 'msg' => 'Usuario no encontrado');
          }else{
            $idpersona = $arrData['idpersona'];
            $nombreUsuario = $arrData['nombre'].' '.$arrData['apellido'];
            $url_recovery = base_url().'login/confirmUser/'.$strEmail.'/'.$token;
            $requestUpdate = $this->model->setTokenUser($idpersona, $token);
            if($requestUpdate){
              $arrResponse = array('status' => true, 'msg' => 'Se ha enviado un email a tu correo para cambiar la contraseña.');
            }else{
              $arrResponse = array('status' => false, 'msg' => 'No es posible realizar el proceso, intenta más tarde.');
            }
          }
        }
        echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
      }
      die();
    }
	}
?>