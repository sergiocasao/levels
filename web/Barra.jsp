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
        if(BD.obtenerEstado(id)==1){
        %>
        

    <ul>
   
   
   
   <li><a><span></span></a></li>
   <li class='has-sub '><a title="Ayuda"><span>Ayuda</span></a>
   <ul>
            <li><a href='SolicitudCambio.jsp' ><span>Crear solicitud de cambio</span></a></li>
            <li><a href='ConsultaSolicitudes.jsp'><span>Consultar solicitudes</span></a></li>
     </ul>
   </li>
   <li class='has-sub '><a title="Configuracion"><span>&nbsp;<img src="gear-9-24.png"></span></a>
	<ul>
            <li><a href='Modificar.jsp' ><span>Editar datos</span></a></li>
            <li><a href='Contrasena.jsp'><span>Cambiar contraseña</span></a></li>
         <li><a href='cerrarSesion.jsp'><span>Cerrar sesion</span></a></li>
     </ul> </li> 
	
   
   <li><form name="buscador" action="busqueda.jsp" method="post"> <a><span>&nbsp;</span><input type="text" onkeypress="mandarFormulario()" name="buscador" /></a><i onclick="javascript:document.buscador.submit();"><span> Buscar </span></i>
       </form></li>
        
   
   <li class='has-sub '><a><span>Grupos &nbsp;&nbsp;<img src="user-14-24.png" ></span></a>
	<ul>
            <% ArrayList<Academias> listaAcademias= BD.obtenerAcademias();
               for(int i=0;i<listaAcademias.size();i++){
                   Academias obj2= new Academias();
                   obj2=listaAcademias.get(i);
 %>
         <li><a onclick="location.href='Grupo.jsp?id=<%=obj2.getId()%>'"><span><%=obj2.getDescripcion()%></span></a></li>
                 <%}%>
        </ul> </li>
  
        <li class='has-sub '><a onclick="location.href='Favoritos.jsp'" ><span>Favoritos&nbsp;&nbsp;<img src="star-24.png" ></span></a></li> 
	 
   <li class='has-sub2'><a><span>Notificaciones &nbsp;&nbsp;<img src="book-15-24.png" ></span></a>
       
       <ul>
            <%
       ArrayList<Notificacion> listaNot= BD.obtenerNotificacion(id);
       
       boolean hay;
       hay=false;
       if(listaNot.size()<3)
       {
               for(int i=0;i<listaNot.size();i++){
           hay=false;
           
           Notificacion objNot= new Notificacion();
           objNot=listaNot.get(i);
           
String fec=objNot.getFec();
String hora=objNot.getHora();
String text="";
if(objNot.isComPub()){
    text="comentó en";
}else text="publicó en";
            %>
            <li><a href='Publicacion.jsp?id=<%=objNot.getId()%>'><span>
                     
                     <table border="0" width="100%">
                         <tr>
                             <td align="left">
                                <%
                            if(objNot.getNombre().equals("Usuario de Academic Network ")){
                                %>
                                    <input type="hidden" name="id" value="<%=objNot.getIdProf()%>"/><input class="boton12" type="submit"  align="left" value="<%=objNot.getNombre()%>"/><font style="font-family: Segoe UI Light;font-size: 12px;"> <%=text%> </font><input type="button" align="left" class="boton12" onClick="location.href='Publicacion.jsp?id=<%=objNot.getId()%>'" value="<%=objNot.getAcademia()%>"/>
                                <% 
                                    }else{
                                %>
                                 <form action="irPerfil.jsp" name="buscar" method="post">
                                     <input type="hidden" name="id" value="<%=objNot.getIdProf()%>"/><input class="boton12" type="submit"  align="left" value="<%=objNot.getNombre()%>"/><font style="font-family: Segoe UI Light;font-size: 12px;"> <%=text%> </font><input type="button" align="left" class="boton12" onClick="location.href='Publicacion.jsp?id=<%=objNot.getId()%>'" value="<%=objNot.getAcademia()%>"/>
                         
                                 </form>  
                            <%
                                }
                            %>
                     </td>
                         </tr>
                                     <tr><td></td></tr>
                     <tr>
                         <td align="right">
                             <input class="boton13" type="button"  value="<%=objNot.getDiferencia()%>" title="<%=objNot.getDiaSem()+", "+fec.substring(0,2) +" de "+objNot.getMes()+" de "+fec.substring(6,10)+" a la(s) "+hora.substring(0,5)%>"/>
                         </td>
                         
        
                     </tr>
                         
                 
                     </table>
                 
                 </span></a></li>
         
         <%
        
               }   
       
       }   
              else{   
           
       for(int i=0;i<3;i++){
           hay=false;
           Notificacion objNot= new Notificacion();
objNot=listaNot.get(i);
           
String fec=objNot.getFec();
String hora=objNot.getHora();
String text="";
if(objNot.isComPub()){
    text="comentó en";
}else text="publicó en";
            %>
            <li><a href='Publicacion.jsp?id=<%=objNot.getId()%>'><span>
                     
                     <table border="0" width="100%">
                         <tr>
                             <td align="left">
                                 <%
                            if(objNot.getNombre().equals("Usuario de Academic Network ")){
                                %>
                                    <input type="hidden" name="id" value="<%=objNot.getIdProf()%>"/><input class="boton12" type="submit"  align="left" value="<%=objNot.getNombre()%>"/><font style="font-family: Segoe UI Light;font-size: 12px;"> <%=text%> </font><input type="button" align="left" class="boton12" onClick="location.href='Publicacion.jsp?id=<%=objNot.getId()%>'" value="<%=objNot.getAcademia()%>"/>
                                <% 
                                    }else{
                                %>
                                 <form action="irPerfil.jsp" name="buscar" method="post">
                                     <input type="hidden" name="id" value="<%=objNot.getIdProf()%>"/><input class="boton12" type="submit"  align="left" value="<%=objNot.getNombre()%>"/><font style="font-family: Segoe UI Light;font-size: 12px;"> <%=text%> </font><input type="button" align="left" class="boton12" onClick="location.href='Publicacion.jsp?id=<%=objNot.getId()%>'" value="<%=objNot.getAcademia()%>"/>
                                 </form>  
                            <%
                                }
                            %>
                         
                     </td>
                         </tr>
                                     <tr><td></td></tr>
                     <tr>
                         <td align="right">
                             <input class="boton13" type="button"  value="<%=objNot.getDiferencia()%>" title="<%=objNot.getDiaSem()+", "+fec.substring(0,2) +" de "+objNot.getMes()+" de "+fec.substring(6,10)+" a la(s) "+hora.substring(0,5)%>"/>
                         </td>
                         
        
                     </tr>
                         
                 
                     </table>
                 
                 </span></a></li>
                 
                 
         <%
        }}
       
               %>
               <li><a href='Notificaciones.jsp' ><span><input class="boton12" style="font-family: Segoe ui semibold;"value="Ver todas" align="center" disabled="disabled" /></span></a></li>
        </ul> </li>
               
               <li class='has-sub2'><a><span>Mensajes&nbsp;&nbsp;<img src="email-24.png" ></span></a>
                   <ul>
                   <%ArrayList<Integer> listaConversacion = BD.obtenerConversacion(id);
                   int num=0;
                   if(listaConversacion.size()>3){
                       num=3;
                   }else{
                       num=listaConversacion.size();
                   }
              for(int i=0;i<num;i++){  
              ArrayList<Mensaje> listaUltimoMensaje= new ArrayList<Mensaje>();
              listaUltimoMensaje=BD.obtenerUltimosMensajes(id,listaConversacion.get(i));
              int sinLeer=0;
              for(int k=0;k<listaUltimoMensaje.size();k++){
                  Mensaje obj=new Mensaje();
                  obj=listaUltimoMensaje.get(k);
                  if(obj.getDes()==id && obj.getEstado().equals("NO")){
                      
                      sinLeer++;
                  }
                }
              Mensaje ultimo= new Mensaje();
              ultimo=listaUltimoMensaje.get(listaUltimoMensaje.size()-1);
%>
<li>
            <form action="Mensajes.jsp" method="post">
                <table width="100%" height="80" border="0" cellspacing="5" class="notmensaje">
        <tr>
            <td valign="middle"><font color="#410606" face="Segoe ui semibold"><input type="submit" class="boton12" value="<%=BD.obtenerNombre(listaConversacion.get(i))+" ("+sinLeer+")"%>"/></font></td>
        </tr
        <tr>
            <td valign="top"><font size="2"><%=ultimo.getDescripcion()%></font></td>
        </tr>
      </table>
        <input type="hidden" name="id" value="<%=listaConversacion.get(i)%>"/>
            </form>
	</li>
	<%}%>
               <li><a href='Mensajes.jsp' ><span><input class="boton12" style="font-family: Segoe ui semibold;" value="Ver todas" align="center" disabled="disabled" /></span></a></li>
                   </ul>
        </li>
   
	 
	 <li class="has-sub"><a href='inicio.jsp'><span> Inicio </span></a></li>
         <%
                Profesor objDatos= new Profesor();
                objDatos=BD.obtenerDatos(id);
                String nombrePerfil =objDatos.getNombre()+" "+objDatos.getApellido();
            %>
	 <li class="has-sub"><a href="perfil.jsp"><span><font face="Segoe Ui Semibold"><img src="cuadrito.png"/> &nbsp;&nbsp;&nbsp;<%=nombrePerfil%></font></span></a></li>
</ul>

<%
        BD.cerrarConexion();
        }else{
            if(BD.obtenerEstado(id)>2){
                %>
                <script>location.href="irPerfilAdmin.jsp?id=<%=id%>"</script>
                <%
               
            }
        }
               }
          
          else{}%>
    </body>
</html>
