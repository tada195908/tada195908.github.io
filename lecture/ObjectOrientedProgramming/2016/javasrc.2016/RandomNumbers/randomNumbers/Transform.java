package randomNumbers;

import java.util.function.Function;

/**
 *
 * @author tadaki
 */
public class Transform extends MyRandom {

    //確率分布の逆関数
    private final Function<Double, Double> invProDist;

    /**
     * コンストラクタ
     *
     * @param invProDist 確率分布の逆関数
     */
    public Transform(Function<Double, Double> invProDist) {
        super();
        this.invProDist = invProDist;
    }

    public Transform(Function<Double, Double> invProDist, long seed) {
        super(seed);
        this.invProDist = invProDist;
    }

    @Override
    public double next() {
        double x = random.nextDouble();
        return invProDist.apply(x);
    }

}
