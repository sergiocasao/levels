/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AcademicNetwork;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alumnos
 */
public class descargarArchivo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            /* TODO output your page here. You may use following sample code. */		
            /*FileInputStream archivo = new FileInputStream("C:/Users/Public/Pictures/Sample Pictures/Koala.jpg"); 
            int longitud = archivo.available();
            byte[] datos = new byte[longitud];
            archivo.read(datos);
            archivo.close();*/
            String ruta= request.getParameter("ruta");
            String archivo= request.getParameter("archivo");
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition","attachment;filename="+archivo);
            OutputStream output=response.getOutputStream();
            DropBoxArchivos obj;
            obj = new DropBoxArchivos();
            obj.descargarArchivo(output,ruta);
            output.close();

        }catch(Exception e){
            
        }finally {            
            
        }
    }


}
