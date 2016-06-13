/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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
 * @author Alan
 */
public class rechazar extends HttpServlet {

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
        try {
            int idSol=Integer.parseInt(request.getParameter("idSol"));
            Conexion BD= new Conexion();
            out.println("<html>");
            out.println("<head>");
            out.println("<title></title>");            
            out.println("</head>");
            out.println("<body>");
            BD.rechazarSolicitud(idSol);
            out.println("<script>alert('Se ha rechazado bien la solicitud de cambio')</script>");
            response.sendRedirect("ConsultaSolicitudesAdmin.jsp");
            out.println("</body>");
            out.println("</html>");
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