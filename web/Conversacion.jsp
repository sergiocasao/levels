<%-- 
    Document   : Conversacion
    Created on : 10-abr-2013, 17:40:56
    Author     : Alumnos
--%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div id="conver">
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
        if(idProf!=0){
                    ArrayList<Mensaje> listaMensajes=new ArrayList<Mensaje>();
                        listaMensajes=BD.obtenerMensajes(id,idProf);
                      for(int i=0;i<listaMensajes.size();i++){
                          Mensaje obj=new Mensaje();
                          obj=listaMensajes.get(i);
                    %>
                    
                    
                    <div id="mensaje">	
	
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
                        
                        
                        
                <%}
                BD.cerrarConexion();
                       }else{%>
            
       <%}%>
       
        </div>
       
    </body>
</html>
