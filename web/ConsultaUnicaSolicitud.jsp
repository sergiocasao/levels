
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
        function cargar(){
            $("#cssmenu").load("Barra.jsp");
                        
        }

        </script>
</head>

<body onload="cargar()">
<%HttpSession sesion= request.getSession();
        if(session.getAttribute("Usuario")==null){
        response.sendRedirect("index.jsp");
               }else{
                String valid=(String) (sesion.getAttribute("Usuario"));
                int id= Integer.parseInt(valid);
                Conexion BD= new Conexion();
                int idSol=Integer.parseInt(request.getParameter("id"));
        %>

       <div id='cssmenu'>

</div>




<div id="cuerpo2">
        

    <table align="center" id="resultados">
        <tr><td align="center"><font size="4px" > Solicitud de Cambio</font></legend></td></tr>
        <%String buscar=request.getParameter("buscador");

        
            Solicitud obj= BD.obtenerUnicaSolicitud(idSol);
            
            %>
            
            
            <tr><td align="center"><font size="4px" >Folio: <%=obj.getId()%></font></legend></td></tr>
            <tr><td><font size="4px" >Titulo: <%=obj.getTitulo()%></td></tr>
            <tr><td><font size="4px" >Descripcion: <%=obj.getDescripcion()%></td></tr>
            <tr><td><font size="4px" >Fecha: <%=obj.getFecha()%></td></tr>
            <tr><td><font size="4px" >Hora: <%=obj.getHora()%></td></tr>
            <tr><td><font size="4px" >Status: <%=obj.getStatus()%></td></tr>
            
                

            <%
                         
               }
        %>
        </table>
</div>
    </body>
</html>
