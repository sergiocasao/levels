package AcademicNetwork;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Alumnos
 */
public class registroAcademia extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>CrearComentario</title>");   
            HttpSession sesion= request.getSession();
            if(sesion.getAttribute("Usuario")!=null){
            String valid=(String) (sesion.getAttribute("Usuario"));
            int id= Integer.parseInt(valid);
            String nombre=request.getParameter("nombre");
            Conexion BD= new Conexion();
            if(BD.registroAcademia(nombre)){
                out.println("<script>location.href='Academias.jsp';</script>");
            }
            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
            }else{
                response.sendRedirect("index.jsp");
            }
        }
            catch(SQLException e){
                System.out.println("Error MYSQL: "+e.getMessage());
                
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
            }finally {            
            out.close();
        }
    }
}
