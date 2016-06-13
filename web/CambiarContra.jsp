<%-- 
    Document   : CambiarContra
    Created on : 9/04/2013, 11:52:39 AM
    Author     : windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar contraseña</title>
    </head>
    <body>
       <% String correo=request.getParameter("email");
          int id=Integer.parseInt(request.getParameter("id"));
          Conexion BD = new Conexion();
          int valID= BD.obtenerID(correo);
          %>
                  <form name="cambiarContra" method="post" action="servletCamContra">
                      <table>
                          
                                   
                  <tr><td>Ingrese su nueva contraseña: </td></tr>
                  <tr><td><input type="password" name="pass"></td></tr>
                  <input type="hidden" name="id" value="<%=id%>"> 
                  <tr><td>Repita su nueva contraseña: </td></tr>
                  <tr><td><input type="password" name="confpass"></td></tr>
                  <tr><td><input type="submit" value="Enviar"></td></tr>
                  </table>
                  </form>
                  

    </body>
</html>
