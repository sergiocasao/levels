
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@page import="java.text.SimpleDateFormat"%>
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
        function cargar(){
            $("#cssmenu").load("Barra.jsp");
                        
        }

        </script>
</head>

<body onload="cargar()">
<%HttpSession sesion= request.getSession();

int j;
j=0;
        if(session.getAttribute("Usuario")==null){
        response.sendRedirect("index.jsp");
               }else{
                String valid=(String) (sesion.getAttribute("Usuario"));
                int id= Integer.parseInt(valid);
                Conexion BD= new Conexion();
                

        %>

      <div id='cssmenu'>

</div>




  <div id="cuerpo4">
      <div style="margin-left: 60px;margin-right: 60px;margin-bottom: 30px;">
          <table>
          <tr><td align="center"><font size="4px" > Solicitud de Cambio</font></legend></td></tr>
          <form method="post" action="servletSolicitud" name="solicitud">
              <tr><td>Titulo: </td><td><input type="text" name="titulo"/></td></tr>
              <tr><td>Descripcion: </td><td><textarea name="descripcion"></textarea></td></tr>
              <input type="hidden" name="id" value="<%=id%>"/>
              <tr><td><div align="center" id="boton2" onclick="javascript:document.solicitud.submit();">Crear Solicitud</div></td></tr>
          </form>  
              </table>
</div>
</div>
            
            <%
               } %>
            
            
            
    </body>
</html>
