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
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 *
 * @author Alan
 */
public class crearPubVarias extends HttpServlet {

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
            out.println("<html>");
            out.println("<head>");
            out.println("<title>CrearPublicacion</title>");   
            HttpSession sesion= request.getSession();
            if(sesion.getAttribute("Usuario")!=null){
            String valid=(String) (sesion.getAttribute("Usuario"));
            int id= Integer.parseInt(valid);
            String publicacion="";
            ArrayList<Integer> idAcademias= new ArrayList<Integer>();
            FileItem archivo=null;
            
            DiskFileItemFactory factory = new DiskFileItemFactory();       
            ServletFileUpload uploader = new ServletFileUpload( factory );
                List<FileItem> items = uploader.parseRequest( request );
                for(int i=0;i<items.size();i++){
                   if(items.get(i).isFormField()){
                       String fieldname= items.get(i).getFieldName();
                       String valor= items.get(i).getString();
                       if(fieldname.equals("descripcion")){
                           publicacion=valor;
                       }else{
                           System.out.println(valor);
                           idAcademias.add(Integer.parseInt(valor));
                       }
                   }else{
                        archivo=items.get(i); 
                   }
                }
            
            
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
            String anexo="Sin documento";
           for(i=0;i<idAcademias.size();i++){
                int idAca=idAcademias.get(i);
                BD.crearPublicacion(publicacion, fecha, hora, anexo, idAca, id,archivo);
            }
            out.println("<script>location.href='inicio.jsp';</script>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Hola</h1>");
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