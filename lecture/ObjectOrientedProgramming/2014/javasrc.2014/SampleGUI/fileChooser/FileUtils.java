package fileChooser;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

/**
 *
 * @author tadaki
 */
public class FileUtils {

    /**
     * このクラスのインスタンスは作らない
     */
    private FileUtils() {
    }

    // ファイルの読み出し
    static BufferedReader openReader(File file) 
            throws FileNotFoundException {
        //読み出し開始
        BufferedReader reader = new BufferedReader(
                new InputStreamReader(new FileInputStream(file)));
        return reader;
    }

    static String readFromReader(BufferedReader in) 
            throws IOException {
        String nl = 
                System.getProperty("line.separator");//改行コード
        StringBuilder buf = new StringBuilder();
        String line;
        while ((line = in.readLine()) != null) {
            buf.append(line);
            buf.append(nl);//改行
        }
        in.close();
        return buf.toString();
    }

    //ファイルへの書き出し
    static BufferedWriter openWriter(File file) 
            throws FileNotFoundException {
        BufferedWriter out = new BufferedWriter(
                new OutputStreamWriter(
                        new FileOutputStream(file)));
        return out;
    }

    /**
     * ファイル名中の拡張子を調べる
     *
     * @param filename
     * @return 拡張子の文字列
     */
    static public String getExtention(String filename) {
        String ext = null;
        int index = filename.lastIndexOf(".");
        if (index > 0) {
            ext = filename.substring(index + 1);
            if (ext.length() < 1) {
                ext = null;
            }
        }
        return ext;
    }
}
