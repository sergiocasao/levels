package AcademicNetwork;


import java.io.FileInputStream;
import java.io.ObjectInputStream;

public class Descifrado{
    private String Cifrado=new String();
    private String Mensaje= new String();
    private int[][] Ki= new int[16][48];
    private int[][] s1= new int[4][16];
    private int[][] s2= new int[4][16];
    private int[][] s3= new int[4][16];
    private int[][] s4= new int[4][16];
    private int[][] s5= new int[4][16];
    private int[][] s6= new int[4][16];
    private int[][] s7= new int[4][16];
    private int[][] s8= new int[4][16];
    private int[] Key= new int[8];
    

    
    
    public void Cajas(){
        s1[0][0]=14;
        s1[0][1]=4;
        s1[0][2]=13;
        s1[0][3]=1;
        s1[0][4]=2;
        s1[0][5]=15;
        s1[0][6]=11;
        s1[0][7]=8;
        s1[0][8]=3;
        s1[0][9]=10;
        s1[0][10]=6;
        s1[0][11]=12;
        s1[0][12]=5;
        s1[0][13]=9;
        s1[0][14]=0;
        s1[0][15]=7;
        s1[1][0]=0;
        s1[1][1]=15;
        s1[1][2]=7;
        s1[1][3]=4;
        s1[1][4]=14;
        s1[1][5]=2;
        s1[1][6]=13;
        s1[1][7]=1;
        s1[1][8]=10;
        s1[1][9]=6;
        s1[1][10]=12;
        s1[1][11]=11;
        s1[1][12]=9;
        s1[1][13]=5;
        s1[1][14]=3;
        s1[1][15]=8;
        s1[2][0]=4;
        s1[2][1]=1;
        s1[2][2]=14;
        s1[2][3]=8;
        s1[2][4]=13;
        s1[2][5]=6;
        s1[2][6]=2;
        s1[2][7]=11;
        s1[2][8]=15;
        s1[2][9]=12;
        s1[2][10]=9;
        s1[2][11]=7;
        s1[2][12]=3;
        s1[2][13]=10;
        s1[2][14]=5;
        s1[2][15]=0;
        s1[3][0]=15;
        s1[3][1]=12;
        s1[3][2]=8;
        s1[3][3]=2;
        s1[3][4]=4;
        s1[3][5]=9;
        s1[3][6]=1;
        s1[3][7]=7;
        s1[3][8]=5;
        s1[3][9]=11;
        s1[3][10]=3;
        s1[3][11]=14;
        s1[3][12]=10;
        s1[3][13]=0;
        s1[3][14]=6;
        s1[3][15]=13;
        
        /*----------------*/
        
        s2[0][0]=15;
        s2[0][1]=1;
        s2[0][2]=8;
        s2[0][3]=14;
        s2[0][4]=6;
        s2[0][5]=11;
        s2[0][6]=3;
        s2[0][7]=4;
        s2[0][8]=9;
        s2[0][9]=7;
        s2[0][10]=2;
        s2[0][11]=13;
        s2[0][12]=12;
        s2[0][13]=0;
        s2[0][14]=5;
        s2[0][15]=10;
        s2[1][0]=3;
        s2[1][1]=13;
        s2[1][2]=4;
        s2[1][3]=7;
        s2[1][4]=15;
        s2[1][5]=2;
        s2[1][6]=8;
        s2[1][7]=14;
        s2[1][8]=12;
        s2[1][9]=0;
        s2[1][10]=1;
        s2[1][11]=10;
        s2[1][12]=6;
        s2[1][13]=9;
        s2[1][14]=11;
        s2[1][15]=5;
        s2[2][0]=0;
        s2[2][1]=14;
        s2[2][2]=7;
        s2[2][3]=11;
        s2[2][4]=10;
        s2[2][5]=4;
        s2[2][6]=13;
        s2[2][7]=1;
        s2[2][8]=5;
        s2[2][9]=8;
        s2[2][10]=12;
        s2[2][11]=6;
        s2[2][12]=9;
        s2[2][13]=3;
        s2[2][14]=2;
        s2[2][15]=15;
        s2[3][0]=13;
        s2[3][1]=8;
        s2[3][2]=10;
        s2[3][3]=1;
        s2[3][4]=3;
        s2[3][5]=15;
        s2[3][6]=4;
        s2[3][7]=2;
        s2[3][8]=11;
        s2[3][9]=6;
        s2[3][10]=7;
        s2[3][11]=12;
        s2[3][12]=0;
        s2[3][13]=5;
        s2[3][14]=14;
        s2[3][15]=9;
        
        /*----------------*/
        
        s3[0][0]=10;
        s3[0][1]=0;
        s3[0][2]=9;
        s3[0][3]=14;
        s3[0][4]=6;
        s3[0][5]=3;
        s3[0][6]=15;
        s3[0][7]=5;
        s3[0][8]=1;
        s3[0][9]=13;
        s3[0][10]=12;
        s3[0][11]=7;
        s3[0][12]=11;
        s3[0][13]=4;
        s3[0][14]=2;
        s3[0][15]=8;
        s3[1][0]=13;
        s3[1][1]=7;
        s3[1][2]=0;
        s3[1][3]=9;
        s3[1][4]=3;
        s3[1][5]=4;
        s3[1][6]=6;
        s3[1][7]=10;
        s3[1][8]=2;
        s3[1][9]=8;
        s3[1][10]=5;
        s3[1][11]=14;
        s3[1][12]=12;
        s3[1][13]=11;
        s3[1][14]=15;
        s3[1][15]=1;
        s3[2][0]=13;
        s3[2][1]=6;
        s3[2][2]=4;
        s3[2][3]=9;
        s3[2][4]=8;
        s3[2][5]=15;
        s3[2][6]=3;
        s3[2][7]=0;
        s3[2][8]=11;
        s3[2][9]=1;
        s3[2][10]=2;
        s3[2][11]=12;
        s3[2][12]=5;
        s3[2][13]=10;
        s3[2][14]=14;
        s3[2][15]=7;
        s3[3][0]=1;
        s3[3][1]=10;
        s3[3][2]=13;
        s3[3][3]=0;
        s3[3][4]=6;
        s3[3][5]=9;
        s3[3][6]=8;
        s3[3][7]=7;
        s3[3][8]=4;
        s3[3][9]=15;
        s3[3][10]=14;
        s3[3][11]=3;
        s3[3][12]=11;
        s3[3][13]=5;
        s3[3][14]=2;
        s3[3][15]=12;
      
        
        /*----------------*/
       
        s4[0][0]=7;
        s4[0][1]=13;
        s4[0][2]=14;
        s4[0][3]=3;
        s4[0][4]=0;
        s4[0][5]=6;
        s4[0][6]=9;
        s4[0][7]=10;
        s4[0][8]=1;
        s4[0][9]=2;
        s4[0][10]=8;
        s4[0][11]=5;
        s4[0][12]=11;
        s4[0][13]=12;
        s4[0][14]=4;
        s4[0][15]=15;
        s4[1][0]=13;
        s4[1][1]=8;
        s4[1][2]=11;
        s4[1][3]=5;
        s4[1][4]=6;
        s4[1][5]=15;
        s4[1][6]=0;
        s4[1][7]=3;
        s4[1][8]=4;
        s4[1][9]=7;
        s4[1][10]=2;
        s4[1][11]=12;
        s4[1][12]=1;
        s4[1][13]=10;
        s4[1][14]=14;
        s4[1][15]=9;
        s4[2][0]=10;
        s4[2][1]=6;
        s4[2][2]=9;
        s4[2][3]=0;
        s4[2][4]=12;
        s4[2][5]=11;
        s4[2][6]=7;
        s4[2][7]=13;
        s4[2][8]=15;
        s4[2][9]=1;
        s4[2][10]=3;
        s4[2][11]=14;
        s4[2][12]=5;
        s4[2][13]=2;
        s4[2][14]=8;
        s4[2][15]=4;
        s4[3][0]=3;
        s4[3][1]=15;
        s4[3][2]=0;
        s4[3][3]=6;
        s4[3][4]=10;
        s4[3][5]=1;
        s4[3][6]=13;
        s4[3][7]=8;
        s4[3][8]=9;
        s4[3][9]=4;
        s4[3][10]=5;
        s4[3][11]=11;
        s4[3][12]=12;
        s4[3][13]=7;
        s4[3][14]=2;
        s4[3][15]=14;
        
        /*----------------*/

        s5[0][0]=2;
        s5[0][1]=12;
        s5[0][2]=4;
        s5[0][3]=1;
        s5[0][4]=7;
        s5[0][5]=10;
        s5[0][6]=11;
        s5[0][7]=6;
        s5[0][8]=8;
        s5[0][9]=5;
        s5[0][10]=3;
        s5[0][11]=15;
        s5[0][12]=13;
        s5[0][13]=0;
        s5[0][14]=14;
        s5[0][15]=9;
        s5[1][0]=14;
        s5[1][1]=11;
        s5[1][2]=2;
        s5[1][3]=12;
        s5[1][4]=4;
        s5[1][5]=7;
        s5[1][6]=13;
        s5[1][7]=1;
        s5[1][8]=5;
        s5[1][9]=0;
        s5[1][10]=15;
        s5[1][11]=10;
        s5[1][12]=3;
        s5[1][13]=9;
        s5[1][14]=8;
        s5[1][15]=6;
        s5[2][0]=4;
        s5[2][1]=2;
        s5[2][2]=1;
        s5[2][3]=11;
        s5[2][4]=10;
        s5[2][5]=13;
        s5[2][6]=7;
        s5[2][7]=8;
        s5[2][8]=15;
        s5[2][9]=9;
        s5[2][10]=12;
        s5[2][11]=5;
        s5[2][12]=6;
        s5[2][13]=3;
        s5[2][14]=0;
        s5[2][15]=14;
        s5[3][0]=11;
        s5[3][1]=8;
        s5[3][2]=12;
        s5[3][3]=7;
        s5[3][4]=1;
        s5[3][5]=14;
        s5[3][6]=2;
        s5[3][7]=13;
        s5[3][8]=6;
        s5[3][9]=15;
        s5[3][10]=0;
        s5[3][11]=9;
        s5[3][12]=10;
        s5[3][13]=4;
        s5[3][14]=5;
        s5[3][15]=3;
        
        /*----------------*/
        
        s6[0][0]=12;
        s6[0][1]=1;
        s6[0][2]=10;
        s6[0][3]=15;
        s6[0][4]=9;
        s6[0][5]=2;
        s6[0][6]=6;
        s6[0][7]=8;
        s6[0][8]=0;
        s6[0][9]=13;
        s6[0][10]=3;
        s6[0][11]=4;
        s6[0][12]=14;
        s6[0][13]=7;
        s6[0][14]=5;
        s6[0][15]=11;
        s6[1][0]=10;
        s6[1][1]=15;
        s6[1][2]=4;
        s6[1][3]=2;
        s6[1][4]=7;
        s6[1][5]=12;
        s6[1][6]=9;
        s6[1][7]=5;
        s6[1][8]=6;
        s6[1][9]=1;
        s6[1][10]=13;
        s6[1][11]=14;
        s6[1][12]=0;
        s6[1][13]=11;
        s6[1][14]=3;
        s6[1][15]=8;
        s6[2][0]=9;
        s6[2][1]=14;
        s6[2][2]=15;
        s6[2][3]=5;
        s6[2][4]=2;
        s6[2][5]=8;
        s6[2][6]=12;
        s6[2][7]=3;
        s6[2][8]=7;
        s6[2][9]=0;
        s6[2][10]=4;
        s6[2][11]=10;
        s6[2][12]=1;
        s6[2][13]=13;
        s6[2][14]=11;
        s6[2][15]=6;
        s6[3][0]=4;
        s6[3][1]=3;
        s6[3][2]=2;
        s6[3][3]=12;
        s6[3][4]=9;
        s6[3][5]=5;
        s6[3][6]=15;
        s6[3][7]=10;
        s6[3][8]=11;
        s6[3][9]=14;
        s6[3][10]=1;
        s6[3][11]=7;
        s6[3][12]=6;
        s6[3][13]=0;
        s6[3][14]=8;
        s6[3][15]=13;
        
        /*----------------*/
        
        s7[0][0]=4;
        s7[0][1]=11;
        s7[0][2]=2;
        s7[0][3]=14;
        s7[0][4]=15;
        s7[0][5]=0;
        s7[0][6]=8;
        s7[0][7]=13;
        s7[0][8]=3;
        s7[0][9]=12;
        s7[0][10]=9;
        s7[0][11]=7;
        s7[0][12]=5;
        s7[0][13]=10;
        s7[0][14]=6;
        s7[0][15]=1;
        s7[1][0]=13;
        s7[1][1]=0;
        s7[1][2]=11;
        s7[1][3]=7;
        s7[1][4]=4;
        s7[1][5]=9;
        s7[1][6]=1;
        s7[1][7]=10;
        s7[1][8]=14;
        s7[1][9]=3;
        s7[1][10]=5;
        s7[1][11]=12;
        s7[1][12]=2;
        s7[1][13]=15;
        s7[1][14]=8;
        s7[1][15]=6;
        s7[2][0]=1;
        s7[2][1]=4;
        s7[2][2]=11;
        s7[2][3]=13;
        s7[2][4]=12;
        s7[2][5]=3;
        s7[2][6]=7;
        s7[2][7]=14;
        s7[2][8]=10;
        s7[2][9]=15;
        s7[2][10]=6;
        s7[2][11]=8;
        s7[2][12]=0;
        s7[2][13]=5;
        s7[2][14]=9;
        s7[2][15]=2;
        s7[3][0]=6;
        s7[3][1]=11;
        s7[3][2]=13;
        s7[3][3]=8;
        s7[3][4]=1;
        s7[3][5]=4;
        s7[3][6]=10;
        s7[3][7]=7;
        s7[3][8]=9;
        s7[3][9]=5;
        s7[3][10]=0;
        s7[3][11]=15;
        s7[3][12]=14;
        s7[3][13]=2;
        s7[3][14]=3;
        s7[3][15]=12;
      
        /*----------------*/
  
        s8[0][0]=13;
        s8[0][1]=2;
        s8[0][2]=8;
        s8[0][3]=4;
        s8[0][4]=6;
        s8[0][5]=15;
        s8[0][6]=11;
        s8[0][7]=1;
        s8[0][8]=10;
        s8[0][9]=9;
        s8[0][10]=3;
        s8[0][11]=14;
        s8[0][12]=5;
        s8[0][13]=0;
        s8[0][14]=12;
        s8[0][15]=7;
        s8[1][0]=1;
        s8[1][1]=15;
        s8[1][2]=13;
        s8[1][3]=8;
        s8[1][4]=10;
        s8[1][5]=3;
        s8[1][6]=7;
        s8[1][7]=4;
        s8[1][8]=12;
        s8[1][9]=5;
        s8[1][10]=6;
        s8[1][11]=11;
        s8[1][12]=0;
        s8[1][13]=14;
        s8[1][14]=9;
        s8[1][15]=2;
        s8[2][0]=7;
        s8[2][1]=11;
        s8[2][2]=4;
        s8[2][3]=1;
        s8[2][4]=9;
        s8[2][5]=12;
        s8[2][6]=14;
        s8[2][7]=2;
        s8[2][8]=0;
        s8[2][9]=6;
        s8[2][10]=10;
        s8[2][11]=13;
        s8[2][12]=15;
        s8[2][13]=3;
        s8[2][14]=5;
        s8[2][15]=8;
        s8[3][0]=2;
        s8[3][1]=1;
        s8[3][2]=14;
        s8[3][3]=7;
        s8[3][4]=4;
        s8[3][5]=10;
        s8[3][6]=8;
        s8[3][7]=13;
        s8[3][8]=15;
        s8[3][9]=12;
        s8[3][10]=9;
        s8[3][11]=0;
        s8[3][12]=3;
        s8[3][13]=5;
        s8[3][14]=6;
        s8[3][15]=11;       
        
    }
    
