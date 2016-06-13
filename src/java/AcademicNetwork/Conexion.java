package AcademicNetwork;

import java.sql.*;
import java.util.ArrayList;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.text.SimpleDateFormat;
import org.apache.commons.fileupload.FileItem;

public final class Conexion {
    
  private Connection conexión;
  private Statement sentenciaSQL;
  private ResultSet cdr; 
  
  
  //Constructor que genera la conexion
  public Conexion() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException
  {
    // Cargar el controlador JDBC
    String controlador = "com.mysql.jdbc.Driver";
    Class.forName(controlador).newInstance();
    conectar(); // conectar con la fuente de datos
  }
  
  //Conexion a la base de datos
  
  public void conectar() throws SQLException
  {
    String URL_bd = "jdbc:mysql://localhost:3306/bdacademia";
    String usuario = "root";
    String contraseña = "n0m3l0";
    // Conectar con la BD
    conexión = DriverManager.getConnection(URL_bd, usuario, contraseña);
    // Crear una sentencia SQL
    sentenciaSQL = conexión.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
  }
  
  
  public void cerrarConexion() throws java.sql.SQLException
  {
    if (cdr != null) {
          cdr.close();
      }
    if (sentenciaSQL != null) {
          sentenciaSQL.close();
      }
    if (conexión != null) {
          conexión.close();
      }
  }

  //Lista de metodos
  
  public int obtenerID(String correo) throws SQLException{
      int id=0;
      Descifrado objDescifrar;
      String valcorreo=new String();
      cdr= sentenciaSQL.executeQuery("select * from mprofesor natural join msesion");
      while(cdr.next()){
          objDescifrar= new Descifrado();
          valcorreo=cdr.getString("cor_mse");
          valcorreo=objDescifrar.desencriptar(valcorreo);
          if(valcorreo.equals(correo)){
            id=cdr.getInt("id_mpr");
            
          }
      }   
      return id;
  }
  
  public int obtenerEstado(int id) throws SQLException{
      int idEstado=0;
      Descifrado objDescifrar;
      String valcorreo=new String();
      cdr= sentenciaSQL.executeQuery("select id_ces from destado natural join msesion natural join mprofesor where id_mpr="+id);
      cdr.first();
      idEstado=cdr.getInt("id_ces");
      return idEstado;
  }
  
  //Metodo de registro de usuario
  public boolean registrarUsuario(String nombre, String apellido, String email, String pass, String genero, String fecha) throws SQLException{
      int idSesion=0;
      Cifrado objCifrar=new Cifrado();
      Descifrado objDescifrar;
      //Alta en tabla profesor
      if(obtenerID(email)==0){
        String instruccion="insert into mprofesor(nom_mpr,ape_mpr,nac_mpr,gen_mpr) values('";
        instruccion+=nombre+"','";
        instruccion+=apellido+"','";
        instruccion+=fecha+"','";
        instruccion+=genero+"')";
        sentenciaSQL.executeUpdate(instruccion);
        cdr=sentenciaSQL.executeQuery("select * from mprofesor order by id_mpr asc");
        cdr.last();
        int id= cdr.getInt("id_mpr");
        //Alta en tabla sesion
        instruccion="insert into msesion(id_mpr,con_mse,cor_mse) values(";
        instruccion+=id+",'";
        instruccion+=objCifrar.encriptar(pass)+"','";
        objCifrar=new Cifrado();
        instruccion+=objCifrar.encriptar(email)+"')";
        sentenciaSQL.executeUpdate(instruccion);
        cdr=sentenciaSQL.executeQuery("select * from msesion");
        while(cdr.next()){
            String valCorreo=cdr.getString("cor_mse");
            objDescifrar=new Descifrado();
            valCorreo=objDescifrar.desencriptar(valCorreo);
            if(valCorreo.equals(email)){
                idSesion= cdr.getInt("id_mse");
            }
        }
        //Alta en tabla estado como desactivado
        instruccion="insert into destado values(";
        instruccion+="2,"+idSesion+")";
        sentenciaSQL.executeUpdate(instruccion);

        //enviarCorreo
        activarCuenta(email);
        return true;
      }else return false;
      
      
  }
  
  //Metodo que active cuenta y registra las academias
  public boolean registroAcademias(String password,int [] academias, int id) throws SQLException{
      int i=0;
      cdr=sentenciaSQL.executeQuery("select * from msesion natural join mprofesor where id_mpr="+id);
      cdr.first();
      int idSesion=cdr.getInt("id_mse");
      Descifrado objDescifrar=new Descifrado();
      String valPass=cdr.getString("con_mse");
      valPass=objDescifrar.desencriptar(valPass);
      if(password.equals(valPass)){
          for(i=0;i<academias.length;i++){
       String instruccion="insert into dacademia(id_aca,id_mpr) values(";
        instruccion+=academias[i]+",";
        instruccion+=id+")";
        sentenciaSQL.executeUpdate(instruccion);
        cdr=sentenciaSQL.executeQuery("select * from egrupo natural join cacademia where id_aca="+academias[i]);
       cdr.first();
       int idGrupo=cdr.getInt("id_egr");
       instruccion="";
       instruccion="insert into dgrupo(id_egr,id_mpr) values(";
        instruccion+=idGrupo+",";
        instruccion+=id+")";
        sentenciaSQL.executeUpdate(instruccion);
      }
      sentenciaSQL.executeUpdate("update destado set id_ces=1 where id_mse="+idSesion);
      
      String instruccion="insert into emensaje(id_mpr) values(";
        instruccion+=id+")";
        sentenciaSQL.executeUpdate(instruccion);
     
        instruccion="insert into eamigo(id_mpr) values(";
        instruccion+=id+")";
        sentenciaSQL.executeUpdate(instruccion);
        
      return true;
      }
      else return false;
  }
  
  //Sleccion de academias para formularios
  public ArrayList<Academias> obtenerAcademias() throws SQLException{
      ArrayList<Academias> lista = new ArrayList<Academias>();
      cdr=sentenciaSQL.executeQuery("select * from cacademia");
      while(cdr.next()){
          Academias obj= new Academias();
          obj.setId(cdr.getInt("id_aca"));
          obj.setDescripcion(cdr.getString("des_aca"));
          lista.add(obj);
      }
      return lista;
  }
  
  //Se envia un correo de para activar la cuenta
  
  public void activarCuenta(String correo) throws SQLException{
      int id=0;
      id=obtenerID(correo);
      enviarCodigo.mandarCodigo(correo, id);
      
  }
  
  //Inicio de sesion
  
 public boolean iniciarSesion(String email,String pass) throws SQLException{
     boolean val=false;
     cdr=sentenciaSQL.executeQuery("select * from msesion natural join mprofesor");
  while(cdr.next()){
      Descifrado objDescifrado= new Descifrado();
      String valPass=cdr.getString("con_mse");
      String valEmail=cdr.getString("cor_mse");
      valPass=objDescifrado.desencriptar(valPass);
      objDescifrado=new Descifrado();
      valEmail=objDescifrado.desencriptar(valEmail);
      if(email.equals(valEmail) && pass.equals(valPass)){
          val=true;
      }
  }
  if(val) return true;
  else return false;
 }
  //Obtener datos del profesor
 
