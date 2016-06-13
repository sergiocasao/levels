
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
                int idSol=Integer.parseInt(request.getParameter("id"));
        %>

<div id='cssmenu'>

</div>

<div id="cuerpo2">
    <%
        if(BD.obtenerEstado(id)==3){
    %>
    <table align="center" id="resultados">
        <tr><td align="center"><font size="4px" > Solicitud de Cambio</font></legend></td></tr>
        <%
          Solicitud obj=BD.obtenerUnicaSolicitud(idSol);
        String nombre= BD.obtenerNombre(obj.getIdProf());
            %>
            <tr><td align="center"><font size="4px" >Folio: <%=obj.getId()%></font></legend></td></tr>
            <tr><td><font size="4px" >Titulo: <%=obj.getTitulo()%></td></tr>
            <tr><td><font size="4px" >Descripcion: <%=obj.getDescripcion()%></td></tr>
            <tr><td><font size="4px" >Fecha: <%=obj.getFecha()%></td></tr>
            <tr><td><font size="4px" >Hora: <%=obj.getHora()%></td></tr>
            <tr><td><font size="4px" >Usuario: <%=nombre%></td></tr>
            <tr><td><font size="4px" >Status: <%=obj.getStatus()%></td></tr>
            <%
            if(obj.getIdProfSegAdmin()!=0){
            %>                
            <% System.out.println(obj.getIdProfSegAdmin());
            String nombreAdmin=BD.obtenerNombre(obj.getIdProfSegAdmin()); %>
            <tr><td><font size="4px" >Administrador: <%=nombreAdmin%></td></tr>
            <tr><td><font size="4px" >Descripcion Admin: <%=obj.getSegAdmin()%></td></tr>
            <%
            }
            if(obj.getIdProfSegCCB()!=0){
            %>                
            <% String nombreCCB=BD.obtenerNombre(obj.getIdProfSegCCB()); %>
            <tr><td><font size="4px" >CCB: <%=nombreCCB%></td></tr>
            <tr><td><font size="4px" >Descripcion CCB: <%=obj.getSegCCB()%></td></tr>
            <%
            }
            if(obj.getIdProfSegQA()!=0){
            %>                
            <% String nombreQA=BD.obtenerNombre(obj.getIdProfSegQA()); %>
            <tr><td><font size="4px" >QA: <%=nombreQA%></td></tr>
            <tr><td><font size="4px" >Descripcion QA: <%=obj.getSegQA()%></td></tr>
            <%
            }
        %>
        </table>
        <%
            if(obj.getIdProfSegAdmin()==0){
            %>
        <hr style="width: 60%; color: #A3a3a3; margin-top: 50px; margin-bottom: 50px;"/>
        <table align="center">
            <tr><td align="center" colspan="2" ><font size="4px" > Seguimiento de Solicitud Administrador</font></legend></td></tr>
            <tr><td colspan="2"></td></tr>
            <form method="post" action="seguimiento" name="seguimiento">
              <tr><td>Descripcion: </td><td><textarea name="descripcion" style="resize: none; width: 400px ; height: 100px; "></textarea></td></tr>
              <input type="hidden" name="id" value="<%=id%>"/>
              <input type="hidden" name="idSol" value="<%=idSol%>"/>
              <tr><td><div align="center" id="boton2" onclick="javascript:document.seguimiento.submit();">Aceptar Seguimiento</div></td></tr>
          </form>  
          <form method="post" action="rechazar" name="rechazar">
              <input type="hidden" name="idSol" value="<%=idSol%>"/>
              <tr><td><div align="center" id="boton2" onclick="javascript:document.rechazar.submit();">Rechazar Solicitud</div></td></tr>
          </form>      
              </table>
            <%}
                   }
        if(BD.obtenerEstado(id)==4){
    %>
    <table align="center" id="resultados">
        <tr><td align="center"><font size="4px" > Solicitud de Cambio</font></legend></td></tr>
        <%
          Solicitud obj=BD.obtenerUnicaSolicitud(idSol);
        String nombre= BD.obtenerNombre(obj.getIdProf());
            %>
            <tr><td align="center"><font size="4px" >Folio: <%=obj.getId()%></font></legend></td></tr>
            <tr><td><font size="4px" >Titulo: <%=obj.getTitulo()%></td></tr>
            <tr><td><font size="4px" >Descripcion: <%=obj.getDescripcion()%></td></tr>
            <tr><td><font size="4px" >Fecha: <%=obj.getFecha()%></td></tr>
            <tr><td><font size="4px" >Hora: <%=obj.getHora()%></td></tr>
            <tr><td><font size="4px" >Usuario: <%=nombre%></td></tr>
            <tr><td><font size="4px" >Status: <%=obj.getStatus()%></td></tr>
            <%
            if(obj.getIdProfSegAdmin()!=0){
            %>                
            <% System.out.println(obj.getIdProfSegAdmin());
            String nombreAdmin=BD.obtenerNombre(obj.getIdProfSegAdmin()); %>
            <tr><td><font size="4px" >Administrador: <%=nombreAdmin%></td></tr>
            <tr><td><font size="4px" >Descripcion Admin: <%=obj.getSegAdmin()%></td></tr>
            <%
            }
            if(obj.getIdProfSegCCB()!=0){
            %>                
            <% String nombreCCB=BD.obtenerNombre(obj.getIdProfSegCCB()); %>
            <tr><td><font size="4px" >CCB: <%=nombreCCB%></td></tr>
            <tr><td><font size="4px" >Descripcion CCB: <%=obj.getSegCCB()%></td></tr>
            <%
            }
            if(obj.getIdProfSegQA()!=0){
            %>                
            <% String nombreQA=BD.obtenerNombre(obj.getIdProfSegQA()); %>
            <tr><td><font size="4px" >QA: <%=nombreQA%></td></tr>
            <tr><td><font size="4px" >Descripcion QA: <%=obj.getSegQA()%></td></tr>
            <%
            }
        %>
        </table>
        <%
                if(obj.getIdProfSegAdmin()!=0 && obj.getIdProfSegCCB()==0){
            %>
        <hr style="width: 60%; color: #A3a3a3; margin-top: 50px; margin-bottom: 50px;"/>
        <table align="center">
          <tr><td align="center" colspan="2" ><font size="4px" > Seguimiento de Solicitud CCB</font></legend></td></tr>
            <tr><td colspan="2"></td></tr>
          <form method="post" action="seguimiento" name="seguimiento">
              <tr><td>Descripcion: </td><td><textarea name="descripcion" style="resize: none; width: 400px ; height: 100px; "></textarea></td></tr>
              <input type="hidden" name="id" value="<%=id%>"/>
              <input type="hidden" name="idSol" value="<%=idSol%>"/>
              <tr><td><div align="center" id="boton2" onclick="javascript:document.seguimiento.submit();">Aceptar Seguimiento</div></td></tr>
          </form>  
          <form method="post" action="rechazar" name="rechazar">
              <input type="hidden" name="idSol" value="<%=idSol%>"/>
              <tr><td><div align="center" id="boton2" onclick="javascript:document.rechazar.submit();">Rechazar Solicitud</div></td></tr>
          </form>      
              </table>
            <%}
                   }
        if(BD.obtenerEstado(id)==5){
    %>
    <table align="center" id="resultados">
        <tr><td align="center"><font size="4px" > Solicitud de Cambio</font></legend></td></tr>
        <%
          Solicitud obj=BD.obtenerUnicaSolicitud(idSol);
        String nombre= BD.obtenerNombre(obj.getIdProf());
            %>
            <tr><td align="center"><font size="4px" >Folio: <%=obj.getId()%></font></legend></td></tr>
            <tr><td><font size="4px" >Titulo: <%=obj.getTitulo()%></td></tr>
            <tr><td><font size="4px" >Descripcion: <%=obj.getDescripcion()%></td></tr>
            <tr><td><font size="4px" >Fecha: <%=obj.getFecha()%></td></tr>
            <tr><td><font size="4px" >Hora: <%=obj.getHora()%></td></tr>
            <tr><td><font size="4px" >Usuario: <%=nombre%></td></tr>
            <tr><td><font size="4px" >Status: <%=obj.getStatus()%></td></tr>
            <%
            if(obj.getIdProfSegAdmin()!=0){
            %>                
            <% System.out.println(obj.getIdProfSegAdmin());
            String nombreAdmin=BD.obtenerNombre(obj.getIdProfSegAdmin()); %>
            <tr><td><font size="4px" >Administrador: <%=nombreAdmin%></td></tr>
            <tr><td><font size="4px" >Descripcion Admin: <%=obj.getSegAdmin()%></td></tr>
            <%
            }
            if(obj.getIdProfSegCCB()!=0){
            %>                
            <% String nombreCCB=BD.obtenerNombre(obj.getIdProfSegCCB()); %>
            <tr><td><font size="4px" >CCB: <%=nombreCCB%></td></tr>
            <tr><td><font size="4px" >Descripcion CCB: <%=obj.getSegCCB()%></td></tr>
            <%
            }
            if(obj.getIdProfSegQA()!=0){
            %>                
            <% String nombreQA=BD.obtenerNombre(obj.getIdProfSegQA()); %>
            <tr><td><font size="4px" >QA: <%=nombreQA%></td></tr>
            <tr><td><font size="4px" >Descripcion QA: <%=obj.getSegQA()%></td></tr>
            <%
            }
        %>
        </table>
        <%
                if(obj.getIdProfSegAdmin()!=0 && obj.getIdProfSegCCB()!=0 && obj.getIdProfSegQA()==0){
            %>
        <hr style="width: 60%; color: #A3a3a3; margin-top: 50px; margin-bottom: 50px;"/>
        <table align="center">
          <tr><td align="center" colspan="2" ><font size="4px" > Seguimiento de Solicitud QA</font></legend></td></tr>
            <tr><td colspan="2"></td></tr>
          <form method="post" action="seguimiento" name="seguimiento">
              <tr><td>Descripcion: </td><td><textarea name="descripcion" style="resize: none; width: 400px ; height: 100px; "></textarea></td></tr>
              <input type="hidden" name="id" value="<%=id%>"/>
              <input type="hidden" name="idSol" value="<%=idSol%>"/>
              <tr><td><div align="center" id="boton2" onclick="javascript:document.seguimiento.submit();">Aceptar Seguimiento</div></td></tr>
          </form>  
          <form method="post" action="rechazar" name="rechazar">
              <input type="hidden" name="idSol" value="<%=idSol%>"/>
              <tr><td><div align="center" id="boton2" onclick="javascript:document.rechazar.submit();">Rechazar Solicitud</div></td></tr>
          </form>      
              </table>
            <%}
                   }
            %>        
</div>
              <% } %>
    </body>
</html>