    public void Ki(){
        
        int[][] binKey= new int[8][8];
        //Se convierte a binario !
        for(int i=0;i<8;i++){
            int ascii=Key[i];
            for(int j=7;j>=0;j--){
                binKey[i][j]=ascii%2;
                ascii=ascii/2;
                
            }
        }
        
       
        
        
        
        
        int i=7;
        int j=0;
        //Se crean C0 y D0 para dividir la tabla
        int[] C0=new int[28];
        int[] D0=new int[28];
        for(int k=0;k<28;k++){
            //Se toman las primeras 4 filas de 7 bits y se ponen en el arreglo c0 para poder hacer los desplazamientos
            C0[k]=binKey[i][j];
            i--;
            if(i<0){
                i=7;
                j++;
            }  
            
        }
        
        //Se toman las filas 4-8 para hacer el arreglo D0!
        i=7;
        j=6;
        for(int k=0;k<24;k++){
            D0[k]=binKey[i][j];
            i--;
            if(i<0){
                i=7;
                j--;
            }  
            
        }
        
        i=3;
        j=3;
        for(int k=24;k<28;k++){
          D0[k]=binKey[i][j];
          i--;
            
        }
        //Concatenar C0 y D0 para formar la permuta PC1
        int[][] PC1 =new int[8][7];
            int k=0;
            for(i=0;i<4;i++){
                for(j=0;j<7;j++){
                    PC1[i][j]=C0[k];
                    k++;
                }
            }
            k=0;
            for(i=4;i<8;i++){
                for(j=0;j<7;j++){
                    PC1[i][j]=D0[k];
                    k++;
                }
            }
        
        
        //Creo un arreglo de desplazamientos con los numeros de desplazamientos por cada vuelta
        int[] desp ={1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1};
        int[][] Ci= new int[16][28];
        int[][] Di= new int[16][28];
        int burC;
        int burD;
        for(i=0;i<16;i++){
            if(desp[i]==1){
                burC=C0[0];
                burD=D0[0];
                Ci[i][27]=burC;
                Di[i][27]=burD;
                for(k=27;k>0;k--){
                    Ci[i][k-1]=C0[k];
                    Di[i][k-1]=D0[k];
                }
            }else{
                burC=C0[0];
                burD=D0[0];
                Ci[i][26]=burC;
                Di[i][26]=burD;
                burC=C0[1];
                burD=D0[1];
                Ci[i][27]=burC;
                Di[i][27]=burD;
                for(k=27;k>1;k--){
                    Ci[i][k-2]=C0[k];
                    Di[i][k-2]=D0[k];
                    
                }

            }
            C0=Ci[i];
            D0=Di[i];
        }
       
        
        int[][] tabla= new int[8][7];
        
        
        for(i=0;i<16;i++){
            
            int c=0;
            j=0;
            for(k=0;k<28;k++){
               if(k%7==0 && k>0){
                    c++;
                    j=0;
                }
                tabla[c][j]=Ci[i][k];
                j++;
                 
            }
            
            j=0;
            c=4;
            for(k=0;k<28;k++){
               if(k%7==0 && k>0){
                    c++;
                    j=0;
                }
                tabla[c][j]=Di[i][k];
                j++;
                 
            }
            
           
            
            
            int[][] pc2= new int[8][6];
            pc2[0][0]=tabla[1][6];
            pc2[0][1]=tabla[2][2];
            pc2[0][2]=tabla[1][3];
            pc2[0][3]=tabla[3][2];
            pc2[0][4]=tabla[0][0];
            pc2[0][5]=tabla[0][4];
            pc2[1][0]=tabla[0][2];
            pc2[1][1]=tabla[3][6];
            pc2[1][2]=tabla[2][0];
            pc2[1][3]=tabla[0][5];
            pc2[1][4]=tabla[2][6];
            pc2[1][5]=tabla[1][2];
            pc2[2][0]=tabla[3][1];
            pc2[2][1]=tabla[2][4];
            pc2[2][2]=tabla[1][4];
            pc2[2][3]=tabla[0][3];
            pc2[2][4]=tabla[3][4];
            pc2[2][5]=tabla[1][0];
            pc2[3][0]=tabla[2][1];
            pc2[3][1]=tabla[0][6];
            pc2[3][2]=tabla[3][5];
            pc2[3][3]=tabla[2][5];
            pc2[3][4]=tabla[1][5];
            pc2[3][5]=tabla[0][1];
            pc2[4][0]=tabla[5][5];
            pc2[4][1]=tabla[7][2];
            pc2[4][2]=tabla[4][2];
            pc2[4][3]=tabla[5][1];
            pc2[4][4]=tabla[6][4];
            pc2[4][5]=tabla[7][5];
            pc2[5][0]=tabla[4][1];
            pc2[5][1]=tabla[5][4];
            pc2[5][2]=tabla[7][1];
            pc2[5][3]=tabla[6][2];
            pc2[5][4]=tabla[4][4];
            pc2[5][5]=tabla[6][5];
            pc2[6][0]=tabla[6][1];
            pc2[6][1]=tabla[6][6];
            pc2[6][2]=tabla[5][3];
            pc2[6][3]=tabla[7][6];
            pc2[6][4]=tabla[4][5];
            pc2[6][5]=tabla[7][3];
            pc2[7][0]=tabla[6][3];
            pc2[7][1]=tabla[5][6];
            pc2[7][2]=tabla[7][0];
            pc2[7][3]=tabla[5][0];
            pc2[7][4]=tabla[4][0];
            pc2[7][5]=tabla[4][3];
            
            
            c=0;
            j=0;
            for(k=0;k<48;k++){
                
                Ki[i][k]=pc2[c][j];
                j++;
                if(j%6==0){
                    c++;
                    j=0;
                }
            }
            
        }
        
        
        int[][] Llaves= new int[16][48];
        for(int voltear=0;voltear<16;voltear++){
            Llaves[15-voltear]=Ki[voltear];
        }
        
       
        
        Ki=Llaves;
        
        
        
        
    }
    
