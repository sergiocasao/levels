
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
        

    <table align="center" id="resultados">
        <tr><td align="center"><font size="4px" > Solicitudes de Cambio</font></legend></td></tr>
        <tr><td align="center"><font size="4px" >Folio</font></legend></td><td align="center"><font size="4px" >Usuario</font></legend></td><td><font size="4px" >Titulo</legend></td></tr>
        <%

        ArrayList<Solicitud> lista= BD.obtenerTodasSolicitudes();
        for(int i=0;i<lista.size();i++){
            Solicitud obj= new Solicitud();
            obj=lista.get(i);
            String nombre= BD.obtenerNombre(obj.getIdProf());
            %>
            <form action="ConsultaUnicaSolicitudAdmin.jsp" method="post">
            <tr><td align="center"><font size="4px" ><%=obj.getId()%></font></legend></td><td align="center"><font size="4px" ><%=nombre%></font></legend></td><td><font size="4px" ><input type="submit" id="boton9" value="<%=obj.getTitulo()%>"/><input type="hidden" name="id" value="<%=obj.getId()%>"/></td></tr>
            </form>
            <%
        }
               if(lista.size()==0){%>
               <h4 align="center">No hay solicitudes de cambio registradas</h1> 
               <%}
               }
        %>
        </table>
</div>
    </body>
</html>
