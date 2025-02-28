package randomNumbers;

/**
 * Gaussian (1/sqrt(2pi sigma^2))exp(-(x-mu)^2/(2sigma^2))
 *
 * @author tadaki
 */
public class Gaussian extends MyRandom {

    private final double mu;
    private final double sigma;

    public Gaussian(double mu, double sigma) {
        super();
        this.mu = mu;
        this.sigma = sigma;
    }

    public Gaussian(double mu, double sigma, long seed) {
        super(seed);
        this.mu = mu;
        this.sigma = sigma;
    }

    @Override
    public double next() {
        double x = random.nextDouble();
        double y = random.nextDouble();
        double r = Math.sqrt(-2 * sigma * sigma * Math.log(1. - x));
        double t = 2 * Math.PI * y;
        return r * Math.sin(t);
    }

}
