package AcademicNetwork;
import java.io.File;
import java.io.PrintWriter;
import java.util.Scanner;

import com.dropbox.client2.DropboxAPI;
import com.dropbox.client2.DropboxAPI.*;
import com.dropbox.client2.exception.*;
import com.dropbox.client2.session.AccessTokenPair;
import com.dropbox.client2.session.AppKeyPair;
import com.dropbox.client2.session.RequestTokenPair;
import com.dropbox.client2.session.Session.AccessType;
import com.dropbox.client2.session.WebAuthSession;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.IOUtils;

public class DropBoxArchivos {
	
	// App key & secret that Dropbox's developer website gives your app
    private static final String APP_KEY = "2f31z964jbj5iou";
    private static final String APP_SECRET = "nf9zw9lpcfe3uyo";
    final static private AccessType ACCESS_TYPE = AccessType.DROPBOX;
    private static DropboxAPI<WebAuthSession> mDBApi;
    static AppKeyPair appKeys = new AppKeyPair(APP_KEY, APP_SECRET);
    static WebAuthSession session = new WebAuthSession(appKeys, ACCESS_TYPE);	
    static File tokensFile = new File("TOKENS");

	public DropBoxArchivos() throws Exception{
	        mDBApi = new DropboxAPI<WebAuthSession>(session);
	}
        
        public  String Autentificar(){
            try {
				String ruta=mDBApi.getSession().getAuthInfo().url;
				// Present user with URL to allow app access to Dropbox account on
				System.out.println("Please go to this URL and hit \"Allow\": " + ruta);
				// Wait for user to Allow app in browser
				System.out.println("Finished allowing?  Enter 'next' if so: ");

					
					
                         return ruta;
			} catch (DropboxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
                                return "";
			}
        }
        
        public  void ValidarSesion() throws FileNotFoundException {
            try{
            AccessTokenPair tokenPair = mDBApi.getSession().getAccessTokenPair();
            RequestTokenPair tokens = new RequestTokenPair(tokenPair.key, tokenPair.secret);
            mDBApi.getSession().retrieveWebAccessToken(tokens);
            PrintWriter tokenWriter = new PrintWriter(tokensFile);
            tokenWriter.println(session.getAccessTokenPair().key);
            tokenWriter.println(session.getAccessTokenPair().secret);
            tokenWriter.close();
            System.out.println("Authentication Successful!");
            }catch(DropboxException e){
                
            }
}
        
        public  void Reautentificar() throws FileNotFoundException, DropboxException{
            Scanner tokenScanner = new Scanner(tokensFile);       // Initiate Scanner to read tokens from TOKEN file
			String ACCESS_TOKEN_KEY = tokenScanner.nextLine();    // Read key
			String ACCESS_TOKEN_SECRET = tokenScanner.nextLine(); // Read secret
			tokenScanner.close(); //Close Scanner 

			//Re-auth
			AccessTokenPair reAuthTokens = new AccessTokenPair(ACCESS_TOKEN_KEY, ACCESS_TOKEN_SECRET);
			mDBApi.getSession().setAccessTokenPair(reAuthTokens);
			System.out.println("Re-authentication Sucessful!");
			
			//Run test command
			System.out.println("Hello there, " + mDBApi.accountInfo().displayName);
        }
        
        public void subirArchivo(FileItem archivo,String ruta) throws IOException{
            try{
                Reautentificar();
                System.out.print("Uploading file...");
                InputStream input=archivo.getInputStream();
                Entry newEntry = mDBApi.putFile(ruta, input,archivo.getSize(), null, null);
                System.out.println("Done. \nRevision of file: " + newEntry.rev);
            }catch(FileNotFoundException e){
                System.out.println("Error: "+e.getMessage());
            }catch(DropboxUnlinkedException e){
                System.out.println("Sin link");
            }catch(DropboxException e){
                System.out.println("Error Dropbox: "+e.getMessage());
            }
            }
        
        public void descargarArchivo(OutputStream outputStream,String ruta) throws IOException, FileNotFoundException, DropboxException {
            Reautentificar();
            try {
                System.out.println(ruta);
                DropboxFileInfo info = mDBApi.getFile(ruta, null, outputStream, null);
            }catch(Exception e){
                System.out.println("Error: "+e.getMessage());
            }finally{
                outputStream.close();
            }
        }
           
        }