    public int[][] PermutaE(int[][] R){
        
        int[][] E= new int[8][6];
        
        for(int i=0;i<8;i++){
            for(int j=0;j<4;j++){
                E[i][(j+1)]=R[i][j];
            }
        }
        E[0][0]=R[7][3];
        int k=3;
        int fil=1;
        int col=0;
        for(int i=0;i<7;i++){
            E[fil][col]=R[i][k];
            fil++;
        }
        
        E[7][5]=R[0][0];
        k=0;
        fil=0;
        col=5;
        for(int i=1;i<8;i++){
            E[fil][col]=R[i][k];
            fil++;
        }
        
        
        return E;
        
    }
    
    public int[][] SumaXOR(int[][] E,int vuelta){
        int k=0;
        
        int[][] OR= new int[8][6];
        for(int i=0;i<8;i++){
            for(int j=0;j<6;j++){
                OR[i][j]=E[i][j]+Ki[vuelta][k];
                k++;
                if(OR[i][j]!=1){
                    OR[i][j]=0;
                }
        
            }
        
        }
        return OR;
    }
    
    public int[][] SustitucionCajas(int [][] XOR){
        int[][] sust= new int[8][4];
        int[] cajas= new int[8];
        for(int i=0;i<8;i++){
            int col=0;
            int fil=0;
            fil= XOR[i][0]*2+XOR[i][5]*1;
            col=XOR[i][4]*1+XOR[i][3]*2+XOR[i][2]*4+XOR[i][1]*8;
            switch(i){
                case 0:
                    cajas[i]=s1[fil][col];
                    
                break;
                case 1:
                    cajas[i]=s2[fil][col];
                    
                break;
                case 2:
                    cajas[i]=s3[fil][col];
                    
                break;
                case 3:
                    cajas[i]=s4[fil][col];
                break;
                case 4:
                    cajas[i]=s5[fil][col];
                    
                break;
                case 5:
                    cajas[i]=s6[fil][col];
                    
                break;
                case 6:
                    cajas[i]=s7[fil][col];
                    
                break;
                case 7:
                    
                    cajas[i]=s8[fil][col];
                break;
                    
            }
        }
        for(int i=0;i<8;i++){
                for(int j=3;j>=0;j--){
                    sust[i][j]=cajas[i]%2;
                    cajas[i]=cajas[i]/2;
                }
            }
         
        
         sust=PermutaP(sust);
         return sust;
    }
   