  public Profesor obtenerDatos(int id) throws SQLException{
      cdr=sentenciaSQL.executeQuery("select nom_mpr,ape_mpr,nac_mpr,gen_mpr,cor_mse from mprofesor natural join msesion where id_mpr="+id);
      Profesor obj= new Profesor();
      while(cdr.next()){
          
          obj.setId(id);
          obj.setNombre(cdr.getString("nom_mpr"));
          obj.setApellido(cdr.getString("ape_mpr"));
          obj.setFecha(cdr.getString("nac_mpr"));
          obj.setGenero(cdr.getString("gen_mpr"));
          Descifrado objDescifrar=new Descifrado();
          String valCor=cdr.getString("cor_mse");
          valCor=objDescifrar.desencriptar(valCor);
          obj.setCorreo(valCor);
      }
      ArrayList<String> lista= new ArrayList<String>();
      cdr=sentenciaSQL.executeQuery("select des_aca from mprofesor natural join dacademia natural join cacademia where id_mpr="+id);
      while(cdr.next()){
          lista.add(cdr.getString("des_aca"));
      }
      obj.setAcademias(lista);
      return obj;
  }
  
  
  //Metodo que busca a los profesores que coinciden con la palabra a buscar
  public ArrayList<Profesor> buscarProfesor(String buscar) throws SQLException{
      buscar.trim();
      buscar=buscar.replaceAll(" ","% %");
      buscar="%"+buscar+"%";
      cdr=sentenciaSQL.executeQuery("select id_mpr, nom_mpr,ape_mpr from mprofesor natural join msesion natural join destado where id_ces=1 AND CONCAT(nom_mpr,' ',ape_mpr) LIKE '"+buscar+"'");
      ArrayList<Profesor> lista= new ArrayList<Profesor>();
      while(cdr.next()){
          Profesor obj= new Profesor();
          obj.setId(cdr.getInt("id_mpr"));
          obj.setNombre(cdr.getString("nom_mpr"));
          obj.setApellido(cdr.getString("ape_mpr"));
          if(cdr.getString("nom_mpr").equals("Usuario de Academic Network")){
              
          }else{
           lista.add(obj);   
          }
      }
      return lista;
  }
  
  public boolean agregarFavorito(int id,int agregar) throws SQLException{
      cdr=sentenciaSQL.executeQuery("select id_eam from eamigo where id_mpr="+id);
      cdr.first();
      int idAmigo=cdr.getInt("id_eam");
      if(comprobarFavorito(id,agregar)){
          sentenciaSQL.executeUpdate("delete from damigo where id_eam="+idAmigo+" AND id_mpr="+agregar);

          return false;
      }else{
        sentenciaSQL.executeUpdate("insert into damigo(id_eam,id_mpr) values("+idAmigo+","+agregar+")");

        return true;
      }
  }
  
  public boolean comprobarFavorito(int id, int agregar) throws SQLException{
      cdr=sentenciaSQL.executeQuery("select id_eam from eamigo where id_mpr="+id);
      cdr.first();
      int idAmigo=cdr.getInt("id_eam");
      cdr=sentenciaSQL.executeQuery("select * from damigo where id_eam="+idAmigo+" AND id_mpr="+agregar);
      if(cdr.isBeforeFirst()){
          return true;
      }else{
          return false;
      }
  }
  
