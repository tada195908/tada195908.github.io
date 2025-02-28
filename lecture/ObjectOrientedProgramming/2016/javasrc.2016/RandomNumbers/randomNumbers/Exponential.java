package randomNumbers;

/**
 * 指数分布 (1/a)exp(-ax)
 *
 * @author tadaki
 */
public class Exponential extends Transform {

    public Exponential(double a) {
        super(x -> {
            return -Math.log(1 - x) / a;
        });
    }

    public Exponential(double a, long seed) {
        super(x -> {
            return -Math.log(1 - x) / a;
        }, seed);
    }

}
