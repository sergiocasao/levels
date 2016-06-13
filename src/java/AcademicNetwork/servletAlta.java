package AcademicNetwork;


import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class servletAlta extends HttpServlet {

    //Clase que realiza el registro de un nuevo usuario
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            //Recibir parametros del formulario de registro
            String nombre= request.getParameter("nombre");
            String apellido= request.getParameter("apellido");
            String email= request.getParameter("email");
            String pass= request.getParameter("pass");
            String genero= request.getParameter("genero");
            String fecha= request.getParameter("fecha");

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Registro</title>");            
            out.println("</head>");
            out.println("<body>");
            //Conexion a la base de datos
            Conexion BD = new Conexion();
            
            //Metodo que realiza el registro
            
            if(BD.registrarUsuario(nombre,apellido,email,pass,genero,fecha)){
                out.println("<script>alert('Registro exitoso, se ha enviado un correo de activación');"
                        + "location.href='index.jsp'"
                        + "</script>");
            }else{
                System.out.println("Correo existente");
                out.println("<script>alert('El correo ya existe');"
                        + "location.href='javascript:history.back(1)'"
                        + "</script>");
            }
            
            
            out.println("</body>");
            out.println("</html>");
            
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
