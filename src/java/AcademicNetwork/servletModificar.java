package AcademicNetwork;


import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alumnos
 */
@WebServlet(name = "servletModificar", urlPatterns = {"/servletModificar"})
public class servletModificar extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            
            //Recibir parametros del formulario de registro
            HttpSession sesion= request.getSession();
            sesion.getAttribute("Usuario");
            String valid=(String) (sesion.getAttribute("Usuario"));
            int id= Integer.parseInt(valid);
            String nombre= request.getParameter("nombre");
            String apellido= request.getParameter("apellido");
            String email= request.getParameter("email");
            String pass= request.getParameter("pass");
            String genero= request.getParameter("genero");
            String fecha= request.getParameter("fecha");
            
            String[] academias= request.getParameterValues("academias[]");
            int [] idAcademias= new int[academias.length];
            for(int i=0;i<academias.length;i++){
                idAcademias[i]=Integer.parseInt(academias[i]);
                System.out.println(idAcademias[i]);
            }

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Registro</title>");            
            out.println("</head>");
            out.println("<body>");
            //Conexion a la base de datos
            Conexion BD = new Conexion();
            
            //Metodo que realiza el registro
            
            if(BD.comprobarContraseña(id, pass)){
                if(BD.modificarDatos(id, nombre, apellido, email, genero, fecha)){
                    if(BD.modificarAcademias(idAcademias, id)){
                    
                out.println("<script>alert('Datos modificados correctamente');"
                        + "location.href='index.jsp'"
                        + "</script>");}}
            }else{
                System.out.println("Contraseña incorrecta");
                out.println("<script>alert('Contraseña incorrecta');"
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