 public ArrayList<Profesor> obtenerFavoritos(int id) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select id_eam from eamigo where id_mpr="+id);
      cdr.first();
      int idAmigo=cdr.getInt("id_eam"); 
     cdr=sentenciaSQL.executeQuery("select id_mpr, nom_mpr,ape_mpr from damigo natural join mprofesor where id_eam="+idAmigo);
      ArrayList<Profesor> lista= new ArrayList<Profesor>();
      while(cdr.next()){
          Profesor obj= new Profesor();
          obj.setId(cdr.getInt("id_mpr"));
          obj.setNombre(cdr.getString("nom_mpr"));
          obj.setApellido(cdr.getString("ape_mpr"));
          lista.add(obj);
      }
      return lista;
  }
  
 public String obtenerPublicacion(int id) throws SQLException{
     
     cdr=sentenciaSQL.executeQuery("select * from cacademia where id_aca="+id);
     cdr.first();
     String academia=cdr.getString("des_aca");
     return academia;
 }
 
 public ArrayList<Publicacion> obtenerPublicacion2(int id) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select id_mpu,id_mpr,des_aca,nom_mpr,ape_mpr,fec_mpu,hor_mpu,des_mpu,ane_mpu from egrupo natural join cacademia natural join dpublicacion natural join mpublicacion natural join  mprofesor where id_aca="+id+" order by fec_mpu desc, hor_mpu desc");
     ArrayList<Publicacion> lista= new ArrayList<Publicacion>();
      while(cdr.next()){
          Publicacion obj= new Publicacion();
          obj.setId(cdr.getInt("id_mpu"));
          obj.setIdProf(cdr.getInt("id_mpr"));
          obj.setAcademia(cdr.getString("des_aca"));
          String nombre=cdr.getString("nom_mpr");
          String apellido=cdr.getString("ape_mpr");
          obj.setNombre(nombre+" "+apellido);
          obj.setDescripcion(cdr.getString("des_mpu"));
          obj.setFecha(cdr.getString("fec_mpu"));
          obj.setHora(cdr.getString("hor_mpu"));
          obj.setAnexo(cdr.getString("ane_mpu"));
          lista.add(obj);
      }
     return lista;
 }
 
 public void crearPublicacion(String publicacion, String fecha, String hora, String anexo, int idAca, int idProf,FileItem archivo)throws SQLException, Exception{
  String instruccion="insert into mpublicacion(id_mpr,fec_mpu,hor_mpu,des_mpu,ane_mpu) values(";
        instruccion+=idProf+",'";
        instruccion+=fecha+"','";
        instruccion+=hora+"','";
        publicacion=convertirCadena(publicacion);
        instruccion+=publicacion+"','";
        instruccion+=anexo+"')";
        sentenciaSQL.executeUpdate(instruccion); 
        cdr=sentenciaSQL.executeQuery("select * from mpublicacion order by id_mpu asc");
        cdr.last();
            int idPub=cdr.getInt("id_mpu");
            instruccion="insert into dpublicacion(id_mpu,id_egr) values(";
            instruccion+=idPub+",";
            instruccion+=idAca+")";
            sentenciaSQL.executeUpdate(instruccion);
            if(archivo.getName().length()>0){
            String ruta="/"+idPub+"/"+archivo.getName();

       sentenciaSQL.executeUpdate("update mpublicacion set ane_mpu='"+ruta+"' where id_mpu="+idPub);
       DropBoxArchivos obj=new DropBoxArchivos();
       obj.subirArchivo(archivo, ruta);
            }
       
 }
 
 public boolean comprobarGrupo(int id,int grupo) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select * from dgrupo where id_egr="+grupo+" AND id_mpr="+id);
     if(cdr.isBeforeFirst()){
          return true;
      }else{
          return false;
      }
 }
 
 public boolean unirseGrupo(int id,int grupo) throws SQLException{
      if(comprobarGrupo(id,grupo)){
          sentenciaSQL.executeUpdate("delete from dgrupo where id_egr="+grupo+" AND id_mpr="+id);

          return false;
      }else{
        sentenciaSQL.executeUpdate("insert into dgrupo(id_egr,id_mpr) values("+grupo+","+id+")");

        return true;
      }
 }
 
   public void crearComentario(String comentario, String fecha, String hora, int idPub, int idProf)throws SQLException{
  String instruccion="insert into mcomentario(id_mpr,fec_mco,hor_mco,des_mco) values(";
        instruccion+=idProf+",'";
        instruccion+=fecha+"','";
        instruccion+=hora+"','";
        comentario=convertirCadena(comentario);
        instruccion+=comentario+"')";
        sentenciaSQL.executeUpdate(instruccion); 
        cdr=sentenciaSQL.executeQuery("select * from mcomentario order by id_mco asc");
        cdr.last();
            int idCom=cdr.getInt("id_mco");
            instruccion="insert into dcomentario(id_mco,id_mpu) values(";
            instruccion+=idCom+",";
            instruccion+=idPub+")";
            sentenciaSQL.executeUpdate(instruccion);
 }
 
    public ArrayList<Comentario> obtenerComentario(int id) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select id_mco,id_mpr,des_mco,nom_mpr,ape_mpr,fec_mco,hor_mco from mprofesor natural join mcomentario natural join dcomentario where id_mpu="+id+" order by fec_mco asc, hor_mco asc");
     ArrayList<Comentario> lista= new ArrayList<Comentario>();
      while(cdr.next()){
          Comentario obj= new Comentario();
          obj.setId(cdr.getInt("id_mco"));
          obj.setPublicacion(id);
          obj.setIdProf(cdr.getInt("id_mpr"));
          String nombre=cdr.getString("nom_mpr");
          String apellido=cdr.getString("ape_mpr");
          obj.setNombre(nombre+" "+apellido);
          obj.setDescripcion(cdr.getString("des_mco"));
          obj.setFecha(cdr.getString("fec_mco"));
          obj.setHora(cdr.getString("hor_mco"));
          lista.add(obj);
      }
     return lista;
 }

    public ArrayList<Publicacion> obtenerNoticiasPublicacion(int id) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select * from dgrupo natural join egrupo where id_mpr="+id);
     ArrayList<Integer> grupos=new ArrayList<Integer>();
     while(cdr.next()){
         grupos.add(cdr.getInt("id_aca"));
     }
     int numGrupos=grupos.size();
     String sentencia=new String();
     sentencia="select * from dpublicacion natural join mpublicacion natural join egrupo natural join mprofesor natural join cacademia where ";
     for(int i=0;i<numGrupos;i++){
         if(i==numGrupos-1){
             sentencia+="id_aca="+grupos.get(i)+" order by fec_mpu desc, hor_mpu desc";
         }else sentencia+="id_aca="+grupos.get(i)+" OR ";
    }
     
    cdr=sentenciaSQL.executeQuery(sentencia);
     ArrayList<Publicacion> lista= new ArrayList<Publicacion>();
      while(cdr.next()){
          Publicacion obj= new Publicacion();
          obj.setId(cdr.getInt("id_mpu"));
          obj.setIdProf(cdr.getInt("id_mpr"));
          obj.setIdAca(cdr.getInt("id_aca"));
          obj.setAcademia(cdr.getString("des_aca"));
          String nombre=cdr.getString("nom_mpr");
          String apellido=cdr.getString("ape_mpr");
          obj.setNombre(nombre+" "+apellido);
          obj.setDescripcion(cdr.getString("des_mpu"));
          obj.setFecha(cdr.getString("fec_mpu"));
          obj.setHora(cdr.getString("hor_mpu"));
          obj.setAnexo(cdr.getString("ane_mpu"));
          lista.add(obj);
      }
     return lista;
 }
  
    
    public boolean comprobarContraseña(int id, String pass )throws SQLException{
 
     boolean val=false;
     
     cdr=sentenciaSQL.executeQuery("select * from msesion natural join mprofesor where id_mpr="+id+"");
  while(cdr.next()){
      Descifrado objDescifrado= new Descifrado();
      String valPass=cdr.getString("con_mse");
      valPass=objDescifrado.desencriptar(valPass);
      if(pass.equals(valPass)){
          val=true;

      }
  }
  if(val) return true;
  else return false;
 }
 
 


  public boolean modificarDatos(int id, String nombre, String apellido, String email, String genero, String fecha) throws SQLException{
      
      
   
      //Alta en tabla profesor
      
        String instruccion="UPDATE mprofesor SET nom_mpr='"+nombre+"', ape_mpr='"+apellido+"', nac_mpr='"+fecha+"', gen_mpr='"+genero+"' where id_mpr="+id+"";
        sentenciaSQL.executeUpdate(instruccion);
        return true;
                    
      
  }
  
  public boolean modificarContra(int id, String newpass) throws SQLException{
  
      
      Cifrado objCifrar=new Cifrado();
      
      
      
            
      String instruccion="UPDATE msesion SET con_mse='" + objCifrar.encriptar(newpass) + "' where id_mpr="+id+"";
      sentenciaSQL.executeUpdate(instruccion);
      return true;
 
  }
  
  public boolean modificarAcademias(int [] academias, int id) throws SQLException{
      
      int i = 0;
      
      String instruccion="DELETE FROM dacademia where id_mpr="+id+"";
      sentenciaSQL.executeUpdate(instruccion);
      
      
      
       for(i=0;i<academias.length;i++){
        instruccion="insert into dacademia(id_aca,id_mpr) values(";
        instruccion+=academias[i]+",";
        instruccion+=id+")";
        sentenciaSQL.executeUpdate(instruccion);
        }
            
        return true;
  }
 
     public boolean comprobarPublicacion(int id,int idPub) throws SQLException {
     cdr=sentenciaSQL.executeQuery("select * from mpublicacion where id_mpu="+idPub+" AND id_mpr="+id);
     if(cdr.isBeforeFirst()) return true;
     else return false;
 }
 
 public boolean comprobarComentario(int id,int idCom) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select * from mcomentario where id_mco="+idCom+" AND id_mpr="+id);
     if(cdr.isBeforeFirst()) return true;
     else return false;
 }
 
 public void borrarComentario(int idCom) throws SQLException{
     sentenciaSQL.executeUpdate("delete from dcomentario where id_mco="+idCom);
     sentenciaSQL.executeUpdate("delete from mcomentario where id_mco="+idCom);
 }
 
 public void borrarPublicacion(int idPub) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select * from dcomentario where id_mpu="+idPub);
     ArrayList<Integer> lista= new ArrayList<Integer>();
     while(cdr.next()){
         lista.add(cdr.getInt("id_mco"));
     }
     sentenciaSQL.executeUpdate("delete from dcomentario where id_mpu="+idPub);
     for(int i=0;i<lista.size();i++){
         sentenciaSQL.executeUpdate("delete from mcomentario where id_mco="+lista.get(i));
     }
     sentenciaSQL.executeUpdate("delete from dpublicacion where id_mpu="+idPub);
     sentenciaSQL.executeUpdate("delete from mpublicacion where id_mpu="+idPub);
 }        
   
 public ArrayList<Profesor> obtenerMiembros(int idGrupo) throws SQLException{
     ArrayList<Profesor> lista= new ArrayList<Profesor>();
     cdr=sentenciaSQL.executeQuery("select * from dgrupo natural join mprofesor natural join egrupo where id_aca="+idGrupo+" order by nom_mpr asc");
     while(cdr.next()){
         Profesor obj= new Profesor();
          obj.setId(cdr.getInt("id_mpr"));
          obj.setNombre(cdr.getString("nom_mpr"));
          obj.setApellido(cdr.getString("ape_mpr"));
          lista.add(obj);
      }
      return lista;
 }
 
 public ArrayList<Notificacion> obtenerNotificacion(int idProf) throws SQLException{

     ArrayList<Publicacion> listaPub= obtenerNoticiasPublicacion(idProf);
     ArrayList<Notificacion> listaNot= new ArrayList<Notificacion>();
     ArrayList<Notificacion> listaVal= new ArrayList<Notificacion>();
     cdr=sentenciaSQL.executeQuery("select * from dcomentario natural join mcomentario natural join dpublicacion natural join egrupo natural join cacademia natural join mprofesor left join mpublicacion using(id_mpu) where mpublicacion.id_mpr="+idProf+" order by fec_mco desc, hor_mco desc");
     while(cdr.next()){
        try{
         Notificacion obj= new Notificacion();
        obj.setId(cdr.getInt("id_mpu"));
        obj.setIdProf(cdr.getInt("mcomentario.id_mpr"));
        obj.setIdAca(cdr.getInt("id_aca"));
        obj.setAcademia(cdr.getString("des_aca"));
        obj.setNombre(cdr.getString("nom_mpr")+" "+cdr.getString("ape_mpr"));
        obj.setHora(cdr.getString("hor_mco"));
        String fecha = cdr.getString("fec_mco");
           
          
           
           GregorianCalendar cal = new GregorianCalendar();
	
           SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        String strFecha = fecha;
        java.util.Date fechaDate = null;
            
        fechaDate = formato.parse(strFecha);
            cal.setTime(fechaDate);
	int dia = cal.get(Calendar.DAY_OF_WEEK);
        String diaSem="";
        if(dia==1){
            diaSem="Domingo";
        }
        if(dia==2){
            diaSem="Lunes";
        }
        if(dia==3){
            diaSem="Martes";
        }
        if(dia==4){
            diaSem="Miercoles";
        }
        if(dia==5){
            diaSem="Jueves";
        }
        if(dia==6){
            diaSem="Viernes";
        }
        if(dia==7){
            diaSem="Sabado";
        }
        String fec="";
        fec=fecha.substring(8,10)+"/"+fecha.substring(5,7)+"/"+fecha.substring(0,4);
        String mes="";
        mes=fecha.substring(5,7);
        if(mes.equals("01")){
           mes="Enero"; 
        }
        if(mes.equals("02")){
           mes="Febrero"; 
        }
        if(mes.equals("03")){
           mes="Marzo"; 
        }
        if(mes.equals("04")){
           mes="Abril"; 
        }
        if(mes.equals("05")){
           mes="Mayo"; 
        }
        if(mes.equals("06")){
           mes="Junio"; 
        }
        if(mes.equals("07")){
           mes="Julio"; 
        }
        if(mes.equals("08")){
           mes="Agosto"; 
        }
        if(mes.equals("09")){
           mes="Septiembre"; 
        }
        if(mes.equals("10")){
           mes="Octubre"; 
        }
        if(mes.equals("11")){
           mes="Noviembre"; 
        }
        if(mes.equals("12")){
           mes="Diciembre"; 
        }
        
        final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000; //Milisegundos al dÃ­a 
        java.util.Date hoy = new Date(); //Fecha de hoy 
     
        int anioa = Integer.parseInt(fecha.substring(0,4)); 
        int mesa = Integer.parseInt(fecha.substring(5,7));
        int diaa = Integer.parseInt(fecha.substring(8,10));  
        Calendar calendar = new GregorianCalendar(anioa, mesa-1, diaa); 
        java.sql.Date fechaa = new java.sql.Date(calendar.getTimeInMillis());

        long diferencia = ( hoy.getTime() - fechaa.getTime() )/MILLSECS_PER_DAY; 
        String dif="Hace "+diferencia+" dias";
        if(diferencia>=30){
            diferencia=(diferencia/30);
            dif="Hace "+diferencia+" meses";
        }
        if(diferencia==1){
            dif="Ayer";
        }
        if(diferencia>=365){
            diferencia=(diferencia/365);
            dif="Hace "+diferencia+" años";
        }
        if(diferencia==0){
            dif="Hoy";
        }

        obj.setFec(fec);
        obj.setDiaSem(diaSem);
        obj.setMes(mes);
        obj.setDiferencia(dif);
        obj.setComPub(true);
        
        
        
        if(obj.getIdProf()==idProf){
            
        }
        else listaVal.add(obj);
        }catch(Exception e){
            
        }
     }
     
      for(int i=0;i<listaVal.size();i++){
         Notificacion obj= new Notificacion();
         obj=listaVal.get(i);
          int idVal=obj.getId();
         int val=0;
         for(int j=i+1;j<listaVal.size();j++){
             Notificacion objVal= new Notificacion();
             objVal=listaVal.get(j);
             if(idVal==objVal.getId()){
                 val++;
             }
         }
         if(val==0){
             listaNot.add(obj);
         }
         
     } 
     
     
     
       for(int i=0;i<listaPub.size();i++){
           try{
           Publicacion obj= new Publicacion();
           obj=listaPub.get(i);
           String fecha = obj.getFecha();
           
          
           
           GregorianCalendar cal = new GregorianCalendar();
	
           SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        String strFecha = fecha;
        java.util.Date fechaDate = null;
            
        fechaDate = formato.parse(strFecha);
            cal.setTime(fechaDate);
	int dia = cal.get(Calendar.DAY_OF_WEEK);
        String diaSem="";
        if(dia==1){
            diaSem="Domingo";
        }
        if(dia==2){
            diaSem="Lunes";
        }
        if(dia==3){
            diaSem="Martes";
        }
        if(dia==4){
            diaSem="Miercoles";
        }
        if(dia==5){
            diaSem="Jueves";
        }
        if(dia==6){
            diaSem="Viernes";
 
        }
        if(dia==7){
            diaSem="Sabado";
        }
        String fec="";
        fec=fecha.substring(8,10)+"/"+fecha.substring(5,7)+"/"+fecha.substring(0,4);
        String mes="";
        mes=fecha.substring(5,7);
        if(mes.equals("01")){
           mes="Enero"; 
        }
        if(mes.equals("02")){
           mes="Febrero"; 
        }
        if(mes.equals("03")){
           mes="Marzo"; 
        }
        if(mes.equals("04")){
           mes="Abril"; 
        }
        if(mes.equals("05")){
           mes="Mayo"; 
        }
        if(mes.equals("06")){
           mes="Junio"; 
        }
        if(mes.equals("07")){
           mes="Julio"; 
        }
        if(mes.equals("08")){
           mes="Agosto"; 
        }
        if(mes.equals("09")){
           mes="Septiembre"; 
        }
        if(mes.equals("10")){
           mes="Octubre"; 
        }
        if(mes.equals("11")){
           mes="Noviembre"; 
        }
        if(mes.equals("12")){
           mes="Diciembre"; 
        }
        
        final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000; //Milisegundos al dÃ­a 
        java.util.Date hoy = new Date(); //Fecha de hoy 
     
        int anioa = Integer.parseInt(fecha.substring(0,4)); 
        int mesa = Integer.parseInt(fecha.substring(5,7));
        int diaa = Integer.parseInt(fecha.substring(8,10));  
        Calendar calendar = new GregorianCalendar(anioa, mesa-1, diaa); 
        java.sql.Date fechaa = new java.sql.Date(calendar.getTimeInMillis());

long diferencia = ( hoy.getTime() - fechaa.getTime() )/MILLSECS_PER_DAY; 
String dif="Hace "+diferencia+" dias";
if(diferencia>=30){
    diferencia=(diferencia/30);
    dif="Hace "+diferencia+" meses";
}
if(diferencia==1){
    dif="Ayer";
}
if(diferencia>=365){
    diferencia=(diferencia/365);
    dif="Hace "+diferencia+" años";
}
if(diferencia==0){
    dif="Hoy";
}

Profesor obj2= obtenerDatos(idProf);
String nom=obj2.getNombre()+" "+obj2.getApellido();

if(nom.equals(obj.getNombre())){
    
}else{
    
    
    Notificacion objNot= new Notificacion();
objNot.setId(obj.getId());
objNot.setIdProf(obj.getIdProf());
objNot.setIdAca(obj.getIdAca());
objNot.setAcademia(obj.getAcademia());
objNot.setNombre(obj.getNombre());
objNot.setHora(obj.getHora());
objNot.setFec(fec);
objNot.setDiaSem(diaSem);
objNot.setMes(mes);
objNot.setDiferencia(dif);
objNot.setComPub(false);
listaNot.add(objNot);
}

}catch(Exception ex){
            
     }
}
       
       
       
       
       try{
       boolean val=false;
while(!val){
    val=true;
    for(int i=0;i<listaNot.size()-1;i++){
        Notificacion ordenar1= new Notificacion();
        Notificacion ordenar2= new Notificacion();
        ordenar1=listaNot.get(i);
        ordenar2=listaNot.get(i+1);
        
        String fecha1 = ordenar1.getFec();
        
        fecha1=fecha1.substring(6,10)+"-"+fecha1.substring(3,5)+"-"+fecha1.substring(0,2);
        SimpleDateFormat formato1 = new SimpleDateFormat("yyyy-MM-dd");
         java.util.Date fechaDate1 = null;
         fechaDate1 = formato1.parse(fecha1);
         String fecha2 = ordenar2.getFec();
         
         fecha2=fecha2.substring(6,10)+"-"+fecha2.substring(3,5)+"-"+fecha2.substring(0,2);
         java.util.Date fechaDate2 = null;
         fechaDate2 = formato1.parse(fecha2);

         if(fechaDate1.compareTo(fechaDate2)<0){
             val=false;
             Notificacion caja= new Notificacion();
             caja=ordenar1;
             ordenar1=ordenar2;
             ordenar2=caja;
             listaNot.set(i,ordenar1);
             listaNot.set(i+1,ordenar2);
             
             
         }else{
             SimpleDateFormat formato2= new SimpleDateFormat("hh:mm:ss");
            java.util.Date horaDate1=null;
            horaDate1=formato2.parse(ordenar1.getHora());
            java.util.Date horaDate2=null;
            horaDate2=formato2.parse(ordenar2.getHora());
            
             if(fechaDate1.compareTo(fechaDate2)==0 && horaDate1.compareTo(horaDate2)<0){
             val=false;
             Notificacion caja= new Notificacion();
             caja=ordenar1;
             ordenar1=ordenar2;
             ordenar2=caja;
             listaNot.set(i,ordenar1);
             listaNot.set(i+1,ordenar2);
             
            }
         }
    
    }
}
}catch(Exception e){
    System.out.println("Error de fecha "+e.getMessage());
}


     return listaNot;
 }
 
  
 public ArrayList<Mensaje> obtenerMensajes(int id,int idProf) throws SQLException{
     ArrayList<Mensaje> lista= new ArrayList<Mensaje>();
     cdr=sentenciaSQL.executeQuery("select * from dmensaje natural join mmensaje left join emensaje using(id_eme) where (dmensaje.id_mpr="+id+" && emensaje.id_mpr="+idProf+") OR (dmensaje.id_mpr="+idProf +" && emensaje.id_mpr="+id+") order by fec_mme asc, hor_mme asc");
     while(cdr.next()){
         Mensaje obj= new Mensaje();
         obj.setId(cdr.getInt("id_mme"));
         obj.setRem(cdr.getInt("emensaje.id_mpr"));
         obj.setDes(cdr.getInt("dmensaje.id_mpr"));
         obj.setDescripcion(cdr.getString("des_mme"));
         obj.setFecha(cdr.getString("fec_mme"));
         obj.setHora(cdr.getString("hor_mme"));
         obj.setEstado(cdr.getString("lei_dme"));
         lista.add(obj);
     }
     for(int i=0;i<lista.size();i++){
          Mensaje obj= new Mensaje();
          obj=lista.get(i);
          if(id==obj.getDes() && obj.getEstado().equals("NO")){
              sentenciaSQL.executeUpdate("update dmensaje set lei_dme='SI' where id_mme="+obj.getId());
              obj.setEstado("SI");
              lista.set(i, obj);
          }
        }
     return lista;
 }
 
 public String obtenerNombre(int id) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select * from mprofesor where id_mpr="+id);
     cdr.first();
     return cdr.getString("nom_mpr")+" "+cdr.getString("ape_mpr");
 }
 
 public void crearMensaje(int id,int idProf,String descripcion,String fecha,String hora) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select id_eme from emensaje where id_mpr="+id);
     cdr.first();
     int idEncabezado= cdr.getInt("id_eme");
     descripcion=convertirCadena(descripcion);
     sentenciaSQL.executeUpdate("insert into mmensaje(id_eme,des_mme,fec_mme,hor_mme) values("
             + idEncabezado
             + ",'"
             + descripcion
             + "','"
             + fecha
             + "','"
             + hora
             + "')");
     cdr=sentenciaSQL.executeQuery("select * from mmensaje order by id_mme asc");
     cdr.last();
     int idMensaje= cdr.getInt("id_mme");
     sentenciaSQL.executeUpdate("insert into dmensaje(id_mme,id_mpr,lei_dme) values("+idMensaje+","+idProf+",'NO')");
     
 }

 public boolean eliminarCuenta(int id) throws SQLException{
      //Eliminar cuenta
        String instruccion="UPDATE mprofesor SET nom_mpr='Usuario de Academic Network', ape_mpr='', nac_mpr='1900-01-01', gen_mpr='' where id_mpr="+id+"";
        sentenciaSQL.executeUpdate(instruccion);
        cdr=sentenciaSQL.executeQuery("select * from msesion where id_mpr="+id);
        cdr.first();
        int idSesion=cdr.getInt("id_mse");
        instruccion="";
        instruccion="delete from destado where id_mse="+idSesion+"";
        sentenciaSQL.executeUpdate(instruccion);
        instruccion="";
        instruccion="delete from msesion where id_mpr="+id+"";
        sentenciaSQL.executeUpdate(instruccion);
        instruccion="";
        instruccion="delete from dgrupo where id_mpr="+id+"";
        sentenciaSQL.executeUpdate(instruccion);
        instruccion="";
        instruccion="delete from dacademia where id_mpr="+id+"";
        sentenciaSQL.executeUpdate(instruccion);
        instruccion="";
        instruccion="delete from damigo  where id_mpr="+id+"";
        sentenciaSQL.executeUpdate(instruccion);
        cdr=sentenciaSQL.executeQuery("select * from eamigo where id_mpr="+id);
        cdr.first();
        int idEamigo=cdr.getInt("id_eam");
        instruccion="";
        instruccion="delete from damigo  where id_eam="+idEamigo+"";
        sentenciaSQL.executeUpdate(instruccion);
        instruccion="delete from eamigo where id_mpr="+id+"";
        sentenciaSQL.executeUpdate(instruccion);
        return true;
  }

 public ArrayList<Integer> obtenerConversacion(int id) throws SQLException{
     ArrayList<Integer> lista = new ArrayList<Integer>();
     cdr=sentenciaSQL.executeQuery("select emensaje.id_mpr,dmensaje.id_mpr from dmensaje natural join mmensaje left join emensaje using(id_eme) where dmensaje.id_mpr="+id+" or emensaje.id_mpr="+id+" order by fec_mme asc, hor_mme asc");
     while(cdr.next()){
         if(id!=cdr.getInt("dmensaje.id_mpr")) lista.add(cdr.getInt("dmensaje.id_mpr"));
         if(id!=cdr.getInt("emensaje.id_mpr")) lista.add(cdr.getInt("emensaje.id_mpr"));
     }
     
     ArrayList<Integer> listaVal= new ArrayList<Integer>();
     for(int i=0;i<lista.size();i++){
         
         int idVal=lista.get(i);
         
         int val=0;
         for(int j=i+1;j<lista.size();j++){
             if(idVal==lista.get(j)){
                 val++;
             }
         }
         if(val==0){
             listaVal.add(idVal);
         }
         
     }
     
     ArrayList<Integer> ordenarLista= new ArrayList<Integer>();
     for(int i=0;i<listaVal.size();i++){
         System.out.println(listaVal.get(i));
         ordenarLista.add(listaVal.get(listaVal.size()-i-1));
     }
     listaVal=ordenarLista;
     
     
     return listaVal;
 }
 
 public ArrayList<Mensaje> obtenerUltimosMensajes(int id,int idProf) throws SQLException{
     ArrayList<Mensaje> lista= new ArrayList<Mensaje>();
     cdr=sentenciaSQL.executeQuery("select * from dmensaje natural join mmensaje left join emensaje using(id_eme) where (dmensaje.id_mpr="+id+" && emensaje.id_mpr="+idProf+") OR (dmensaje.id_mpr="+idProf +" && emensaje.id_mpr="+id+") order by fec_mme asc, hor_mme asc");
     while(cdr.next()){
         Mensaje obj= new Mensaje();
         obj.setId(cdr.getInt("id_mme"));
         obj.setRem(cdr.getInt("emensaje.id_mpr"));
         obj.setDes(cdr.getInt("dmensaje.id_mpr"));
         obj.setDescripcion(cdr.getString("des_mme"));
         obj.setFecha(cdr.getString("fec_mme"));
         obj.setHora(cdr.getString("hor_mme"));
         obj.setEstado(cdr.getString("lei_dme"));
         lista.add(obj);
     }
     return lista;
 }
 
 
 public boolean recuperaContra (String email, String fecha) throws SQLException{
      
   boolean val= false;
     

        int id=obtenerID(email);
   
      cdr=sentenciaSQL.executeQuery("select * from msesion natural join mprofesor where id_mpr="+id+" and nac_mpr='"+fecha+"'");
      while(cdr.next()){
      
      String valEmail=cdr.getString("cor_mse");
      String valFecha=cdr.getString("nac_mpr");

      Descifrado objDescifrado= new Descifrado();
      valEmail=objDescifrado.desencriptar(valEmail);
      if(email.equals(valEmail) && fecha.equals(valFecha)){
          
          //enviarCorreo
        mailrecupera(email);
        val= true;
      }
      
      else 
          val=false;
      }   
     
      
    
     if(val) return true;
    else return false;
    
    
     }
 
 
 //Se envia un correo de para activar la cuenta
  
  public void mailrecupera(String correo) throws SQLException{
      int id=0;
      id=obtenerID(correo);
      enviarCodigo.mandarRecuperar(correo, id);
      
  }
  
   
 public Publicacion obtenerUnaPublicacion(int id) throws SQLException{
     cdr=sentenciaSQL.executeQuery("select id_mpu,id_aca,id_mpr,des_aca,nom_mpr,ape_mpr,fec_mpu,hor_mpu,des_mpu,ane_mpu from egrupo natural join cacademia natural join dpublicacion natural join mpublicacion natural join  mprofesor where id_mpu="+id);
     Publicacion obj= new Publicacion();
      cdr.first();

    obj.setId(cdr.getInt("id_mpu"));
    obj.setIdProf(cdr.getInt("id_mpr"));
    obj.setIdAca(cdr.getInt(("id_aca")));
    obj.setAcademia(cdr.getString("des_aca"));
    String nombre=cdr.getString("nom_mpr");
    String apellido=cdr.getString("ape_mpr");
    obj.setNombre(nombre+" "+apellido);
    obj.setDescripcion(cdr.getString("des_mpu"));
    obj.setFecha(cdr.getString("fec_mpu"));
    obj.setHora(cdr.getString("hor_mpu"));
    obj.setAnexo(cdr.getString("ane_mpu"));
     return obj;
 }  
    public int registroSolicitud(int id, String descripcion, String titulo, String fecha, String hora) throws SQLException{
        titulo=convertirCadena(titulo);
        descripcion=convertirCadena(descripcion);
        sentenciaSQL.executeUpdate("insert into msolicitud(des_mso,tit_mso,fec_mso,hor_mso) values('"
                +descripcion+"','"
                +titulo+"','"
                +fecha+"','"
                +hora+"')");
        cdr=sentenciaSQL.executeQuery("select * from msolicitud");
        cdr.last();
        int idSolicitud=cdr.getInt("id_mso");
        sentenciaSQL.executeUpdate("insert into dsolicitud(id_mso,id_mpr) values("+idSolicitud+","+id+")");
        sentenciaSQL.executeUpdate("insert into destadosol(id_mso,id_ces) values("+idSolicitud+",1)");
        return idSolicitud;
    }
    
    public ArrayList<Solicitud> obtenerSolicitudes(int id)throws SQLException{
        ArrayList<Solicitud> lista=new ArrayList<Solicitud>();
        cdr=sentenciaSQL.executeQuery("select * from msolicitud natural join dsolicitud natural join mprofesor natural join destadosol natural join cestadosol where id_mpr="+id);
        while(cdr.next()){
            Solicitud obj=new Solicitud();
            obj.setId(cdr.getInt("id_mso"));
            obj.setIdProf(id);
            obj.setDescripcion(cdr.getString("des_mso"));
            obj.setTitulo(cdr.getString("tit_mso"));
            obj.setFecha(cdr.getString("fec_mso"));
            obj.setHora(cdr.getString("hor_mso"));
            obj.setStatus(cdr.getString("des_ces"));
            lista.add(obj);
        }
        return lista;
    }
    public ArrayList<Solicitud> obtenerTodasSolicitudes()throws SQLException{
        ArrayList<Solicitud> lista=new ArrayList<Solicitud>();
        cdr=sentenciaSQL.executeQuery("select * from msolicitud natural join dsolicitud natural join mprofesor natural join destadosol natural join cestadosol");
        while(cdr.next()){
            Solicitud obj=new Solicitud();
            obj.setId(cdr.getInt("id_mso"));
            obj.setIdProf(cdr.getInt("id_mpr"));
            obj.setDescripcion(cdr.getString("des_mso"));
            obj.setTitulo(cdr.getString("tit_mso"));
            obj.setFecha(cdr.getString("fec_mso"));
            obj.setHora(cdr.getString("hor_mso"));
            obj.setStatus(cdr.getString("des_ces"));
            lista.add(obj);
        }
        return lista;
    }
    public Solicitud obtenerUnicaSolicitud(int idSol)throws SQLException{
        cdr=sentenciaSQL.executeQuery("select * from msolicitud natural join dsolicitud natural join mprofesor natural join destadosol natural join cestadosol where id_mso="+idSol);
        cdr.first();
        Solicitud obj=new Solicitud();
            obj.setId(idSol);
            obj.setIdProf(cdr.getInt("id_mpr"));
            obj.setDescripcion(cdr.getString("des_mso"));
            obj.setTitulo(cdr.getString("tit_mso"));
            obj.setFecha(cdr.getString("fec_mso"));
            obj.setHora(cdr.getString("hor_mso"));
            obj.setStatus(cdr.getString("des_ces"));
            cdr=sentenciaSQL.executeQuery("select * from msolicitud natural join dseguimientoa natural join mseguimientoa natural join dsegsola where id_mso="+idSol);
            if(cdr.isBeforeFirst()){
            cdr.first();
            obj.setIdProfSegAdmin(cdr.getInt("id_mpr"));
            obj.setSegAdmin(cdr.getString("des_msa"));
            }else{
            obj.setIdProfSegAdmin(0);
            obj.setSegAdmin("");    
            }
            cdr=sentenciaSQL.executeQuery("select id_mpr,des_msc from msolicitud natural join dseguimientoc natural join mseguimientoc natural join dsegsolc where id_mso="+idSol);
            if(cdr.isBeforeFirst()){
            cdr.first();
            obj.setIdProfSegCCB(cdr.getInt("id_mpr"));
            obj.setSegCCB(cdr.getString("des_msc"));    
            }else{
            obj.setIdProfSegCCB(0);
            obj.setSegCCB("");  
            }
            cdr=sentenciaSQL.executeQuery("select id_mpr,des_msq from msolicitud natural join dseguimientoq natural join mseguimientoq natural join dsegsolq where id_mso="+idSol);
            if(cdr.isBeforeFirst()){
            cdr.first();
            obj.setIdProfSegQA(cdr.getInt("id_mpr"));
            obj.setSegQA(cdr.getString("des_msq"));
            }else{
            obj.setIdProfSegQA(0);
            obj.setSegQA("");
            }
        return obj;
    }
    public void rechazarSolicitud(int idSol)throws SQLException{
           sentenciaSQL.executeUpdate("update destadosol set id_ces=6 where id_mso="+idSol);
    }
    public int seguimientoAdmin(int idSol, int idProf, String descripcion)throws SQLException{
        descripcion=convertirCadena(descripcion);
         sentenciaSQL.executeUpdate("insert into mseguimientoa(des_msa) values('"+descripcion+"')");
        cdr=sentenciaSQL.executeQuery("select * from mseguimientoa");
        cdr.last();
        int idSegA=cdr.getInt("id_msa");
        sentenciaSQL.executeUpdate("insert into dseguimientoa(id_mpr,id_msa) values("+idProf+","+idSegA+")");
        sentenciaSQL.executeUpdate("insert into dsegsola(id_mso,id_msa) values("+idSol+","+idSegA+")");
        sentenciaSQL.executeUpdate("update destadosol set id_ces=1 where id_mso="+idSol);
        return idSegA;
    }
    public int seguimientoCCB(int idSol, int idProf, String descripcion)throws SQLException{
        descripcion=convertirCadena(descripcion);
         sentenciaSQL.executeUpdate("insert into mseguimientoc(des_msc) values('"+descripcion+"')");
        cdr=sentenciaSQL.executeQuery("select * from mseguimientoc");
        cdr.last();
        int idSegC=cdr.getInt("id_msc");
        sentenciaSQL.executeUpdate("insert into dseguimientoc(id_mpr,id_msc) values("+idProf+","+idSegC+")");
        sentenciaSQL.executeUpdate("insert into dsegsolc(id_mso,id_msc) values("+idSol+","+idSegC+")");
        sentenciaSQL.executeUpdate("update destadosol set id_ces=1 where id_mso="+idSol);
        return idSegC;
    }
    public int seguimientoQA(int idSol, int idProf, String descripcion)throws SQLException{
        descripcion=convertirCadena(descripcion);
         sentenciaSQL.executeUpdate("insert into mseguimientoq(des_msq) values('"+descripcion+"')");
        cdr=sentenciaSQL.executeQuery("select * from mseguimientoq");
        cdr.last();
        int idSegQ=cdr.getInt("id_msq");
        sentenciaSQL.executeUpdate("insert into dseguimientoq(id_mpr,id_msq) values("+idProf+","+idSegQ+")");
        sentenciaSQL.executeUpdate("insert into dsegsolq(id_mso,id_msq) values("+idSol+","+idSegQ+")");
        sentenciaSQL.executeUpdate("update destadosol set id_ces=5 where id_mso="+idSol);
        return idSegQ;
    }
     public ArrayList<Solicitud> obtenerSolicitudesEspecificas(int idProf)throws SQLException{
        ArrayList<Solicitud> lista= new ArrayList<Solicitud>();
        int estado = obtenerEstado(idProf);           
            cdr=sentenciaSQL.executeQuery("select * from msolicitud natural join dsolicitud natural join mprofesor natural join destadosol natural join cestadosol");
            while(cdr.next()){
                boolean existe=true;
                Solicitud obj=new Solicitud();
                int idSol=cdr.getInt("id_mso");
                obj.setId(idSol);
                obj.setIdProf(cdr.getInt("id_mpr"));
                obj.setDescripcion(cdr.getString("des_mso"));
                obj.setTitulo(cdr.getString("tit_mso"));
                obj.setFecha(cdr.getString("fec_mso"));
                obj.setHora(cdr.getString("hor_mso"));
                obj.setStatus(cdr.getString("des_ces"));
                lista.add(obj);
            }
            for(int i=0;i<lista.size();i++){
                Solicitud obj= new Solicitud();
                obj=lista.get(i);
                cdr=sentenciaSQL.executeQuery("select * from msolicitud natural join dseguimientoa natural join mseguimientoa natural join dsegsola where id_mso="+obj.getId());
                if(cdr.isBeforeFirst()){
                cdr.first();
                obj.setIdProfSegAdmin(cdr.getInt("id_mpr"));
                obj.setSegAdmin(cdr.getString("des_msa"));
                }else{
                obj.setIdProfSegAdmin(0);
                obj.setSegAdmin("");    
                }
                cdr=sentenciaSQL.executeQuery("select id_mpr,des_msc from msolicitud natural join dseguimientoc natural join mseguimientoc natural join dsegsolc where id_mso="+obj.getId());
                if(cdr.isBeforeFirst()){
                cdr.first();
                obj.setIdProfSegCCB(cdr.getInt("id_mpr"));
                obj.setSegCCB(cdr.getString("des_msc"));    
                }else{
                obj.setIdProfSegCCB(0);
                obj.setSegCCB("");  
                }
                cdr=sentenciaSQL.executeQuery("select id_mpr,des_msq from msolicitud natural join dseguimientoq natural join mseguimientoq natural join dsegsolq where id_mso="+obj.getId());
                if(cdr.isBeforeFirst()){
                cdr.first();
                obj.setIdProfSegQA(cdr.getInt("id_mpr"));
                obj.setSegQA(cdr.getString("des_msq"));
                }else{
                obj.setIdProfSegQA(0);
                obj.setSegQA("");
                }
            }
        return lista;
    }
     public boolean registrarAdmin(String nombre, String apellido, String email, String pass, String genero,int tipo, String fecha) throws SQLException{
      int idSesion=0;
      Cifrado objCifrar=new Cifrado();
      Descifrado objDescifrar;
      //Alta en tabla profesor
      if(obtenerID(email)==0){
        String instruccion="insert into mprofesor(nom_mpr,ape_mpr,nac_mpr,gen_mpr) values('";
        instruccion+=nombre+"','";
        instruccion+=apellido+"','";
        instruccion+=fecha+"','";
        instruccion+=genero+"')";
        sentenciaSQL.executeUpdate(instruccion);
        cdr=sentenciaSQL.executeQuery("select * from mprofesor order by id_mpr asc");
        cdr.last();
        int id= cdr.getInt("id_mpr");
        //Alta en tabla sesion
        instruccion="insert into msesion(id_mpr,con_mse,cor_mse) values(";
        instruccion+=id+",'";
        instruccion+=objCifrar.encriptar(pass)+"','";
        objCifrar=new Cifrado();
        instruccion+=objCifrar.encriptar(email)+"')";
        sentenciaSQL.executeUpdate(instruccion);
        cdr=sentenciaSQL.executeQuery("select * from msesion");
        while(cdr.next()){
            String valCorreo=cdr.getString("cor_mse");
            objDescifrar=new Descifrado();
            valCorreo=objDescifrar.desencriptar(valCorreo);
            if(valCorreo.equals(email)){
                idSesion= cdr.getInt("id_mse");
            }
        }
        //Alta en tabla estado como desactivado
        instruccion="insert into destado values(";
        instruccion+=tipo+","+idSesion+")";
        sentenciaSQL.executeUpdate(instruccion);
        return true;
      }else return false;  
  }
 public ArrayList<Profesor> consultaPersonal(int buscar) throws SQLException{
      cdr=sentenciaSQL.executeQuery("select id_mpr, nom_mpr,ape_mpr from mprofesor natural join msesion natural join destado where id_ces="+buscar);
      ArrayList<Profesor> lista= new ArrayList<Profesor>();
      while(cdr.next()){
          Profesor obj= new Profesor();
          obj.setId(cdr.getInt("id_mpr"));
          obj.setNombre(cdr.getString("nom_mpr"));
          obj.setApellido(cdr.getString("ape_mpr"));
          if(cdr.getString("nom_mpr").equals("Usuario de Academic Network")){
              
          }else{
           lista.add(obj);   
          }
      }
      return lista; 
  }
 public boolean registroAcademia(String nombre) throws SQLException{
        String instruccion="insert into cacademia(des_aca) values('";
        instruccion+=nombre+"')";
        sentenciaSQL.executeUpdate(instruccion);
        cdr=sentenciaSQL.executeQuery("select * from cacademia where des_aca='"+nombre+"'");
        cdr.last();
        int idAca=cdr.getInt("id_aca");
        instruccion="insert into egrupo(id_aca) values("+idAca+")";
        sentenciaSQL.executeUpdate(instruccion);
     return true;
 }
 
 public String obtenerTipo(int id) throws SQLException {
     System.out.println(id);
     cdr=sentenciaSQL.executeQuery("select * from cestado natural join destado natural join msesion natural join mprofesor where id_mpr="+id);
     cdr.first();
     return cdr.getString("des_ces");
 }
 
 public String convertirCadena(String cadena){
     System.out.println(cadena);
     cadena=cadena.replace("\\","\\\\");
     cadena=cadena.replace("'","\\'");
     System.out.println(cadena);
     return cadena;
 }

}
