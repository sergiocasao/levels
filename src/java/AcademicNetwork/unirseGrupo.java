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
 * @author Alumnos
 */
public class unirseGrupo extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>unirseGrupo</title>");            
            out.println("</head>");
            out.println("<body>");
            int id= Integer.parseInt(request.getParameter("id"));
            int idAca= Integer.parseInt(request.getParameter("idAca"));
            Conexion BD= new Conexion();
            if(BD.unirseGrupo(id, idAca)){
                out.println("<script>"
                        + "location.href='Grupo.jsp?id="+idAca+"';</script>");
            }else{
                out.println("<script>"
                        + "location.href='Grupo.jsp?id="+idAca+"';</script>");
            }
            out.println("</body>");
            out.println("</html>");
        }catch(SQLException e){
            System.out.println("Error MYSQL: "+e.getMessage());
        }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
        }
        finally {            
            out.close();
        }
    }

}
