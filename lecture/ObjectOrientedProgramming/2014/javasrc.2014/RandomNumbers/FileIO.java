

import java.io.*;

/**
 *
 * @author tadaki
 */
public class FileIO {

    public static BufferedWriter openWriter(String outFileName) 
            throws IOException {
        BufferedWriter writer
                = new BufferedWriter(new OutputStreamWriter(System.out));

        if (outFileName != null && !outFileName.isEmpty()) {
            File outFile = new File(outFileName);
            if (!outFile.exists()) {
                outFile.createNewFile();
            }
            writer = new BufferedWriter(
                    new OutputStreamWriter(new FileOutputStream(outFile)));
        }
        return writer;
    }
}
