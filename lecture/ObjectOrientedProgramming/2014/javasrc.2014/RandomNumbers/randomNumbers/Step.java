package randomNumbers;

/**
 * f(x) = 1/(a+b(1-a)) if 0<=x<a 
 *        b/(a+b(1-a)) if a<x<1
 *
 * @author tadaki
 */
public class Step extends MyRandom {

    private final double a;
    private final double b;
    private final double max;

    public Step(double a, double b) {
        super();
        this.a = a;
        this.b = b;
        max = function(1.);
    }

    public Step(double a, double b, long seed) {
        super(seed);
        this.a = a;
        this.b = b;
        max = function(1.);
    }

    @Override
    public double next() {
        while (true) {
            double x = random.nextDouble();
            if (function(x) / max > random.nextDouble()) {
                return x;
            }
        }
    }

    private double function(double x) {
        double z = a + b * (1 - a);
        if (x < a) {
            return 1 / z;
        }
        return b / z;
    }
}
