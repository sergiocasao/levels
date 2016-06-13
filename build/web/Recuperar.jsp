<%-- 
    Document   : Recuperar
    Created on : 9/04/2013, 10:33:43 AM
    Author     : windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="styles.css" rel="stylesheet" type="text/css">
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<title>Academy | Inicio</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style></head>

<body>
    <%
        HttpSession sesion= request.getSession();
        if(session.getAttribute("Usuario")!=null){
        String valid=(String) (sesion.getAttribute("Usuario"));
        int id= Integer.parseInt(valid);
        response.sendRedirect("inicio.jsp");
        }
               else{
    %>
<form method="post" name="iniciar" action="iniciarSesion">
<div id='cssmenu'>
<ul>
   
   
   
   <li><a><span></span></a></li>
   <li class='has-sub '><a title="Ayuda"><span><img src="help-8-16.gif" alt="Ayuda"></span></a></li> 
   <li onclick="javascript:document.iniciar.submit();"><i><span> Entrar </span></i></li>
   <li><a><span>Contraseña: <input  tabindex="2" onkeypress="if (event.keyCode == 13) document.iniciar.submit();" type="password" name="pass" /></span></a><p><a>¿Olvidaste tu contraseña?</a></p></li>
   <li><a><span>E-mail: </span><input tabindex="1" onkeypress="if (event.keyCode == 13) document.iniciar.submit();" type="text" name="email" /></a></li>
	
   

</ul>
</div>
</form>

<div id="info">
    
<div>





<form method="post" name="contra" action="servletRecupera" >
  
  <table width="541" border="0" align="center" cellpadding="5" id="tablalta">
        
       <tr>
        <td align="center" colspan="2" >...Aqui va una imagen...</td>
    </tr>
      <tr>
        <td align="center" colspan="2" ><hr style="color:#cccccc;"/></td>
    </tr>
    <tr>
        <td align="center" colspan="2"><p>Ingresa tu e-mail</p>
        <p><input type="text" name="email"</p></td>
    </tr>
     <tr>
        <td align="center" colspan="2"><p>Ingresa tu fecha de nacimiento</p>
        <p><input type="date" name="fecha"</p></td>
    </tr>
      
    <tr>
        <td align="center" colspan="2"><a><div align="center"  id="boton2" onclick="javascript:document.contra.submit();">Enviar</div></a></td>
    </tr>
    
  </table>
  

</form>
</div>
</div>




<% }%>
</body>
</html>
