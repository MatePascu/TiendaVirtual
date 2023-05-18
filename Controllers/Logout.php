<?php 
  class Logout{
    public function __construct(){
      session_start();
      session_unset(); // Limpia las variables de sesion
      session_destroy(); // Destruye todas las sesiones
      header('location: '.base_url().'/login'); // Redirecciona
    }
  }
?>