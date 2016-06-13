
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@page import="java.text.SimpleDateFormat"%>
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
        function cargar(){
            $("#cssmenu").load("Barra.jsp");
                        
        }

        </script>
</head>

<body onload="cargar()">
<%HttpSession sesion= request.getSession();

int j;
j=0;
        if(session.getAttribute("Usuario")==null){
        response.sendRedirect("index.jsp");
               }else{
                String valid=(String) (sesion.getAttribute("Usuario"));
                int id= Integer.parseInt(valid);
                Conexion BD= new Conexion();
                

        %>

      <div id='cssmenu'>

</div>




  <div id="cuerpo4">
      <div style="margin-left: 60px;margin-right: 60px;margin-bottom: 30px;">



          <fieldset style="padding: 20px;border: 0px">
              <table width="100%">
                  
                  <tr><td align="center"><font size="4px" > Notificaciones</font></legend></td></tr>
      
                  <tr><td><hr/></td></tr>
                  <tr><td></td></tr>
                  
                  <tr><td>
           
        <%
       

       ArrayList<Notificacion> listaNot= BD.obtenerNotificacion(id);
       
       for(int i=0;i<listaNot.size();i++){
           
           Notificacion objNot= new Notificacion();
        objNot=listaNot.get(i);
           
String fec=objNot.getFec();
String hora=objNot.getHora();
String text="";
if(objNot.isComPub()){
    text="comentó en";
}else text="publicó en";
            %>
            
            
            <%
                            if(objNot.getNombre().equals("Usuario de Academic Network ")){
                                %>
               <table  align="center" width="90%" border="0" cellpadding="5" id="notificacion" onClick="location.href='Publicacion.jsp?id=<%=objNot.getId()%>'">
            <tr>
            
                
                              
                <td>                
                    <table border="0" width="100%">
                        <tr>
                            <td valign="middle" width="4%">
                    <img/>
                            </td>
                            <td valign="middle" align="left">
                            <input class="boton11" type="submit" value="<%=objNot.getNombre()%>"/><font style="font-family: Segoe UI Light;font-size: 12px;"> <%=text%> </font><input type="button" class="boton11" onClick="location.href='Publicacion.jsp?id=<%=objNot.getId()%>'" value="<%=objNot.getAcademia()%>"/> 
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="middle" colspan="2">
                                <input class="boton13" type="button" value="<%=objNot.getDiferencia()%>" title="<%=objNot.getDiaSem()+", "+fec.substring(0,2) +" de "+objNot.getMes()+" de "+fec.substring(6,10)+" a la(s) "+hora.substring(0,5)%>"/>
                            </td>
                        </tr>
                    </table>
                        
                </td>   
                        
                         
                        
                        <input type="hidden" name="id" value="<%=objNot.getIdProf()%>"/>
            
            </tr>
            </table>
                                <% 
                                    }else{
                                %>
                                 <table  align="center" width="90%" border="0" cellpadding="5" id="notificacion" onClick="location.href='Publicacion.jsp?id=<%=objNot.getId()%>'">            <tr>
            <form action="irPerfil.jsp" name="buscar" method="post">
                
                              
                <td>                
                    <table border="0" width="100%">
                        <tr>
                            <td valign="middle" width="4%">
                    <img/>
                            </td>
                            <td valign="middle" align="left">
                            <input class="boton11" type="submit" value="<%=objNot.getNombre()%>"/><font style="font-family: Segoe UI Light;font-size: 12px;"> <%=text%> </font><input type="button" class="boton11" onClick="location.href='Publicacion.jsp?id=<%=objNot.getId()%>'" value="<%=objNot.getAcademia()%>"/> 
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="middle" colspan="2">
                                <input class="boton13" type="button" value="<%=objNot.getDiferencia()%>" title="<%=objNot.getDiaSem()+", "+fec.substring(0,2) +" de "+objNot.getMes()+" de "+fec.substring(6,10)+" a la(s) "+hora.substring(0,5)%>"/>
                            </td>
                        </tr>
                    </table>
                        
                </td>   
                        
                         
                        
                        <input type="hidden" name="id" value="<%=objNot.getIdProf()%>"/>
            </form> 
            </tr>
            </table>
                            <%
                                }
                            %>
            

            
    
      

            <%
       
           j=j+1;
 }

        %><%if(listaNot.size()==0){
               %>
           <table  align="right" width="100%" border="0" cellpadding="5">
            <tr>                            
                <td align="center">                
                    <font color="#A3A3A3" face="Segoe Ui Light">No hay notificaciones nuevas :( </font> 
                </td>     
            </tr>
</table>
           <%
               }} %>
              </td></tr>
  </table>
  </fieldset>
</div>
</div>
            
            
            
            
            
    </body>
</html>
