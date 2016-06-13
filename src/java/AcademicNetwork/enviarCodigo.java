package AcademicNetwork;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class enviarCodigo {
    
    public static void mandarCodigo(String correo, int id){
        try{
        Properties props = new Properties();

        // Nombre del host de correo, es smtp.gmail.com
         props.setProperty("mail.smtp.host", "smtp.gmail.com");

        // TLS si está disponible
         props.setProperty("mail.smtp.starttls.enable", "true");

        // Puerto de gmail para envio de correos
         props.setProperty("mail.smtp.port","587");

        // Nombre del usuario
         props.setProperty("mail.smtp.user", "academicnetworkmail@gmail.com");

        // Si requiere o no usuario y password para conectarse.
         props.setProperty("mail.smtp.auth", "true");
         
         Session session = Session.getDefaultInstance(props);
         session.setDebug(true);
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress("academicnetworkmail@gmail.com"));

        // A quien va dirigido
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
        message.setSubject("Activacion de cuenta");
        message.setContent("<table width='100%'><tr><td><table width='550' height='410' cellpadding='20'><tr><td width='65' height='110' align='center' valign='middle' bgcolor='#410606'><img src='http://oi49.tinypic.com/tz034.jpg' alt='AcademicNetwork' width='64' height='64' /></td><td width='385' align='left' valign='middle' bgcolor='#410606'><font color='#FFFFFF' face='Segoe Ui Light'>Bienvenido a </font><font color='#FFFFFF' face='Segoe Ui Semibold'>Academic Network </font></td></tr><tr><td height='180' colspan='2' align='center' valign='middle' bgcolor='#FFFFFF'><p><font color='#410606' face='Segoe Ui Semibold'>Ya casi has terminado</font></p><p><font color='#410606' face='Segoe Ui Light'>Para completar tu registro en Academic Network, haz clic en el siguiente enlace:</font></p><p><a href='http://localhost:8080/AcademicNetwork/activarCuenta.jsp?id="+id+"&email="+correo+"' style='text-decoration:none;'>Completar registro</a></p></td></tr><tr><td height='110' colspan='2' align='left' valign='middle' bgcolor='#410606'><font color='#FFFFFF' face='Segoe Ui Light' size='-2'>Este email forma parte del proceso de registro. Si no has solicitado darte de alta en Academic Network, por favor ignora este email. En un breve periodo de tiempo, la petici&oacute;n ser&aacute; eliminada del sistema.&nbsp;<br /><br />Gracias por ocupar </font><font color='#FFFFFF' face='Segoe Ui Semibold' size='-2'>Academic Network.<br /></font></td></tr></table></td></tr></table>","text/html");
        System.out.println("http://localhost:8080/AcademicNetwork/activarCuenta.jsp?id="+id+"&email="+correo);
        Transport t = session.getTransport("smtp");
        t.connect("academicnetworkmail@gmail.com","Levels2013");
        t.sendMessage(message,message.getAllRecipients());
        t.close();
        }catch(Exception e){
            System.out.println("Error");
        }
    }
    
    
    public static void mandarRecuperar(String correo, int id){
        try{
        Properties props = new Properties();

        // Nombre del host de correo, es smtp.gmail.com
         props.setProperty("mail.smtp.host", "smtp.gmail.com");

        // TLS si está disponible
         props.setProperty("mail.smtp.starttls.enable", "true");

        // Puerto de gmail para envio de correos
         props.setProperty("mail.smtp.port","587");

        // Nombre del usuario
         props.setProperty("mail.smtp.user", "academicnetworkmail@gmail.com");

        // Si requiere o no usuario y password para conectarse.
         props.setProperty("mail.smtp.auth", "true");
         
         Session session = Session.getDefaultInstance(props);
         session.setDebug(true);
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress("academicnetworkmail@gmail.com"));

        // A quien va dirigido
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
        message.setSubject("Recuperar contraseña");
        message.setContent("<table width='100%'><tr><td><table width='550' height='410' cellpadding='20'><tr><td width='65' height='110' align='center' valign='middle' bgcolor='#410606'><img src='http://oi49.tinypic.com/tz034.jpg' alt='AcademicNetwork' width='64' height='64' /></td><td width='385' align='left' valign='middle' bgcolor='#410606'><font color='#FFFFFF' face='Segoe Ui Semibold'>Academic Network </font></td></tr><tr><td height='180' colspan='2' align='center' valign='middle' bgcolor='#FFFFFF'><p><font color='#410606' face='Segoe Ui Semibold'>Cambia tu contraseña</font></p><p><font color='#410606' face='Segoe Ui Light'>Para cambiar tu contraseña de Academic Network, haz clic en el siguiente enlace:</font></p><p><a href='http://localhost:8080/AcademicNetwork/CambiarContra.jsp?id="+id+"&email="+correo+"' style='text-decoration:none;'>Cambiar contraseña</a></p></td></tr><tr><td height='110' colspan='2' align='left' valign='middle' bgcolor='#410606'><font color='#FFFFFF' face='Segoe Ui Light' size='-2'>Si no has solicitado cambiar tu contraseña de Academic Network, por favor ignora este email. En un breve periodo de tiempo, la petici&oacute;n ser&aacute; eliminada del sistema.&nbsp;<br /><br />Gracias por ocupar </font><font color='#FFFFFF' face='Segoe Ui Semibold' size='-2'>Academic Network.<br /></font></td></tr></table></td></tr></table>","text/html");
        System.out.println("http://localhost:8080/AcademicNetwork/CambiarContra.jsp?id="+id+"&email="+correo);
        Transport t = session.getTransport("smtp");
        t.connect("academicnetworkmail@gmail.com","Levels2013");
        t.sendMessage(message,message.getAllRecipients());
        t.close();
        }catch(Exception e){
            System.out.println("Error");
        }
    }
    
    
}
