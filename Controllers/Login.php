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
              $_SESSION['timeout'] = true;
              $_SESSION['inicio'] = time(); //time funcion de php q devuelve hora en int
              $arrData = $this->model->sessionLogin($_SESSION['idUser']);
              sessionUser($_SESSION['idUser']); //Funcion en helpers
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
        error_reporting(0); //Envita que se envien errores

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

            $dataUsuario = array ('nombreUsuario' => $nombreUsuario,
                                  'email' => $strEmail,
                                  'asunto' => 'Recuperar cuenta - '.NOMBRE_REMITENTE,
                                  'url_recovery' => $url_recovery);

            if($requestUpdate){
              $sendEmail = sendEmail($dataUsuario, 'email_cambioPassword');
              if($sendEmail){
                $arrResponse = array('status' => true, 'msg' => 'Se ha enviado un email a tu correo para cambiar la contraseña.');
              }else{
                $arrResponse = array('status' => false, 'msg' => 'No es posible realizar el proceso, intenta más tarde.');
              }
            }else{
              $arrResponse = array('status' => false, 'msg' => 'No es posible realizar el proceso, intenta más tarde.');
            }
          }
        }
        echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
      }
      die();
    }

    public function confirmUser(string $params){
      if(empty($params)){
        header('Location: '.base_url());
      }else{
        $arrParams = explode(',', $params); // Explode separa un string teniendo en cuenta el caracter indicado (,) y los guarda en un array
        $strEmail = strClean($arrParams[0]);
        $strToken = strClean($arrParams[1]);

        $arrResponse = $this->model->getUsuario($strEmail, $strToken);
        if(empty($arrResponse)){
          header('Location: '.base_url());
        }else{
          $data['page_tag'] = "Cambiar contraseña";
          $data['page_title'] = "Cambiar Contraseña";
          $data['email'] = $strEmail;
          $data['token'] = $strToken;
          $data['page_name'] = "cambiar_contrasenia";
          $data['idpersona'] = $arrResponse['idpersona'];
          $data['page_functions_js'] = "functions_login.js";
          $this->views->getView($this, 'cambiar_password', $data);
        }
      }
      die();
    }

    public function setPassword(){
      if(empty($_POST['idUsuario']) || empty($_POST['txtPassword']) || empty($_POST['txtPasswordConfirm']) || empty($_POST['txtToken']) || empty($_POST['txtEmail'])){
        $arrResponse = array('status' => false, 'msg' => 'Error de datos');
      }else{
        $intIdpersona = intval($_POST['idUsuario']);
        $strPassword = $_POST['txtPassword'];
        $strEmail = strClean($_POST['txtEmail']);
        $strToken = strClean($_POST['txtToken']);
        $strPasswordConfirm = $_POST['txtPasswordConfirm'];

        if($strPassword != $strPasswordConfirm){
          $arrResponse = array('status' => false, 'msg' => 'Las contraseñas no son iguales');
        }else{
          $arrResponseUser = $this->model->getUsuario($strEmail, $strToken);
          if(empty($arrResponseUser)){
            $arrResponse = array('status' => false, 'msg' => 'Error de datos');
          }else{
            $strPassword = hash("SHA256", $strPassword);
            $requestPass = $this->model->insertPassword($intIdpersona, $strPassword);
            if($requestPass){
              $arrResponse = array('status' => true, 'msg' => 'Contraseña actualizada con exito.');
            }else{
              $arrResponse = array('status' => false, 'msg' => 'No es posible realizar el proceso, intente mas tarde.');
            }
          }
        }
      }
      echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
      die();
    }
	}
?>