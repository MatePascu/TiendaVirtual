<?php 
	class Controllers{
		public function __construct(){
			$this->views = new Views();
			$this->loadModel();
		}

		public function loadModel(){
			$model = get_class($this)."Model";
			$routClass = "Models/".$model.".php";
			if(file_exists($routClass)){
				require_once($routClass);
				$this->model = new $model();
			}
		}
	}
// Todos los controladores extienden de esta clase, entonces cuando se crea la clase del controlador 
// se llama a este constructor y se carga el modelo del controlador en uso y crea un objeto con su clase 
?>