package utils;

import java.awt.geom.Point2D;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.List;

/**
 *
 * @author tadaki
 */
public class FileIO {

    /**
     * 標準出力へのデータ出力
     *
     * @param points データ
     * @throws IOException
     */
    public static void printPointsList(List<Point2D.Double> points)
            throws IOException {
        printPointsList(points, System.out);
    }

    /**
     * ストリームへのデータ出力
     *
     * @param points データ
     * @param oStream 出力先
     * @throws IOException
     */
    public static void printPointsList(List<Point2D.Double> points,
            OutputStream oStream) throws IOException {
        BufferedWriter out = new BufferedWriter(
                new OutputStreamWriter(oStream));
        printPointsList(points, out);
    }

    /**
     * BufferedWriterへのデータ出力
     *
     * @param points データ
     * @param out 出力先
     * @throws IOException
     */
    public static void printPointsList(List<Point2D.Double> points,
            BufferedWriter out) throws IOException {
        for (int i = 0; i < points.size(); i++) {
            Point2D.Double p = points.get(i);
            StringBuilder b = new StringBuilder();
            b.append(p.x).append(" ").append(p.y);
            out.write(b.toString());
            out.newLine();
        }
        out.flush();
    }

    /**
     * 標準出力へのコメント出力
     *
     * @param comments コメント
     * @throws IOException
     */
    public static void printComments(String comments[]) throws IOException {
        printComments(comments, System.out);
    }

    /**
     * ストリームへのコメント出力
     *
     * @param comments コメント
     * @param oStream 出力先
     * @throws IOException
     */
    public static void printComments(String comments[], OutputStream oStream)
            throws IOException {
        BufferedWriter out = new BufferedWriter(
                new OutputStreamWriter(oStream));
        printComments(comments, out);
    }

    /**
     * BufferedWriterへのコメント出力
     *
     * @param comments コメント
     * @param out 出力先
     * @throws IOException
     */
    public static void printComments(String comments[], BufferedWriter out)
            throws IOException {
        for (int i = 0; i < comments.length; i++) {
            StringBuilder b = new StringBuilder();
            b.append("#").append(comments[i]);
            out.write(b.toString());
            out.newLine();
        }
        out.flush();
    }
}
