<?php 
	require_once("Models/TCategoria.php");
	require_once("Models/TProducto.php");

	class Tienda extends Controllers{
		use TCategoria, TProducto;
		public function __construct(){
			parent::__construct();
		}

		public function tienda(){
			$data['page_tag'] = NOMBRE_EMPRESA;
			$data['page_title'] = NOMBRE_EMPRESA;
			$data['page_name'] = "tienda";
			$data['productos'] = $this->getProductosT();
			$this->views->getView($this,"tienda",$data);
		}

		public function categoria($params){
			if(empty($params)){
				header("Location:".base_url());
			}else{
				$arrParams = explode(",",$params);
				$idcategoria = intval($arrParams[0]);
				$ruta = strClean($arrParams[1]);
				$infoCategoria = $this->getProductosCategoriaT($idcategoria,$ruta);
				$categoria = strClean($params);
				$data['page_tag'] = NOMBRE_EMPRESA." - ".$infoCategoria['categoria'];
				$data['page_title'] = $infoCategoria['categoria'];
				$data['page_name'] = "categoria";
				$data['productos'] = $infoCategoria['productos'];
				$this->views->getView($this,"categoria",$data);
			}
		}

		public function producto($params){
			if(empty($params)){
				header("Location:".base_url());
			}else{
				$producto = strClean($params);
				$arrProducto = $this->getProductoT($producto);
				$data['page_tag'] = NOMBRE_EMPRESA." - ".$producto;
				$data['page_title'] = $producto;
				$data['page_name'] = "producto";
				$data['producto'] = $arrProducto;
				$data['productos'] = $this->getProductosRandom($arrProducto['categoriaid'],8,"r");
				$this->views->getView($this,"producto",$data);
			}
		}
	}
?>
