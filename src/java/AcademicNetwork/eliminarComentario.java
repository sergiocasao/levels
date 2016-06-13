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
public class eliminarComentario extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>SeliminarComentario</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession sesion= request.getSession();
            if(sesion.getAttribute("Usuario")!=null){
            String valid=(String) (sesion.getAttribute("Usuario"));
            int id= Integer.parseInt(valid);
            int idCom=Integer.parseInt(request.getParameter("idCom"));
            int idAca=Integer.parseInt(request.getParameter("idAca"));
            Conexion BD= new Conexion();
            BD.borrarComentario(idCom);
            if(idAca==0){
                out.println("<script>alert('Comentario Eliminado');"
                    + "location.href='inicio.jsp';</script>");
            }
            else{  out.println("<script>alert('Comentario Eliminado');"
                    + "location.href='Grupo.jsp?id="+idAca+"';</script>");
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
