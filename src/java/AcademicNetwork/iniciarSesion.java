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
import java.sql.*;
import javax.servlet.http.HttpSession;
public class iniciarSesion extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>IniciarSesion</title>");            
            out.println("</head>");
            out.println("<body>");
            Conexion BD= new Conexion();
            String email=request.getParameter("email");
            String pass= request.getParameter("pass");
            if(BD.iniciarSesion(email,pass)){
                int id=BD.obtenerID(email);
                if(BD.obtenerEstado(id)==1){
                HttpSession sesion= request.getSession();
                sesion.setAttribute("Usuario",String.valueOf(id));
                response.sendRedirect("inicio.jsp");
                }else{
                    if(BD.obtenerEstado(id)==3 || BD.obtenerEstado(id)==4 || BD.obtenerEstado(id)==5){
                        int idEst=BD.obtenerEstado(id);
                        HttpSession sesion= request.getSession();
                        sesion.setAttribute("Usuario",String.valueOf(id));
                        response.sendRedirect("ConsultaSolicitudesAdmin.jsp");
                    }else{
                    out.println("<script>alert('Debe activar su cuenta, verifice su correo!');"
                        + "location.href='index.jsp';</script>");
                    }
                }
                
            }else{
                out.println("<script>alert('Usuario o contraseña incorrectos');"
                        + "location.href='index.jsp';</script>");
                
            }
                
            
            out.println("</body>");
            out.println("</html>");
        }catch(SQLException e){
                System.out.println("Error de mysql: "+e.getMessage());
            }catch(Exception e){
                System.out.println("Error: "+e.getMessage());
        } finally {            
            out.close();
        }
    }
}