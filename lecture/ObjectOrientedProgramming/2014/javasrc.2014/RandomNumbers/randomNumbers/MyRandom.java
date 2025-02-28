package randomNumbers;

import java.util.Random;

/**
 *
 * @author tadaki
 */
abstract public class MyRandom {

    protected Random random;

    public MyRandom() {
        random = new Random();
    }

    public MyRandom(long seed) {
        random = new Random(seed);
    }

    public double[] getRandomNumbers(int n) {
        double r[] = new double[n];
        for (int i = 0; i < n; i++) {
            r[i] = next();
        }
        return r;
    }

    abstract public double next();
}
