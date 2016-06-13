<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Academy | Inicio</title>
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
<%
        HttpSession sesion= request.getSession();
        if(sesion.getAttribute("Usuario")!=null){
        String valid=(String) (sesion.getAttribute("Usuario"));
        int id= Integer.parseInt(valid);
        Conexion BD= new Conexion();
        ArrayList<Profesor> lista= BD.obtenerFavoritos(id);
        %>
     
<div id='cssmenu'>

</div>






<div id="cuerpo2">
<div id="favorito">
  <fieldset style="width:650px;">
    <legend><font size="4px">Favoritos</font></legend>
  <table width="397" border="0" align="center" cellpadding="5" id="tablalta" style="margin-bottom:25px;" >
   <%for(int i=0;i<lista.size();i++){
       Profesor obj= new Profesor();
       obj=lista.get(i);
   %>
   
   <tr>
       <form action="eliminarFavorito" name="favorito" method="post">
           <td  style="padding-top: 14px;"width="24" align="right" valign="middle"><input type="hidden" name="id" value="<%=obj.getId()%>"/><input type="image" src="x-mark-3-24.png" width="16"  heigth="16" name="eliminar" /></td>
            
      </form>
      <form action="irPerfil.jsp" name="buscar" method="post">
          <td valign="middle" align="left"><input id="boton4" type="submit" value="<%=obj.getNombre()+ " "+obj.getApellido()%>"/></td>
            <input type="hidden" name="id" value="<%=obj.getId()%>"/>
            </form>  
      <td width="151" align="right" valign="middle">
	  
	  <div id="boton6">
	  <div style="cursor:pointer">
		  <table border="0">
                      <tr>
                          <form action="Mensajes.jsp" method="post">
                
                <input type="hidden" name="id" value="<%=obj.getId()%>"/>
            
              <td  align="right"><input type="submit"  id="boton2" value="Enviar mensaje"/> </td>
              <td  align="right"><input type="image" src="letter-5-16.png" /></td>
              </form>
            </tr>
          </table>
	 </div>
	 </div>  
	  </td>
      
      
	 
    </tr>
      
<%}%>
    
	
  </table>
  
  </fieldset>
  </div>
 



</div>
<%}else{
            response.sendRedirect("index.jsp");
}%>
</body>
</html>

