<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
   <li><a><span>Contraseña: <input  tabindex="2" onkeypress="if (event.keyCode == 13) document.iniciar.submit();" type="password" name="pass" /></span><p onclick="location.href='Recuperar.jsp'">¿Olvidaste tu contraseña?</p></a></li>
   <li><a><span>E-mail: </span><input tabindex="1" onkeypress="if (event.keyCode == 13) document.iniciar.submit();" type="text" name="email" /></a></li>
	
   

</ul>
</div>
</form>
<br />
<br />


<div align="center">
    <p>&nbsp;</p>
	<p><img src="ipn.jpg" alt="Instituto Politecnico Nacional" width="171" height="274" /></p>
    <p>&nbsp;</p>
	<p>&nbsp;</p>
</div>

<div id="logmenu">

<div id="alta">

<form method="post" name="alta" action="servletAlta">
  <fieldset>
    <legend>Registrate</legend>
  <table width="541" border="0" align="center" cellpadding="5" id="tablalta">
    <tr>
      <td><div align="right">Nombre</div></td>
      <td><input name="nombre" type="text" size="20"  /></td>
      <td><div align="right">Apellidos</div></td>
      <td><input type="text" name="apellido" size="20" /></td>
    </tr>
    
	<tr>
      <td><div align="right">E-mail</div></td>
      <td><input type="text" name="email" size="20" /></td>
      <td><div align="right">Genero</div></td>
      <td><select name="genero" style="width:155px" >
	  <option value="Masculino" selected>Masculino</option>
	  <option value="Femenino" >Femenino</option></td>
    
	</tr>
    
	<tr>
      <td><div align="right"> Contrase&ntilde;a </div> </td>
      <td><input type="password" name="pass" size="20" /> </td>
      <td><div align="right">Repetir contrase&ntilde;a</div> </td>
      <td><input type="password" name="valpass" size="20" /> </td>
   
    </tr>
    
	<tr>
      <td><div align="right">Fecha de nacimiento</div> </td>
      <td><input type="date" name="fecha" size="20" /> </td>
      <td>&nbsp; </td>
      <td><a><div align="center"  id="boton" onclick="javascript:document.alta.submit();">Registrate </div></a> </td>
   
    </tr>
  </table>
  
  </fieldset>
</form>
<div>
</div>



<% }%>
</body>
</html>
