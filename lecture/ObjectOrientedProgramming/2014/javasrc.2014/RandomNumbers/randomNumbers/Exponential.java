package randomNumbers;

/**
 * 指数分布 (1/a)exp(-ax)
 * @author tadaki
 */
public class Exponential extends MyRandom{
    private final double a;

    public Exponential(double a) {
        super();
        this.a = a;
    }

    public Exponential(double a,long seed) {
        super(seed);
        this.a = a;
    }

    @Override
    public double next() {
        double y = random.nextDouble();
        return -Math.log(1.-y)/a;
    }
    
}
