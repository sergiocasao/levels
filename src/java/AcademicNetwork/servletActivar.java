/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AcademicNetwork;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alumnos
 */
public class servletActivar extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Conexion BD= new Conexion();
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Activar cuenta</title>");            
            out.println("</head>");
            out.println("<body>");
            String[] academias= request.getParameterValues("academias[]");
            int [] idAcademias= new int[academias.length];
            for(int i=0;i<academias.length;i++){
                idAcademias[i]=Integer.parseInt(academias[i]);
                System.out.println(idAcademias[i]);
            }
            String pass=request.getParameter("pass");
            int id= Integer.parseInt(request.getParameter("id"));
            System.out.println(id);
            System.out.println(pass);
            if(BD.registroAcademias(pass,idAcademias, id)){
                out.println("<script>alert('Cuenta activada correctamente');"
                        + "location.href='inicio.jsp'"
                        + "</script>");
                        HttpSession sesion= request.getSession();
                        sesion.setAttribute("Usuario",String.valueOf(id));
                        
                
            }else{
                out.println("<script>alert('Su contraseña no coincide');"
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
