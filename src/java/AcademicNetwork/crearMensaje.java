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
public class crearMensaje extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>CrearMensaje</title>");   
            HttpSession sesion= request.getSession();
            if(sesion.getAttribute("Usuario")!=null){
            String valid=(String) (sesion.getAttribute("Usuario"));
            int id= Integer.parseInt(valid);
            String mensaje=request.getParameter("mensaje");
            int idProf=Integer.parseInt(request.getParameter("idProf"));
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String fecha=dateFormat.format(date);
            String fec="";
            String hora="";
            int i;
            char arreglo[];
            arreglo=fecha.toCharArray();
            for(i=0;i<10;i++){
                fec=fec+arreglo[i];
            }
            for(i=11;i<19;i++){
                hora=hora+arreglo[i];
            }
            fecha=fec;
            Conexion BD= new Conexion();
            BD.crearMensaje(id,idProf,mensaje,fecha, hora);
            out.println("<script>location.href='Mensajes.jsp?id="+idProf+"';</script>");
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
