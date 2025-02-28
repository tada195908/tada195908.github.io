package standardIO;

import java.io.IOException;

/**
 *
 * @author tadaki
 */
public class IOMain {
    String src=null;
    public void getData(){
        StringBuilder b=new StringBuilder();
        int c;
        try {
            while ((c = System.in.read()) != -1) {
                b.append((char)c);
            }
        } catch (IOException ex) {
            System.err.println(ex);
        }
        src = b.toString();
    }
    
    public void printData(){
        System.out.println(src);
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        IOMain ioMain=new IOMain();
        ioMain.getData();
        ioMain.printData();
    }

}
