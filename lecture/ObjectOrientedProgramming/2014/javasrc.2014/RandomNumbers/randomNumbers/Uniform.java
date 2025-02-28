package randomNumbers;

/**
 * 一様乱数 x in [min,max)
 *
 * @author tadaki
 */
public class Uniform extends MyRandom {

    private final double min;
    private final double max;

    public Uniform(double min, double max) {
        super();
        this.min = min;
        this.max = max;
    }

    public Uniform(double min, double max, long seed) {
        super(seed);
        this.min = min;
        this.max = max;
    }

    @Override
    public double next() {
        return (max - min) * random.nextDouble() + min;
    }

}
