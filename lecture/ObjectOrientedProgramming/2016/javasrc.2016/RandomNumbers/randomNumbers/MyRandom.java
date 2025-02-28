package randomNumbers;

import java.util.Random;

/**
 * 乱数生成の抽象クラス
 *
 * @author tadaki
 */
abstract public class MyRandom {

    protected Random random;

    /**
     * コンストラクタ
     */
    public MyRandom() {
        random = new Random();
    }

    /**
     * シード指定のコンストラクタ
     *
     * @param seed
     */
    public MyRandom(long seed) {
        random = new Random(seed);
    }

    /**
     * 指定した個数の乱数を生成し、配列として返す
     *
     * @param n
     * @return
     */
    public double[] getRandomNumbers(int n) {
        double r[] = new double[n];
        for (int i = 0; i < n; i++) {
            r[i] = next();
        }
        return r;
    }

    abstract public double next();
}
