<%@page import="org.omg.CORBA.BAD_CONTEXT"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
    <% 
          HttpSession sesion= request.getSession();
        if(sesion.getAttribute("Usuario")!=null){
        String valid=(String) (sesion.getAttribute("Usuario"));
        int id= Integer.parseInt(valid);
        Conexion BD = new Conexion();
        if(BD.obtenerEstado(id)>2){
        %>
        
<ul>
   
   
   
   <li><a><span></span></a></li>
   <li class='has-sub '><a title="Ayuda"><span>Ayuda</span></a>
   <ul>
            <li><a href='ConsultaSolicitudesAdmin.jsp'><span>Consultar solicitudes</span></a></li>
            <li><a href='ConsultaSolicitudesEspecificasAdmin.jsp'><span>Consultar pendientes</span></a></li>
     </ul>
   </li>
   <li class='has-sub '><a title="Dropbox"><span>Dropbox</span></a>
   <ul>
            <li><a href='Activar.jsp'><span>Activacion</span></a></li>
            <li><a href='Reactivar.jsp'><span>Reactivacion</span></a></li>
     </ul>
   </li>
   <%
    if(BD.obtenerEstado(id)==3){
%>
   <li class='has-sub '><a title="Personal"><span>Personal</span></a>
   <ul>
            <li><a href='AgregarPersonal.jsp'><span>Registrar Personal</span></a></li>
            <li><a href='ConsultaPersonal.jsp?id=3'><span>Consultar Administrador</span></a></li>
            <li><a href='ConsultaPersonal.jsp?id=4'><span>Consultar CCB</span></a></li>
            <li><a href='ConsultaPersonal.jsp?id=5'><span>Consultar QA</span></a></li>
     </ul>
   </li>
   <li class='has-sub '><a href='Academias.jsp' title="Academias"><span>Academias</span></a>
   <ul>
     </ul>
   </li>
   <%
  }
%>
   <li class='has-sub '><a title="Configuracion"><span>&nbsp;<img src="gear-9-24.png"></span></a>
	<ul>
            <li><a href='Modificar.jsp' ><span>Editar datos</span></a></li>
            <li><a href='Contrasena.jsp'><span>Cambiar contraseña</span></a></li>
         <li><a href='cerrarSesion.jsp'><span>Cerrar sesion</span></a></li>
     </ul> </li> 

         <%
                Profesor objDatos= new Profesor();
                objDatos=BD.obtenerDatos(id);
                String nombrePerfil =objDatos.getNombre()+" "+objDatos.getApellido();
            %>
	 <li class="has-sub"><a href="irPerfilAdmin.jsp?id=<%=id%>"><span><font face="Segoe Ui Semibold"><%=nombrePerfil%></font></span></a></li>
</ul>
         
<%
        BD.cerrarConexion();
        }else{
            if(BD.obtenerEstado(id)==1){
                %>
                <script>location.href="perfil.jsp";</script>
                <%
            }
        }
                 }
          else{}%>
    </body>
</html>
