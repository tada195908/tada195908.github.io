package histogram;

import java.awt.geom.Point2D;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * ヒストグラム
 *
 * @author tadaki
 */
public class Histogram {

    final private double min;
    final private double bin;
    final private int nBin;
    private int hist[];
    private int n;//Number of samples

    /**
     * コンストラクタ
     *
     * @param min 区間下限
     * @param max 区間上限：変更の可能性あり
     * @param bin 区間幅
     */
    public Histogram(double min, double max, double bin)
            throws IllegalArgumentException {
        if (max < min) {
            String msg = "max must be larger than min";
            throw new java.lang.IllegalArgumentException(msg);
        }
        if (bin <= 0.) {
            String msg = "bin size must be larger than zero";
            throw new java.lang.IllegalArgumentException(msg);
        }
        this.min = min;
        this.bin = bin;
        int nn = (int) ((max - min) / bin);
        if (nn * bin + min > max) {
            nn++;
        }
        nBin = nn;
        initializeHist();
    }

    /**
     * ヒストグラム取得
     *
     * @return
     */
    public int[] getHist() {
        return hist;
    }

    /**
     * ヒストグラム取得 (区間中央値,高さ)
     *
     * @return
     */
    public List<Point2D.Double> getHistData() {
        List<Point2D.Double> list
                = Collections.synchronizedList(
                        new ArrayList<Point2D.Double>());
        for (int i = 0; i < hist.length; i++) {
            double x = min + i * bin + bin / 2.;
            list.add(new Point2D.Double(x, (double) hist[i] / n / bin));
        }
        return list;
    }

    /**
     * データ設定
     *
     * @param d
     */
    public void put(double d) {
        int k = (int) ((d - min) / bin);
        if (k >= 0 && k < hist.length) {
            hist[k]++;
        }
        n++;
    }

    private void initializeHist() {
        hist = new int[nBin];
        n = 0;
    }

}
