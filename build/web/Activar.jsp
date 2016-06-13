<%@page import="AcademicNetwork.DropBoxArchivos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <%DropBoxArchivos obj= new DropBoxArchivos();
         String ruta=obj.Autentificar();   
            %>
        <a target='_blank' href='<%=ruta%>'>Abrir link</a>
        <a href="ValidarSesion.jsp">Validar sesion</a>

    </body>
</html>
