package FileIO;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tadaki
 */
public class FileIOMain {

    private File inFile;
    private File outFile;
    private final String nl = System.getProperty("line.separator");

    public FileIOMain() throws FileNotFoundException {
        inFile = new File("input.txt");
        if (!inFile.isFile() || !inFile.canRead()) {
            String message = "入力ファイル"
                    + inFile.getAbsolutePath() + "がありません。";
            throw new java.io.FileNotFoundException(message);
        }
        outFile = new File("output.txt");
        if (!outFile.canWrite()) {
            String message = "出力ファイル"
                    + outFile.getAbsolutePath() + "には書けません。";
            throw new java.io.FileNotFoundException(message);
        }
    }

    public int getData() {
        int n = 0;
        if (!outFile.exists()) {
            try {
                outFile.createNewFile();
            } catch (IOException ex) {
                Logger.getLogger(
                        FileIOMain.class.getName()).log(
                        Level.SEVERE, null, ex);
                return n;
            }
        }
        BufferedReader in;
        try {
            in = new BufferedReader(new InputStreamReader(
                    new FileInputStream(inFile)));
        } catch (FileNotFoundException ex) {
            Logger.getLogger(
                    FileIOMain.class.getName()).log(
                    Level.SEVERE, null, ex);
            return n;
        }
        try {
            n = outData(in);
        } catch (IOException ex) {
            Logger.getLogger(
                    FileIOMain.class.getName()).log(Level.SEVERE, null, ex);
            n = 0;
        }
        return n;
    }

    private int outData(BufferedReader in) throws IOException {
        BufferedWriter out;
        int n = 0;
        out = new BufferedWriter(
                new OutputStreamWriter(
                new FileOutputStream(outFile)));
        String line;
        while ((line = in.readLine()) != null) {
            n++;
            out.write(line);
            out.write(nl);
        }
        in.close();
        out.close();
        return n;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        FileIOMain main = null;
        try {
            main = new FileIOMain();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(
                    FileIOMain.class.getName()).log(
                    Level.SEVERE, null, ex);
        }
        if (main != null) {
            int n = main.getData();
            System.out.println(n);
        }

    }
}
