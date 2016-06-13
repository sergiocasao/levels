<%@page import="AcademicNetwork.DropBoxArchivos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reactivar</title>
    </head>
    <body>
        <%DropBoxArchivos obj= new DropBoxArchivos();
        obj.Reautentificar();%>
        <script>alert("Autentificado");
                location.href="ConsultaSolicitudesAdmin.jsp";</script>
    </body>
</html>
