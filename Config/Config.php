<?php 
	
	//define("BASE_URL", "http://localhost/tienda_virtual/");
	//const BASE_URL = "https://abelosh.com/store";
	const BASE_URL = "http://localhost/tienda_virtual";

	//Zona horaria
	date_default_timezone_set('America/Guatemala');

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	const DB_NAME = "db_tiendavirtual";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB_CHARSET = "utf8";

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "$";
	const CURRENCY = "USD";

	//Api PayPal
	//SANDBOX PAYPAL
	const URLPAYPAL = "https://api-m.sandbox.paypal.com";
	const IDCLIENTE = "AZit03iz_ejMjH9390z9KYlMN6fCRC4GnGjkVBdihP-RD6Y63U5g73_A9BiwYkvniJPbeTi6e50GnnzO";
	const SECRET = "EGggxyvcp7pl60HFIiUoRJg-1nsNIQI9b7WQF_hdzkmK2RoX5EaC2153aaQMRCHj1QnJkmrFGoS2gM-R";
	//LIVE PAYPAL
	//const IDCLIENTE = "AbuLAnHKgYtraRXUzmkLxVn9DQ4D2zDQxlDhUcyWJpq2bbMS2Gs0aAW20qwZzEblQ0inKLUlZ_Tm6bB-";
	//const URLPAYPAL = "https://api-m.paypal.com";
	//const SECRET = "ELCYtuxTFft8kEuAhcg8jE7_Bi31BnMd8E4DilpsnnsgXnZRUA8AKiXHwOVSPVu7xFIDZYw_6AjXulyC";

	//Datos envio de correo
	const NOMBRE_REMITENTE = "Tienda Virtual";
	const EMAIL_REMITENTE = "no-reply@abelosh.com";
	const NOMBRE_EMPESA = "Tienda Virtual";
	const WEB_EMPRESA = "www.abelosh.com";

	//Datos Empresa
	const DIRECCION = "Avenida las Américas Zona 13, Guatemala";
	const TELEMPRESA = "+(502)78787845";
	const EMAIL_EMPRESA = "info@abelosh.com";
	const EMAIL_PEDIDOS = "info@abelosh.com";

	const CAT_SLIDER = "1,2,3";
	const CAT_BANNER = "4,5,6";

	//Datos para Encriptar / Desencriptar
	const KEY = 'abelosh';
	const METHODENCRIPT = "AES-128-ECB";

	//Envío
	const COSTOENVIO = 50;

	//Módulos
	const MCLIENTES = 3;
	const MPEDIDOS = 5;

	//Roles
	const RADMINISTRADOR = 1;
	const RCLIENTES = 7;

	const STATUS = array('Completo','Aprobado','Cancelado','Reembolsado','Pendiente','Entregado');
	

?>