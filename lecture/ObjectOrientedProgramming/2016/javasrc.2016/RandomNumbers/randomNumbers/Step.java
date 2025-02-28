package randomNumbers;

/**
 * 階段型の乱数を生成する:棄却法
 *
 * f(x) = 1/(a+b(1-a)) if 0<=x<a
 *
 * b/(a+b(1-a)) if a<x<1
 *
 * @author tadaki
 */
public class Step extends Rejection {

    public Step(double a, double b) {
        super(x -> {
            if (x < a) {
                return 1 / (a + b * (1 - a));
            }
            return b / (a + b * (1 - a));
        },
                0., 1., b / (a + b * (1 - a))
        );
    }

    public Step(double a, double b, long seed) {
        super(x -> {
            if (x < a) {
                return 1 / (a + b * (1 - a));
            }
            return b / (a + b * (1 - a));
        },
                0., 1., b / (a + b * (1 - a)), seed);
    }

}
