<?php 

	//define("BASE_URL", "http://localhost/tienda_virtual/"); Otra manera de definir variable
	const BASE_URL = "http://localhost/tienda_virtual";

	//Zona horaria
	date_default_timezone_set('America/Guatemala');

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	const DB_NAME = "db_tiendavirtual";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB_CHARSET = "utf8";

	//Deliminadores decimal y millar Ej. 24.1989,00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "$";

	//Datos envio correo
	const NOMBRE_REMITENTE = "Tienda Virtual";
	const EMAIL_REMITENTE = "matepascucci2000@gmail.com";
	const NOMBRE_EMPRESA = "Tienda Virtual";
	const WEB_EMPRESA = "https://portfolio-mp.netlify.app";

	const CAT_SLIDER = "1,2,3"; // Categorias a mostrar en slider principal
	const CAT_BANNER = "1,2,3"; // Categorias a mostrar en banner secundario
?>