    public int[][] PermutaP(int[][] sust){
        int i,j;    
        int[][] t= sust;
        
        
        /*----------------*/
        int[][] p= new int[8][4];
        p[0][0]=t[3][3];
        p[0][1]=t[1][2];
        p[0][2]=t[4][3];
        p[0][3]=t[5][0];
        p[1][0]=t[7][0];
        p[1][1]=t[2][3];
        p[1][2]=t[6][3];
        p[1][3]=t[4][0];
        p[2][0]=t[0][0];
        p[2][1]=t[3][2];
        p[2][2]=t[5][2];
        p[2][3]=t[6][1];
        p[3][0]=t[1][0];
        p[3][1]=t[4][1];
        p[3][2]=t[7][2];
        p[3][3]=t[2][1];
        p[4][0]=t[0][1];
        p[4][1]=t[1][3];
        p[4][2]=t[5][3];
        p[4][3]=t[3][1];
        p[5][0]=t[7][3];
        p[5][1]=t[6][2];
        p[5][2]=t[0][2];
        p[5][3]=t[2][0];
        p[6][0]=t[4][2];
        p[6][1]=t[3][0];
        p[6][2]=t[7][1];
        p[6][3]=t[1][1];
        p[7][0]=t[5][1];
        p[7][1]=t[2][2];
        p[7][2]=t[0][3];
        p[7][3]=t[6][0];
        i=0;
        j=0;
      
        return p;
    }
    
