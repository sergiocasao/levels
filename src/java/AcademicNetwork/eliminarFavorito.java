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
import javax.servlet.http.HttpSession;

/**
 *
 * @author davidcarrillomaldonado
 */
public class eliminarFavorito extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>AgregarFavorito</title>");   
            HttpSession sesion= request.getSession();
            if(sesion.getAttribute("Usuario")!=null){
            String valid=(String) (sesion.getAttribute("Usuario"));
            int id= Integer.parseInt(valid);
            int agregarID=Integer.parseInt(request.getParameter("id"));
            Conexion BD= new Conexion();
            BD.agregarFavorito(id, agregarID);
                out.println("<script>alert('Eliminado satisfactoriamente');"
                    + "location.href='Favoritos.jsp';</script>");

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
