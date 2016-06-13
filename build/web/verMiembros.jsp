
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
        function cargar(){
            $("#cssmenu").load("Barra.jsp");
                        
        }

        </script>
</head>

<body onload="cargar()">
<%HttpSession sesion= request.getSession();
        if(session.getAttribute("Usuario")==null){
        response.sendRedirect("index.jsp");
               }else{
                String valid=(String) (sesion.getAttribute("Usuario"));
                int id= Integer.parseInt(valid);
                int idAca=Integer.parseInt(request.getParameter("idAca"));
                Conexion BD = new Conexion();
                String academia= BD.obtenerPublicacion(idAca);
        %>

        <div id='cssmenu'>

</div>
        
<div id="cuerpo3">
  <div >
    <div id="info">


  <fieldset>
      <legend><font size="4px">Miembros</font></legend>
  <table width="541" border="0" align="center" cellpadding="5" id="tablalta">
        
      
      
      <tr>
          
          <td align="center" colspan="2"><img src="user-6-128.png"/><br/><input type="button" id="boton4" onclick="location.href='Grupo.jsp?id=<%=idAca%>'" value="<%=academia%>"/></td>
          
      </tr>
      
      <tr>
        <td align="center" colspan="2" ><hr style="color:#cccccc;"/></td>
    </tr>
      
      <%ArrayList<Profesor> miembros = new ArrayList<Profesor>();
                miembros=BD.obtenerMiembros(idAca);
                String listaMiembros=new String();
                for(int i=0;i<miembros.size();i++){
                    Profesor obj= new Profesor();
                    obj=miembros.get(i);
            %>
            <form action="irPerfil.jsp" name="buscar" method="post">
                <tr><td align="center"><input id="boton9" type="submit" value="<%=obj.getNombre()+ " "+obj.getApellido()%>"/></td></tr>
            <input type="hidden" name="id" value="<%=obj.getId()%>"/>
            </form>   
                

            <%
        }}
        %>
    
  </table>
  
  </fieldset>
</div>
</div>
  </div>





        
    </body>
</html>
