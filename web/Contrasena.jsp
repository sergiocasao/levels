<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import= "java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Academy | Perfil</title>
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link href="styles2.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script>
        function cargar(){
            $("#cssmenu").load("Barra.jsp");
                        
        }
        function cargarAdmin(){
            $("#cssmenu").load("BarraAdmin.jsp");
        }

        </script>
</head>


<%
        HttpSession sesion= request.getSession();
        if(session.getAttribute("Usuario")!=null){
        String valid=(String) (sesion.getAttribute("Usuario"));
        int id= Integer.parseInt(valid);
        Conexion BD = new Conexion();
        Profesor obj= new Profesor();
        obj=BD.obtenerDatos(id);
        String nombre =obj.getNombre();
        String apellido =obj.getApellido();
        String genero =obj.getGenero();
        String fecha =obj.getFecha();
        String correo =obj.getCorreo();
        ArrayList<String> lista= new ArrayList<String>();
        lista=obj.getAcademias();
        if(BD.obtenerEstado(id)!=1){
        %>
<body onload="cargarAdmin()">    
       


    <%
        }else{
    %>
<body onload="cargar()">    

    <%         
        }
    %>

<div id='cssmenu'>

</div>

               
               <div id="cuerpo3" style="padding-top: 5%; height: 90.6%;">
  <div >
    <div id="info">

<form method="post" name="contra" action="servletContra" >
  <fieldset>
      <legend><font size="4px">Modificar contraseña</font></legend>
  <table width="541" border="0" align="center" cellpadding="5" id="tablalta">
        
      <tr>
          
          <td align="center" colspan="2"><p>Contraseña anterior</p>
        <p><input type="password" name="pass"</p></td>
          
      </tr>
      
      <tr>
        <td align="center" colspan="2" ><hr style="color:#cccccc;"/></td>
    </tr>
    <tr>
        <td align="center" colspan="2"><p>Nueva contraseña</p>
        <p><input type="password" name="newpass"</p></td>
    </tr>
     <tr>
        <td align="center" colspan="2"><p>Confirma la nueva contraseña</p>
        <p><input type="password" name="confpass"</p></td>
    </tr>
    <tr>
        <td align="center" colspan="2"><a><div align="center"  id="boton2" onclick="javascript:document.contra.submit();">Guardar</div></a></td>
    </tr>
    
  </table>
  
  </fieldset>
</form>
</div>
</div>


<% }
               else{
            response.sendRedirect("index.jsp");
        }%>
</body>
</html>