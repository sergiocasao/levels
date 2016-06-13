<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activar cuenta</title>
    </head>
    <body>
       <% String correo=request.getParameter("email");
          int id=Integer.parseInt(request.getParameter("id"));
          Conexion BD = new Conexion();
          int valID= BD.obtenerID(correo);
          
          if(valID==id){
              int valEstado=BD.obtenerEstado(id);
              if(valEstado==2){
                  %>
                  <form name="activarCuenta" method="post" action="servletActivar">
                      <table>
                          <tr><td>Eliga las academias a las que pertenece:</td></tr>
                  <%
                  ArrayList<Academias> lista= new ArrayList<Academias>();
                  lista=BD.obtenerAcademias();
                  for(int i=0;i<lista.size();i++){
                      Academias obj= new Academias();
                      obj= lista.get(i);
                      %>
                      <tr>
                          <td>
                      <input type="checkbox" name="academias[]" value="<%=obj.getId()%>"><%=obj.getDescripcion()%>
                          </td>
                      </tr>
                      <%
                  }
                  
                  %>
                  
                  <tr><td>Ingrese su contraseña: </td><td><input type="password" name="pass"></td></tr>
                  <input type="hidden" name="id" value="<%=id%>"> 
                  <tr><td></td><td><input type="submit" value="Enviar"></td></tr>
                  </table>
                  </form>
                  <%
              }else{
                  %>
                  <script>
                      alert("Este link caducó");
                      location.href="index.jsp";
                  </script>
                  <%
              }
           %>
           
           
           
           <%
              
          }else{
              %>
              <script>
                      alert("Link incorrecto");
                      location.href="index.jsp";
                  </script>
                  
              <%
              
          }
              
              %>

    </body>
</html>