    public String descifra(){
        
        String[] Mensajex8= new String[(Cifrado.length()/8)];
        for(int i=0;i<Mensajex8.length;i++){
            Mensajex8[i]=Cifrado.substring(i*8,((i+1)*(7+1)));
        }
        
        for(int i=0;i<Mensajex8.length;i++){
            
            //Cifrado de mensaje
            
            
            char[] CarMensaje=Mensajex8[i].toCharArray();


            int[][] binMensaje=new int[8][8];
            for(int j=0;j<8;j++){
                int ascii=(int)CarMensaje[j];

                for(int k=7;k>=0;k--){
                    binMensaje[j][k]=ascii%2;
                    ascii=ascii/2;
                   
                }

            }
            
         
            int[][] P1 = new int[8][8];
            int fil=7;
            int col=1;
            for(int j=0;j<4;j++){
                fil=7;
                for(int k=0;k<8;k++){
                    P1[j][k]=binMensaje[fil][col];
                    fil--;
                }
                col+=2;
            }
            col=0;
            for(int j=4;j<8;j++){
                fil=7;
                for(int k=0;k<8;k++){
                    P1[j][k]=binMensaje[fil][col];
                    fil--;
                }
                col+=2;
            }
            
            int[][] R0= new int[8][4];
            int[][] L0= new int[8][4];
            
            col=0;
            fil=0;
            for(int j=0;j<8;j++){
                
                if(j==4){
                    col=-1;
                }
                for(int k=0;k<8;k++){
                    
                    if(fil%4==0 && fil!=0){
                        fil=0;
                        col++;
                    }
                    

                    
                    if(j<4){
                        L0[col][fil]=P1[j][k];
                    }else{
                        
                        R0[col][fil]=P1[j][k];
                    }
                    fil++;
                }
                
            }
            
        
            
            int[][] E= PermutaE(R0);
          
            
            int[][] XOR= SumaXOR(E,0);
            int[][] funcion= SustitucionCajas(XOR);
            int[][] LXORF= new int[8][4];
            
            
            for(int j=0;j<8;j++){
                for(int k=0;k<4;k++){
                    LXORF[j][k]=L0[j][k]+funcion[j][k];
                    if(LXORF[j][k]!=1){
                        LXORF[j][k]=0;
                    }
            
                }
            
            }
            
            
            int[][][] Ri=new int[17][8][4];
            int[][][] Li=new int[17][8][4];
            
            Ri[1]=LXORF;
            Li[1]=R0;
            
            for(int j=1;j<16;j++){
                
                
                E=PermutaE(Ri[j]);
                XOR=SumaXOR(E,j);
                funcion=SustitucionCajas(XOR);
                
                
                for(int k=0;k<8;k++){
                    for(int l=0;l<4;l++){
                        Ri[j+1][k][l]=Li[j][k][l]+funcion[k][l];
                        if(Ri[j+1][k][l]!=1){
                            Ri[j+1][k][l]=0;
                        }
                
                    }
                
                }
                Li[j+1]=Ri[j];
               
            }
            
            int[] numeros= new int[64];
            int num=0;
            for(int j=0;j<8;j++){
                for(int k=0;k<4;k++){
                    numeros[num]=Ri[16][j][k];
                    num++;
                }
            }
            
            for(int j=0;j<8;j++){
                for(int k=0;k<4;k++){
                    numeros[num]=Li[16][j][k];
                    num++;
                }
            }
            
            num=0;
            
           
            int[][] tablaFinal= new int[8][8];
            for(int j=0;j<8;j++){
                for(int k=0;k<8;k++){
                    tablaFinal[j][k]=numeros[num];
                    num++;
           
                }
           
            }
            
            int[][] P2= new int[8][8];
            
            col=1;
            fil=7;
            for(int j=0;j<64;j++){
                
                P2[fil][col]=numeros[j];
                fil--;
                if(fil<0){
                    col+=2;
                    fil=7;
                }
                if(col>7){
                    col=0;
                }
            }
            
            for(int j=0;j<8;j++){
                for(int k=0;k<8;k++){
            
                }
            
            }
            
            
            char caracter=0;
            String cifrado=new String();
            int ascii=0;
            for(int l=0;l<8;l++){
                int k=0;
                ascii=0;
                for(int j=7;j>=0;j--){
                    ascii+=(P2[l][k]*(Math.pow(2,j)));
                    k++;
                }
                caracter=(char)ascii;
                this.Mensaje+=String.valueOf(caracter);
            }
            
         
        }       
        Mensaje=Mensaje.trim();
        
        return Mensaje;
    }
    
    
    public String desencriptar(String dato){
        char[] datos= dato.toCharArray();
        String llaves= new String();
        for(int i=(dato.length()-1);i>=0;i--){
            if(datos[i]=='.'){
                for(int j=(i+1);j<dato.length();j++){
                    llaves+=datos[j];
                }
                i=-1;
            }
        }
        
        for(int i=(dato.length()-1);i>=0;i--){
            if(datos[i]=='.'){
                for(int j=0;j<i;j++){
                    Cifrado+=datos[j];
                }
                i=-1;
            }
        }
        for(int i=0;i<llaves.length();i++){
            char carKey=llaves.charAt(i);
            Key[i]=(int)carKey;
        }
        int ascii=0;
        String bitsx8=new String();
        String mensajeCifrado=new String();
        for(int i=0;i<Cifrado.length();i++){
            bitsx8+=String.valueOf(Cifrado.charAt(i));
            if((i+1)%8==0 && i!=0){
                ascii=0;
                for(int j=0;j<8;j++){
                    ascii+=(int)(Integer.parseInt(String.valueOf(bitsx8.charAt(Math.abs(j-7))))*Math.pow(2,j));
                }
                char caracter=(char) ascii;
                mensajeCifrado+=String.valueOf(caracter);
                bitsx8="";
            }
            
        }
        
        Cifrado=mensajeCifrado;
        Ki();
        Cajas();
        return descifra();
    }
}

