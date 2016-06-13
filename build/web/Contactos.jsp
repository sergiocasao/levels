
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
        ArrayList<Integer> listaConversacion = BD.obtenerConversacion(id);
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
	
	<%}
              
                BD.cerrarConexion();
                       }else{%>
            
       <%}%>

       
    </body>
</html>
