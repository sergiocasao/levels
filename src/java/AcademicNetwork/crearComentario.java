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
public class crearComentario extends HttpServlet {

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
            String comentario=request.getParameter("descripcion");
            int idAca=Integer.parseInt(request.getParameter("idAca"));
            int bandera=Integer.parseInt(request.getParameter("bandera"));
            int idPub=Integer.parseInt(request.getParameter("idPub"));
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
            String anexo="documento.txt";
            BD.crearComentario(comentario, fecha, hora, idPub, id);
            if(idAca==0){
                out.println("<script>location.href='inicio.jsp';</script>");
            }else {
                if(bandera==0) out.println("<script>location.href='Grupo.jsp?id="+idAca+"';</script>");
                if(bandera==1)  out.println("<script>location.href='Publicacion.jsp?id="+idPub+"';</script>");
                if(bandera==2)  out.println("<script>location.href='inicio.jsp';</script>");
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
