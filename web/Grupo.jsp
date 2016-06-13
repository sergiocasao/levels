<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% 
          HttpSession sesion= request.getSession();
        if(sesion.getAttribute("Usuario")!=null){
        String valid=(String) (sesion.getAttribute("Usuario"));
        int id= Integer.parseInt(valid);
          int idAca=Integer.parseInt(request.getParameter("id"));
          Conexion BD = new Conexion();
          String academia= BD.obtenerPublicacion(idAca);
          
          
          
                  %>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> <%=academia%> </title>
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link href="styles2.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="Ortografia.js"></script>
    <script>
        function cargar(){
            $("#cssmenu").load("Barra.jsp");
                        
        }

        </script>
</head>

<body onload="cargar()">
 
              
<div id='cssmenu'>

</div>





<div id="espacio"></div>
    
    
    
<%if(BD.comprobarGrupo(id,idAca)){
                    %>
  <div id="opcion"> 
   <%}else{%>
   <div id="opcion" style="height: 400px;"> 
      <%}%>
      
      
      
  <div id="publicar">
      
      
      
      <%if(BD.comprobarGrupo(id,idAca)){
                    %>
                    <table width="78%" border="0" align="center" >
        <%}else{%>
          <table width="100%" border="0" align="center">
          <%}%>
          
          <%if(BD.comprobarGrupo(id,idAca)){%>
          
          <tr>
            <td align="left"><font size="3px" face="Segoe ui semibold" color="#000000"><%=academia%></font></td>
          <td align="right" valign="middle">
              
              
              <div style="cursor:pointer" onclick="location.href='unirseGrupo?id=<%=id%>&idAca=<%=idAca%>'">
                  <table border="0" id="boton8">
                        <tr>                               
                                    <td  align="right" valign="middle"><img src="circle-outline-24.png" width="16" height="16" /></td>
                                    <td  align="right" valign="middle">Salir del grupo</td>
                        </tr>
                    </table>
                </div>
          </td>
        
        </tr>
        <tr>
            <td>
                <form action="verMiembros.jsp" method="post">
                <input type="hidden" name="idAca" value="<%=idAca%>"/>
                <%ArrayList<Profesor> miembros = new ArrayList<Profesor>();
                miembros=BD.obtenerMiembros(idAca);
                String listaMiembros=new String();
                for(int i=0;i<miembros.size();i++){
                    Profesor obj= new Profesor();
                    obj=miembros.get(i);
                    if(i==miembros.size()-1) listaMiembros+=obj.getNombre()+" "+obj.getApellido();
                                       else listaMiembros+=obj.getNombre()+" "+obj.getApellido()+"&#13;";
                    }
                    
                    %>
                <input id="boton7" type="submit" value="<%=miembros.size()+ " miembros"%>" title="<%=listaMiembros%>"/>
                </form>
            </td>
        </tr>
        
                <tr><td height="1"></td></tr>
    
        
                <form method="post" name="publicar" action="crearPublicacion" onsubmit="return remplazarPublicacion(this);" enctype="multipart/form-data">          
        <tr>
          <td height="64" colspan="2" align="left" valign="top"><textarea name="descripcion"></textarea></td>
        </tr>
        <input type="hidden" name="idAca" value="<%=idAca%>" />
        <tr><td height="1"></td></tr>
        <tr>
          <td valign="bottom">
		  <div style="cursor:pointer">
		  <table width="200" border="0">
            <tr>
              <td width="68"><input type="file" name="archivo"/></td>
            </tr>
          </table>
		  </div>            
          </td>
            <td align="right" valign="bottom"><a><input type="submit" id="boton2" value="Publicar"></input></a> </td>
        </tr>
        </form>
        </table>
      
  </div>
        
  </div>
  

        <div id="cuerpo">
            
            

<%
       ArrayList<Publicacion> lista= BD.obtenerPublicacion2(idAca);
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
    
  <table width="68%" border="0" cellspacing="1">
    <tr>
       <%
        if(obj.getNombre().equals("Usuario de Academic Network ")){
            %>
            <td align="left"><input id="boton9" type="submit" value="<%=obj.getNombre()%>"/></td>
           <% 
        }else{
    %>
            <form action="irPerfil.jsp" name="buscar" method="post">
            <td align="left"><input id="boton9" type="submit" value="<%=obj.getNombre()%>"/></td>
            <input type="hidden" name="id" value="<%=obj.getIdProf()%>"/>
            </form>  
        <%
              }
        %> 
            <%if (BD.comprobarPublicacion(id,obj.getId())){%>
      <form action="eliminarPublicacion" method="post">
      <td align="right"><div><input type="image" src="x-mark-3-24.png" width="16"  heigth="16"/></div></td>
      <input type="hidden" name="idPub" value="<%=obj.getId()%>"/>
      <input type="hidden" name="idAca" value="<%=idAca%>" />
      </form>
      <%}%>

    </tr>
    <tr>
        <td colspan="2" align="left"><pre style="font-family:segoe ui light;"><%=obj.getDescripcion()%></pre></td>
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
              <div style="background-color: #E6E6E6;border:0px;width: 65%;">
              
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
       <table  width="100%" cellspacing="5" style="border-bottom: 1px solid #FFFFFF">
       
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
      <td width="298" align="right"><div><input type="image" src="x-mark-3-24.png" width="16"  heigth="16"/></div></td>
      <input type="hidden" name="idCom" value="<%=obj2.getId()%>"/>
      <input type="hidden" name="idAca" value="<%=idAca%>" />
      </form>
      <%}%>
    </tr>
    <tr>
        <td colspan="2" ><pre style="font-family:segoe ui light;height: 0px;color: #000;"><%=obj2.getDescripcion()%></pre></td>
      </tr>
      <tr>
          <td colspan="2" align="right"> <input id="boton5" type="button" value="<%=difC%>" title="<%=diaSem2+", "+fec2.substring(0,2) +" de "+mes2+" de "+fec2.substring(6,10)+" a la(s) "+obj2.getHora().substring(0,5)%>"/> </td>
      </tr>
              

    </table>
    <%
       }
          %>
              </div>
              <form method="post" name="comentar" onsubmit="return remplazarPublicacion(this);" action="crearComentario">
                  <table  width="65%" cellspacing="10"  >
    <tr>
      <td height="64" colspan="2"><textarea name="descripcion"></textarea></td>
      </tr>
                  <input type="hidden" name="idAca" value="<%=idAca%>" />
                  <input type="hidden" name="idPub" value="<%=obj.getId()%>" />
                  <input type="hidden" name="bandera" value="0" />
    <tr>
      <td colspan="2" align="right"><div align="right"><input type="submit" id="boton2" value="Comentar"/></div></td>
      </tr>
                </table>
              </form>
  
</div>
<%
       }
%>
<%}else{%>



    <table align="center" style="z-index: 8;">
<tr>
    <td colspan="2" align="center">
        <div style="margin-top: 70px;color: #333333; font-size: 14px;">
            
            <p><img src="lock-10-128.png"/></p>
            <p><font size="4px"><%=academia%></font></p>
            <p><hr/></p>
            <p>Para poder ver la publicaciones debe ser parte del grupo</p>
            <p>
                <div onclick="location.href='unirseGrupo?id=<%=id%>&idAca=<%=idAca%>'" style="cursor: pointer;">
                    <table border="0" align="center" id="boton8">
                        <tr>
                            <td width="80" align="right" valign="middle"><img  src="circle-outline-24.png" width="16" height="16" /></td>
                            <td width="140" align="left" valign="middle"  >Unirse al grupo</td>
                        </tr>
                </table> 
                </div>
            </p>
        </div>
    </td>
</tr>
</table>
     



<%}%>
</div>



<%}else{
            response.sendRedirect("index.jsp");
}%>
</body>
</html>
