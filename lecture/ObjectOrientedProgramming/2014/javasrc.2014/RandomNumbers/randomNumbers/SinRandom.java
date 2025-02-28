package randomNumbers;

/**
 * trigonometric (pi/2)sin(pi x)
 * @author tadaki
 */
public class SinRandom extends MyRandom {

    public SinRandom() {
        super();
    }

    public SinRandom(long seed) {
        super(seed);
    }

    @Override
    public double next() {
        while (true) {
            double x = random.nextDouble();
            double z = (Math.PI / 2) * Math.sin(Math.PI * x);
            if (z<random.nextDouble()) {
                return x;
            }
        }
    }

}
