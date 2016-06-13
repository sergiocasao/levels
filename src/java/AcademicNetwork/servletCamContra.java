/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AcademicNetwork;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author windows
 */
public class servletCamContra extends HttpServlet {

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
            
            //Recibir parametros del formulario de registro
            
            String email= request.getParameter("pass");
            int id= Integer.parseInt(request.getParameter("id"));

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Cambiar contraseña</title>");            
            out.println("</head>");
            out.println("<body>");
            //Conexion a la base de datos
            Conexion BD = new Conexion();
            
            //Metodo que realiza el registro
            
            if(BD.modificarContra(id, email)){
                out.println("<script>alert('Contraseña modificada correctamente.');"
                        + "location.href='index.jsp'"
                        + "</script>");
            }else{
                System.out.println("Por favor, ingresa una contraseña valida.");
                out.println("<script>alert('Datos incorrectos');"
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