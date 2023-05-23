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
          console.log(request)
        }
      }
    }
  }
}, false)