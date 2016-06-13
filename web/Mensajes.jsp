
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script>
                    function cargar(){
                        $("#conversacion").load("Conversacion.jsp",{id:$("input#idProf").val()});
                        $("#contactos").load("Contactos.jsp");
                        
                    }

        function cargarBarra(){
            $("#cssmenu").load("Barra.jsp");
        }

        

        </script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Mensajes</title>
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link href="csschat.css" rel="stylesheet" type="text/css" />
<link href="styles2.css" rel="stylesheet" type="text/css" />
</head>

    <body onload="javascript:setInterval('cargar()',2000),cargarBarra()">
 <% 
          HttpSession sesion= request.getSession();
        if(sesion.getAttribute("Usuario")!=null){
        String valid=(String) (sesion.getAttribute("Usuario"));
        int id= Integer.parseInt(valid);
        Conexion BD = new Conexion();
        int idProf=0;
        if(request.getParameter("id")!=null){
            idProf=Integer.parseInt(request.getParameter("id"));
        }
        
                  %>
   
<div id='cssmenu'>

</div>
                  <div id="cuerpo" style="padding-top: 0px; ">
        
    <div id="csschat" style="padding-top: 50px; "> 
        
        
            
<table width="800" style="border:solid 1px #CCCCCC; height: 80%;" align="center" >
    
    
    <tr>
        <td rowspan="3" valign="top" style="border-right: solid 1px #CCCCCC;">
	
	<div id="contactos" style="overflow-x:hidden;width:250px;height:100%;scrollbar-face-color: #410606; scrollbar-highlight-color: #410606;scrollbar-shadow-color: #410606; scrollbar-3dlight-color:#410606;scrollbar-arrow-color:#FFFFFF; scrollbar-track-color:#FFFFFF; scrollbar-drakshadow-color:#410606;">	
	<%ArrayList<Integer> listaConversacion = BD.obtenerConversacion(id);
              for(int i=0;i<listaConversacion.size();i++){  
              ArrayList<Mensaje> listaUltimoMensaje= new ArrayList<Mensaje>();
              listaUltimoMensaje=BD.obtenerUltimosMensajes(id,listaConversacion.get(i));
              int sinLeer=0;
              for(int j=0;j<listaUltimoMensaje.size();j++){
                  Mensaje obj=new Mensaje();
                  obj=listaUltimoMensaje.get(j);
                  if(obj.getDes()==id && obj.getEstado().equals("NO")){
                      
                      sinLeer++;
                  }
                }
              Mensaje ultimo= new Mensaje();
              ultimo=listaUltimoMensaje.get(listaUltimoMensaje.size()-1);
              String ultimoMensaje=ultimo.getDescripcion();
              if(ultimo.getDescripcion().length()>48){
                  ultimoMensaje=ultimo.getDescripcion().substring(0,45)+"...";
      }
%>
<div id="contacto">
            <form action="Mensajes.jsp" method="post">
	  <table width="100%" height="80" border="0" cellspacing="5">
              
        <tr>
            <td valign="bottom"><font color="#410606" face="Segoe ui semibold"><input type="submit" class="boton12" value="<%=BD.obtenerNombre(listaConversacion.get(i))+" ("+sinLeer+")"%>"/></font></td>
        </tr
        <tr>
            
          <td valign="top"><font color="#666666"><%=ultimoMensaje%></font></td>
        </tr>
      </table>
        <input type="hidden" name="id" value="<%=listaConversacion.get(i)%>"/>
            </form>
	</div>
	
	<%}%>
            

		
	</div>
	
	</td>
	
	
        <%
        String conversacion="";
        if(idProf==0){
            conversacion="Seleccione una conversación";
        }else{
            conversacion=BD.obtenerNombre(idProf);
        }%>
        <td colspan="2" style="height: 30px;background: #410606;padding-left: 10px;" align="left" valign="middle" ><font color="ffffff" size="2"><%=conversacion%> </font>
            
        </td>
    </tr>
        
        <tr>
        
        
        <td valign="top">	
	
        <div  id="conversacion" style="overflow-x:hidden;width:550px; height:100%;scrollbar-face-color: #410606; scrollbar-highlight-color: #410606;scrollbar-shadow-color: #410606; scrollbar-3dlight-color:#410606;scrollbar-arrow-color:#FFFFFF; scrollbar-track-color:#FFFFFF; scrollbar-drakshadow-color:#410606;">	
	<%if(request.getParameter("id")!=null){
            idProf=Integer.parseInt(request.getParameter("id"));
                       }
        if(idProf!=0){
                    ArrayList<Mensaje> listaMensajes=new ArrayList<Mensaje>();
                        listaMensajes=BD.obtenerMensajes(id,idProf);
                      for(int i=0;i<listaMensajes.size();i++){
                          Mensaje obj=new Mensaje();
                          obj=listaMensajes.get(i);
                    %>
                    
                    
                    <div id="mensaje" >	
	
				<table width="100%" border="0"  cellspacing="5">
  					<tr>
                                            <td><font color="#410606" face="Segoe ui semibold">
                                                     <%
                            if(BD.obtenerNombre(obj.getRem()).equals("Usuario de Academic Network ")){
                                %>
                                    <input type="hidden" name="id" value="<%=obj.getRem()%>"/><input class="boton12" type="submit"  align="left" value="<%=BD.obtenerNombre(obj.getRem())%>"/>
                                <% 
                                    }else{
                                %>
                                 <form action="irPerfil.jsp" name="buscar" method="post">
                                     <input type="hidden" name="id" value="<%=obj.getRem()%>"/><input class="boton12" type="submit"  align="left" value="<%=BD.obtenerNombre(obj.getRem())%>"/>
                                                 </form>
                            <%
                                }
                            %>
                                                    
                                                    
                                                    
                                                </font>
                                           
                                            </td>
 					</tr>
  					<tr>
                                            <td><%=obj.getDescripcion()%></td>
  					</tr>
  					<tr>
    					<td align="right"><font color="#999999"><%=obj.getFecha()+" a las "+obj.getHora()%></font></td>
 					</tr>
                                        <tr>
    					<td align="right"><font color="#999999"><%if(obj.getEstado().equals("SI"))%><%="Leido"%></font></td>
 					</tr>
				</table>

			</div>	
                        <%}
                        %>
                        
                        
                        
                <%
                BD.cerrarConexion();
                       %>
            
            
            
            
            
            
            <A name="final"></A>	
        </div>	
        <script>
        document.location.href="#final";
      </script>         
	</td>
  </tr>
  
  <tr>
      <td valign="top" style="background: #EAE9E9; height: 160px;">
		<div style="height:65px;">
	
	
				<table width="100%" border="0" >
                                    <form action="crearMensaje" name="nuevoMensaje" method="post">
  					<tr>
    					<td height="100" style="padding-top:10px;padding-left:15px;padding-right:15px;padding-bottom:5px;" > <textarea name="mensaje" style="width:99%;height:100%;resize: none;overflow:hidden;" ></textarea>
						</td>
  					</tr>
 					<tr>
                                            <td align="right" valign="top" height="50" style="padding-left:15px;padding-right:15px;"><div onclick="javascript:document.nuevoMensaje.submit();" id="boton3">Enviar</div>
					  </td>
  					</tr>
                                        <input type="hidden" id="idProf" name="idProf" value="<%=idProf%>"/>
                                        </form>
				</table>
	
		
	
		</div>	
	</td>
  </tr>
                                        
                        <%}%>
</table>

            
            
            
            </div>
        </div>  
    </div>



<%}else{
            response.sendRedirect("index.jsp");
}%>
</body>
</html>
