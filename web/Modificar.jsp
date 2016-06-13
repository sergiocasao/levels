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
<style type="text/css">
<!--

.Estilo1 {font-size: 36px}
-->
</style>
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
        ArrayList<Academias> academias= new ArrayList<Academias>();
        academias=BD.obtenerAcademias();
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
        
    <div id="cuerpo2" style="padding-top: 0px; margin-top: 0px; height: 150%;">
  <div >
    <div id="info">

<form method="post" name="modificar" action="servletModificar">
  <fieldset>
      <legend><font size="4px">Informacion</font></legend>
  <table width="541" border="0" align="center" cellpadding="5" id="tablalta">
    <tr>
      <td><div align="left">Nombre:
              <p><input type="text" value="<%=nombre %>" name="nombre"/>  </p></div></td>
      
      <td><div align="left">Apellidos:
              <p> <input type="text" value="<%=apellido %>" name="apellido"/> </p></div></td>
   </tr>
    
	<tr> 
      <td><div align="left">E-mail:
              <p> <input disabled type="text" value="<%=correo %>" name="email"/> </p></div></td>
      
      <td><div align="left">G&eacute;nero:
              
              <% 
              
                if( genero.equals("Masculino")){

%>
<p> <select name="genero" style="width:155px;"/> 
                  <option VALUE="Masculino" selected>Masculino</option>
                  <option VALUE="Femenino">Femenino</option>
              
              </p>
              <% } %>
              
              <% 
              
                if( genero.equals("Femenino")){

%>
              <p> <select name="genero" style="width:155px;"/> 
                  <option VALUE="Masculino" >Masculino</option>
                  <option VALUE="Femenino" selected>Femenino</option>
              
              </p>
              <% } %>
              
        </div></td>
	</tr> 
    
	<tr>
      <td><div align="left">Fecha de nacimiento:
              <p><input type="text" value="<%=fecha %>" name="fecha"/> </p></div> </td>
      <td><div align="left">Academias:
            <%
                 
                  for(int i=0;i<academias.size();i++){
                      Academias obj2=new Academias();
                      obj2=academias.get(i);
                      boolean check=false;
                      for(int j=0;j<lista.size();j++){
                          if(lista.get(j).equals(obj2.getDescripcion())) check=true;
                        }
                      if(check){
              %>
              <p><input type="checkbox" name="academias[]" checked="true" value="<%=obj2.getId()%>"/><%=obj2.getDescripcion()%></p>
                            
                <%
                               }else{
                          %>
                          <p><input type="checkbox" name="academias[]" value="<%=obj2.getId()%>"/><%=obj2.getDescripcion()%></p>
                          
                          <%
                               }
                  }
                  
                  %>
    </td>
        </tr>
    <tr>
        <td align="center" colspan="2" ><hr style="color:#cccccc;"/></td>
    </tr>
    <tr>
        <td align="center" colspan="2"><p>Para modificar los datos debes introducir la contraseña</p>
        <p><input type="password" name="pass"</p></td>
    </tr>
    <tr>
        <td align="center" colspan="2"><a><div align="center"  id="boton2" onclick="javascript:document.modificar.submit();">Guardar</div></a></td>
    </tr>
    
  </table>
  
  </fieldset>
</form>
    <form method="post" name="eliminar" action="servletEliminar">
        <fieldset style="margin-top: 30px;">
      <legend><font size="4px">Eliminar cuenta</font></legend>
        <table width="541" border="0" align="center" cellpadding="5" id="tablalta">
            <tr>
            <td align="center" colspan="2"><p>Para dar de baja tu cuenta debes introducir la contraseÃ±a</p>
            <p><input type="password" name="pass"</p></td>
            </tr>
            <tr>
            <td align="center" colspan="2"><a><div align="center"  id="boton2" onclick="javascript:document.eliminar.submit();">Dar de Baja</div></a></td>
            </tr>
        </table>
         </fieldset>
    </form>
</div>
</div>
  </div>
<% }
               else{
            response.sendRedirect("index.jsp");
        }%>
</body>
</html>
