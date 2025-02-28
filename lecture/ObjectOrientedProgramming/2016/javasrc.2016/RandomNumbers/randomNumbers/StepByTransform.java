package randomNumbers;

/**
 * 階段型の乱数を生成する:変換法
 *
 * f(x) = 1/(a+b(1-a)) if 0<=x<a
 *
 * b/(a+b(1-a)) if a<x<1
 *
 * @author tadaki
 */
public class StepByTransform extends Transform {

    public StepByTransform(double a, double b) {
        super(x -> {
            if (x < a / (a + b * (1 - a))) {
                return (a + b * (1 - a)) * x;
            }
            return ((a + b * (1 - a)) * x - a + a * b) / b;
        }
        );
    }

    public StepByTransform(double a, double b, long seed) {
        super(x -> {
            if (x < a / (a + b * (1 - a))) {
                return (a + b * (1 - a)) * x;
            }
            return ((a + b * (1 - a)) * x - a + a * b) / b;
        },
                seed);
    }

}
