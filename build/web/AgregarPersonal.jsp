<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Academy | Resultados</title>
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link href="styles2.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
    function cargarBarra(){
        $("#cssmenu").load("BarraAdmin.jsp");
    }

        </script>
</head>

    <body  onload="cargarBarra()">
<%HttpSession sesion= request.getSession();
        if(session.getAttribute("Usuario")==null){
        response.sendRedirect("index.jsp");
               }else{
                String valid=(String) (sesion.getAttribute("Usuario"));
                int id= Integer.parseInt(valid);
                Conexion BD= new Conexion();
        %>
        <div id='cssmenu'>
</div>
<div id="cuerpo2">
    <form method="post" name="alta" action="servletAltaAdmin">
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
            <option value="Masculino">Masculino</option>
            <option value="Femenino" >Femenino</option></select></td>
    
	</tr>
    
	<tr>
      <td><div align="right"> Contrase&ntilde;a </div> </td>
      <td><input type="password" name="pass" size="20" /> </td>
      <td><div align="right">Repetir contrase&ntilde;a</div> </td>
      <td><input type="password" name="valpass" size="20" /> </td>
   
    </tr>
    
	<tr>
      <td><div align="right">Fecha de nacimiento</div> </td>
      <td><input type="date" name="fecha" size="20" /></td>
      <td><div align="right">Tipo de Usuario</div></td>
      <td><select name="usuario" style="width:155px" >
            <option value="3">Administrador</option>
            <option value="4">CCB</option>
            <option value="5" >QA</option></select></td>
   
    </tr>
      
      <tr>
      
      <td><a><div align="center"  id="boton" onclick="javascript:document.alta.submit();">Registrate </div></a> </td>
   
    </tr>
  </table>
  
  </fieldset>
</form>
</div>
        <%}%>
    </body>
</html>
