package randomNumbers;

import java.util.function.Function;

/**
 *
 * @author tadaki
 */
public class Rejection extends MyRandom {

    private final Function<Double, Double> probDensity;//確率密度関数
    private final double a;//乱数生成の下限
    private final double b;//乱数生成の上限
    private final double m;//確率密度関数の最大値

    /**
     * コンストラクタ
     *
     * @param probDensity 確率密度関数
     * @param a 乱数生成の下限
     * @param b 乱数生成の上限
     * @param m 確率密度関数の最大値
     */
    public Rejection(Function<Double, Double> probDensity, double a, double b, double m) {
        super();
        this.probDensity = probDensity;
        this.a = a;
        this.b = b;
        this.m = m;
    }

    public Rejection(Function<Double, Double> probDensity, double a, double b, double m, long seed) {
        super(seed);
        this.probDensity = probDensity;
        this.a = a;
        this.b = b;
        this.m = m;
    }

    @Override
    public double next() {
        boolean done = false;
        double x = 0.;
        while (!done) {
            double xx = random.nextDouble();
            double y = random.nextDouble();
            x = (b - a) * xx + a;
            done = (y < probDensity.apply(x) / m);
        }
        return x;
    }

}
