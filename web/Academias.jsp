
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Resultados</title>
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link href="styles2.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script>
        function cargar(){
            $("#cssmenu").load("BarraAdmin.jsp");
                        
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
        %>

       <div id='cssmenu'>

  
</div>




<div id="cuerpo2">
        Registrar Academia
        <form action="registroAcademia" name="registro" method="post">
            <input type="text" name="nombre"/>
            <input type="submit" value="Registra"/>
            </form>  
    <table align="center" id="resultados">
           
        <%
        
        ArrayList<Academias> lista= BD.obtenerAcademias();
        for(int i=0;i<lista.size();i++){
            Academias obj= new Academias();
            obj=lista.get(i);
            %>
            <tr><td><%=obj.getDescripcion()%></td></tr>
            <%
        }
               if(lista.size()==0){
       %>
               <table align="center">
                   <tr align="center"><td><img src="emoticon-27-128.png"/></td></tr>
                   <tr align="center"><td><h4 align="center">No se encontraron </h4></td></tr>
               
               </table>
               <%
               }
               }
        %>
        </table>
</div>
    </body>
</html>
