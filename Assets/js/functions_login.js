$('.login-content [data-toggle="flip"]').click(function() {
  $('.login-box').toggleClass('flipped');
  return false;
});

document.addEventListener('DOMContentLoaded', function(){
  if(document.querySelector('#formLogin')){
    let formLogin = document.querySelector('#formLogin')
    formLogin.onsubmit = function(e){
      e.preventDefault()
      let strEmail = document.querySelector('#txtEmail').value
      let strPassword = document.querySelector('#txtPassword').value
      if(strEmail == '' || strPassword == ''){
        swal('Por favor', 'Escribe tu usuario y contraseña', 'error')
        return false
      }else{
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
        var ajaxUrl = base_url+'/Login/loginUser'
        var formData = new FormData(formLogin)
        request.open("POST", ajaxUrl, true)
        request.send(formData)
        request.onreadystatechange = function(){
          if(request.readyState != 4) return false
          if(request.status == 200){
            var objData = JSON.parse(request.responseText)
            if(objData.status){
              window.location = base_url+'/dashboard' // window.location redirecciona a la url especificada
            }else{
              swal("Atencion", objData.msg, "error")
              document.querySelector('txtPassword').value = ''
            }
          }else{
            swal("Atencion", "Error en el proceso", "error")
          }
          return false
        }
      }
    }
  }
  if(document.querySelector('#formResetPass')){
    let formResetPass = document.querySelector('#formResetPass')
    formResetPass.onsubmit = function(e){
      e.preventDefault()
      let strEmail = document.querySelector('#txtEmailReset').value
      if(strEmail == ''){
        swal('Por favor', 'Escribe tu correo electrónico.', 'error')
        return false
      }else{
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
        var ajaxUrl = base_url+'/Login/resetPass'
        var formData = new FormData(formResetPass)
        request.open('POST', ajaxUrl, true)
        request.send(formData)
        request.onreadystatechange = function(){
          if(request.readyState != 4) return;
          if(request.status == 200){
            var objData = JSON.parse(request.responseText)
            if(objData.status){
              swal({
                title: '',
                text: objData.msg,
                type: 'success',
                confirmButtonText: 'Aceptar',
                closeOnConfirm: false,
              }, function(isConfirm){
                if(isConfirm){
                  window.location = base_url;
                }
              })
            }else{
              swal('Atención', objData.msg, 'error')
            }
          }else{
            swal('Atención', 'Error en el proceso', 'error')
          }
          return false
        }
      }
    }
  }
  if(document.querySelector('#formCambiarPass')){
    let formCambiarPass = document.querySelector('#formCambiarPass')
    formCambiarPass.onsubmit = function(e){
      e.preventDefault()
      let strPassword = document.querySelector('#txtPassword').value
      let strPasswordConfirm = document.querySelector('#txtPasswordConfirm').value
      let idUsuario = document.querySelector('#idUsuario').value
      if(strPassword == '' || strPasswordConfirm == ''){
        swal('Por favor', 'Escribe la nueva contraseña', 'error');
        return false;
      }else{
        if(strPassword.length < 5){
          swal('Atencion', 'La contraseña debe tener un minimo de 5 caracteres', 'info');
          return false;
        }
        if(strPassword != strPasswordConfirm){
          swal('Atencion', 'Las contraseñas no son iguales', 'error');
          return false;
        }
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP')
        var ajaxUrl = base_url+'/Login/setPassword'
        var formData = new FormData(formCambiarPass)
        request.open('POST', ajaxUrl, true)
        request.send(formData)
        request.onreadystatechange = function(){
          if(request.readyState != 4) return false
          if(request.status == 200){
            console.log(request.responseText)
          }
        }
      }
    }
  }
}, false)

/* http://localhost/tienda_virtual/login/confirmUser/mateo@gmail.com/
d5acc88f4e557c83cda5-d6fb3e0704927a58fa18-2b5332bce5a90d8de322-e72070813231a632b
*/