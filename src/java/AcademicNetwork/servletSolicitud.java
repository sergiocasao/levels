package AcademicNetwork;


import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class servletSolicitud extends HttpServlet {

    //Clase que realiza el registro de un nuevo usuario
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            //Recibir parametros del formulario de registro
            int id= Integer.parseInt(request.getParameter("id"));
            String descripcion= request.getParameter("descripcion");
            String titulo= request.getParameter("titulo");
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            java.util.Date date = new java.util.Date();
            String fecha=dateFormat.format(date);
            String fec="";
            String hora="";
            int i;
            char arreglo[];
            arreglo=fecha.toCharArray();
            for(i=0;i<10;i++){
                fec=fec+arreglo[i];
            }
            for(i=11;i<19;i++){
                hora=hora+arreglo[i];
            }
            fecha=fec;
            
            //Conexion a la base de datos
            Conexion BD = new Conexion();
            
            //Metodo que realiza el registro
            int idSolicitud=BD.registroSolicitud(id,descripcion,titulo,fecha,hora);
            if(idSolicitud!=0){
                out.println("<script>alert('Registro exitoso, se dara seguimiento lo más pronto posible, Folio: "+idSolicitud+"');"
                        + "location.href='inicio.jsp'"
                        + "</script>");
            }else{
                System.out.println("Error al realizar la solicitud");
                out.println("<script>alert('Error al realizar la solicitud');"
                        + "location.href='javascript:history.back(1)'"
                        + "</script>");
            }
            
            
           
            
        }catch(SQLException e) {
            System.out.println("Error de mysql: "+ e.getMessage());
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        finally {            
            out.close();
        }
    }

    
}
