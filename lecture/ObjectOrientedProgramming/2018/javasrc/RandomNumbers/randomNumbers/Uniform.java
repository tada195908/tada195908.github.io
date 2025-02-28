package randomNumbers;

/**
 * 一様乱数 x in [min,max)
 *
 * @author tadaki
 */
public class Uniform extends Transform {

    /**
     * 区間を指定して、一様乱数を生成する
     *
     * @param min
     * @param max
     */
    public Uniform(double min, double max) {
        super(x -> {
            return min + (max - min) * x;
        });
    }

    public Uniform(double min, double max, long seed) {
        super(x -> {
            return min + (max - min) * x;
        }, seed);
    }

}
