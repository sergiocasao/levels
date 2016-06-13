<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import= "AcademicNetwork.*" %> 
<%@page import= "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Inicio</title>
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link href="styles2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="assets/style.css" />
<link rel="stylesheet" type="text/css" href="assets/prettify.css" />
<link rel="stylesheet" type="text/css" href="stylocombo.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script type="text/javascript" src="assets/prettify.js"></script>
<script type="text/javascript" src="src/jquery.multiselect.js"></script>
<script src="Ortografia.js"></script>
<script type="text/javascript">
$(function(){
	$("select").multiselect();
});
</script>

</head>

<body>
<%HttpSession sesion= request.getSession();
        if(session.getAttribute("Usuario")==null){
        response.sendRedirect("index.jsp");
               }else{
                String valid=(String) (sesion.getAttribute("Usuario"));
                int id= Integer.parseInt(valid);
                Conexion BD = new Conexion();
                if(BD.obtenerEstado(id)>2){
        %>
        <script>location.href="perfil.jsp"</script>
<%}%>
       <div id='cssmenu'>
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
               <li><a href='Notificaciones.jsp' ><span><input class="boton12" style="font-family: Segoe ui semibold;"value="Ver todas" align="center" disabled="disabled"/></span></a></li>
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
               <li><a href='Mensajes.jsp' ><span><input class="boton12" style="font-family: Segoe ui semibold;"value="Ver todas" align="center" disabled="disabled"/></span></a></li>
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
</div>

<div id="espacio"></div>





  <div id="opcion">  
  <div id="publicar">
      <form method="post" name="publicar" action="crearPubVarias" onsubmit="return remplazarPublicacion(this);" enctype="multipart/form-data">
	  <table width="78%" border="0">
        <tr>
            <td colspan="2"><font size="3px" face="Segoe ui semibold" color="#000000">Inicio</font> </td>
        </tr>
        <tr>
          <td height="64" colspan="2" align="left" valign="top"><textarea name="descripcion"></textarea></td>
        </tr>
        <tr>
          <td valign="middle">
		  <div style="cursor:pointer">
		  <table width="200" border="0">
            <tr>
                <td width="68"><input type="file" name="archivo"/></td>
            </tr>
          </table>
		  </div>            </td>
          <td align="right"><select multiple="multiple" name="academias[]" size="1">
		  <% 
               for(int i=0;i<listaAcademias.size();i++){
                   Academias obj= new Academias();
                   obj=listaAcademias.get(i);
 %>
         <option value="<%=obj.getId()%>"><%=obj.getDescripcion()%></option>
                 <%}%>
	
		  </select>
          </td>
        </tr>
        <tr>
            <td colspan="2" align="right"><a><div onclick="ocultar()"><input type="submit" id="boton2" value="Publicar"></input></div><div id="cargando" style="display:none"><img src="ajax-loader.gif" width="16" height="16" /></div></a></td>
        </tr>
      </table>
  </form>
      
  </div>
  </div>
  

                 <div id="cuerpo">


<%
       ArrayList<Publicacion> lista= BD.obtenerNoticiasPublicacion(id);

       for(int i=0;i<lista.size();i++){
           Publicacion obj= new Publicacion();
           obj=lista.get(i);
           String fecha = obj.getFecha();
           
          
           
           GregorianCalendar cal = new GregorianCalendar();
	
           SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        String strFecha = fecha;
        Date fechaDate = null;
            
        fechaDate = formato.parse(strFecha);
            cal.setTime(fechaDate);
	int dia = cal.get(Calendar.DAY_OF_WEEK);
        String diaSem="";
        if(dia==1){
            diaSem="Domingo";
        }
        if(dia==2){
            diaSem="Lunes";
        }
        if(dia==3){
            diaSem="Martes";
        }
        if(dia==4){
            diaSem="Miercoles";
        }
        if(dia==5){
            diaSem="Jueves";
        }
        if(dia==6){
            diaSem="Viernes";
        }
        if(dia==7){
            diaSem="Sabado";
        }
        String fec="";
        fec=fecha.substring(8,10)+"/"+fecha.substring(5,7)+"/"+fecha.substring(0,4);
        String mes="";
        mes=fecha.substring(5,7);
        if(mes.equals("01")){
           mes="Enero"; 
        }
        if(mes.equals("02")){
           mes="Febrero"; 
        }
        if(mes.equals("03")){
           mes="Marzo"; 
        }
        if(mes.equals("04")){
           mes="Abril"; 
        }
        if(mes.equals("05")){
           mes="Mayo"; 
        }
        if(mes.equals("06")){
           mes="Junio"; 
        }
        if(mes.equals("07")){
           mes="Julio"; 
        }
        if(mes.equals("08")){
           mes="Agosto"; 
        }
        if(mes.equals("09")){
           mes="Septiembre"; 
        }
        if(mes.equals("10")){
           mes="Octubre"; 
        }
        if(mes.equals("11")){
           mes="Noviembre"; 
        }
        if(mes.equals("12")){
           mes="Diciembre"; 
        }
        final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000; //Milisegundos al dÃ­a 
java.util.Date hoy = new Date(); //Fecha de hoy 
     
int anioa = Integer.parseInt(fecha.substring(0,4)); 
int mesa = Integer.parseInt(fecha.substring(5,7));
int diaa = Integer.parseInt(fecha.substring(8,10));  
Calendar calendar = new GregorianCalendar(anioa, mesa-1, diaa); 
java.sql.Date fechaa = new java.sql.Date(calendar.getTimeInMillis());

long diferencia = ( hoy.getTime() - fechaa.getTime() )/MILLSECS_PER_DAY; 
String dif="Hace "+diferencia+" dias";
if(diferencia>=30){
    diferencia=(diferencia/30);
    dif="Hace "+diferencia+" meses";
}
if(diferencia==1){
    dif="Ayer";
}
if(diferencia>=365){
    diferencia=(diferencia/365);
    dif="Hace "+diferencia+" años";
}
if(diferencia==0){
    dif="Hoy";
}
%>
<div id="publicacion" align="center">
  <table width="68%" border="0" cellspacing="1" >
    <tr>
        <%
        if(obj.getNombre().equals("Usuario de Academic Network ")){
            %>
            <td align="left"><input id="boton9" type="submit" value="<%=obj.getNombre()%>"/> - <input type="button" id="boton9" onclick="location.href='Grupo.jsp?id=<%=obj.getIdAca()%>#<%=obj.getId()%>'" value="<%=obj.getAcademia()%>"/></td>
           <% 
        }else{
    %>
        <form action="irPerfil.jsp" name="buscar" method="post">
            <td align="left"><input id="boton9" type="submit" value="<%=obj.getNombre()%>"/> - <input type="button" id="boton9" onclick="location.href='Grupo.jsp?id=<%=obj.getIdAca()%>#<%=obj.getId()%>'" value="<%=obj.getAcademia()%>"/></td>
            <input type="hidden" name="id" value="<%=obj.getIdProf()%>"/>
            </form> 
            <%
              }
        %>
      <%if (BD.comprobarPublicacion(id,obj.getId())){%>
      <form action="eliminarPublicacion" method="post">
      <td align="right"><div><input type="image" src="x-mark-3-24.png" width="16"  heigth="16"/></div></td>
      <input type="hidden" name="idPub" value="<%=obj.getId()%>"/>
      <input type="hidden" name="idAca" value="0" />
      </form>
      <%}%>
    </tr>
    <tr>
        <td colspan="2" align="left"><pre style="font-family:segoe ui light; color: #000;"><%=obj.getDescripcion()%></pre></td>
      </tr>
      <tr>
          <td colspan="2" align="right"> <input id="boton7" type="button" value="<%=dif%>" title="<%=diaSem+", "+fec.substring(0,2) +" de "+mes+" de "+fec.substring(6,10)+" a la(s) "+obj.getHora().substring(0,5)%>"/> </td>
      </tr>
      
      <tr style="height: 50px;">
      <td align="left" valign="middle"> Comentarios </td>
      <td align="right" valign="middle">
	  
	  <div style="cursor:pointer">
		  <table width="200" border="0">
            
            <tr>
              <%if(!obj.getAnexo().equals("Sin documento")){
                 String adjunto="";
                 adjunto=obj.getAnexo().substring(1);
                 adjunto=adjunto.substring(adjunto.indexOf("/")+1);
    
                 %>
                <form action="descargarArchivo" method="post">
              <td width="162" align="right"><input type="submit" class="boton12" value="<%=adjunto%>"/></td>
              <td width="28" align="right"><input type="image" src="download-3-24.png" /></td>
              <input type="hidden" name="ruta" value="<%=obj.getAnexo()%>"/>
              <input type="hidden" name="archivo" value="<%=adjunto%>"/>
              </form>
              <%}%>
            </tr>
          </table>
	 </div>    
	 
	 </td>
    </tr>
              </table>
              <div style="background-color:#E6E6E6; border: 0px ;width: 65%;">
                  
              <% ArrayList<Comentario> listaComentarios=BD.obtenerComentario(obj.getId());
              for(int j=0; j<listaComentarios.size();j++){
                  Comentario obj2 = new Comentario();
                  obj2=listaComentarios.get(j);
                  String fecha2 = obj2.getFecha();
                  
                  
                  
           GregorianCalendar cal2 = new GregorianCalendar();
	
           SimpleDateFormat formato2 = new SimpleDateFormat("yyyy-MM-dd");
        String strFecha2 = fecha2;
        Date fechaDate2 = null;
            
        fechaDate2 = formato2.parse(strFecha2);
            cal2.setTime(fechaDate2);
	int dia2 = cal2.get(Calendar.DAY_OF_WEEK);
        String diaSem2="";
        if(dia2==1){
            diaSem2="Domingo";
        }
        if(dia2==2){
            diaSem2="Lunes";
        }
        if(dia2==3){
            diaSem2="Martes";
        }
        if(dia2==4){
            diaSem2="Miercoles";
        }
        if(dia2==5){
            diaSem2="Jueves";
        }
        if(dia2==6){
            diaSem2="Viernes";
        }
        if(dia2==7){
            diaSem2="Sabado";
        }
        String fec2="";
        fec2=fecha2.substring(8,10)+"/"+fecha2.substring(5,7)+"/"+fecha2.substring(0,4);
        String mes2="";
        mes2=fecha.substring(5,7);
        if(mes2.equals("01")){
           mes2="Enero"; 
        }
        if(mes2.equals("02")){
           mes2="Febrero"; 
        }
        if(mes2.equals("03")){
           mes2="Marzo"; 
        }
        if(mes2.equals("04")){
           mes2="Abril"; 
        }
        if(mes2.equals("05")){
           mes2="Mayo"; 
        }
        if(mes2.equals("06")){
           mes2="Junio"; 
        }
        if(mes2.equals("07")){
           mes2="Julio"; 
        }
        if(mes2.equals("08")){
           mes2="Agosto"; 
        }
        if(mes2.equals("09")){
           mes2="Septiembre"; 
        }
        if(mes2.equals("10")){
           mes2="Octubre"; 
        }
        if(mes2.equals("11")){
           mes2="Noviembre"; 
        }
        if(mes2.equals("12")){
           mes2="Diciembre"; 
        }
        final long MILLSECS_PER_DAYC = 24 * 60 * 60 * 1000; //Milisegundos al dÃ­a 
        
java.util.Date hoyC = new Date(); //Fecha de hoy 
     
int anioaC = Integer.parseInt(fecha.substring(0,4)); 
int mesaC = Integer.parseInt(fecha.substring(5,7));
int diaaC = Integer.parseInt(fecha.substring(8,10));  
Calendar calendarC = new GregorianCalendar(anioaC, mesaC-1, diaaC); 
java.sql.Date fechaaC = new java.sql.Date(calendarC.getTimeInMillis());

long diferenciaC = ( hoyC.getTime() - fechaaC.getTime() )/MILLSECS_PER_DAYC; 
String difC="Hace "+diferenciaC+" dias";
if(diferenciaC>=30){
    diferenciaC=(diferenciaC/30);
    difC="Hace "+diferenciaC+" meses";
}
if(diferenciaC==1){
    difC="Ayer";
}
if(diferenciaC>=365){
    diferenciaC=(diferenciaC/365);
    difC="Hace "+diferenciaC+" años";
}
if(diferenciaC==0){
    difC="Hoy";
}
       %>       
       
       <table  width="100%" cellspacing="5" style="border-bottom: 1px solid #FFFFFF" >
       
        
      <tr>
          <%
          if(obj2.getNombre().equals("Usuario de Academic Network ")){
            %>
            <td align="left"><input id="boton10" type="submit" value="<%=obj2.getNombre()%>"/></td>
           <% 
        }else{
    %>
            <form action="irPerfil.jsp" name="buscar" method="post">
            <td align="left"><input id="boton10" type="submit" value="<%=obj2.getNombre()%>"/></td>
            <input type="hidden" name="id" value="<%=obj2.getIdProf()%>"/>
            </form>  
        <%
              }
        %> 
      <%if(BD.comprobarComentario(id, obj2.getId())){%>
      <form action="eliminarComentario" method="post">
      <td align="right"><div><input type="image" src="x-mark-3-24.png" width="16"  heigth="16"/></div></td>
      <input type="hidden" name="idCom" value="<%=obj2.getId()%>"/>
      <input type="hidden" name="idAca" value="0" />
      </form>
      <%}%>
    </tr>
    <tr>
        <td colspan="2"><pre style="font-family:segoe ui light; color: #000;text-align: left;"><%=obj2.getDescripcion()%></td>
    </tr >
    <tr style="border-bottom-color: #FFFFFF">
          <td colspan="2" align="right"> <input id="boton5" type="button" value="<%=difC%>" title="<%=diaSem2+", "+fec2.substring(0,2) +" de "+mes2+" de "+fec2.substring(6,10)+" a la(s) "+obj2.getHora().substring(0,5)%>"/> </td>
    </tr>
             
   
       </table>
       
    <%
       }
          %>
     </div>
    <form method="post" name="comentar" action="crearComentario" onsubmit="return remplazarPublicacion(this);">
       <table  width="65%" cellspacing="10" >
    <tr cellspacing="10"  >
      <td height="64" colspan="2"><textarea name="descripcion"></textarea></td>
      </tr>
                  <input type="hidden" name="idAca" value="0" />
                  <input type="hidden" name="idPub" value="<%=obj.getId()%>" />
                  <input type="hidden" name="bandera" value="2" />
      <tr cellspacing="10" >
      <td colspan="2" align="right"><input type="submit" id="boton2" value="Comentar"/></td>
      </tr>
       </table>
      </form>
           
  
</div>
<%
       }
%>



</div>
<%}%>
</body>
</html>

