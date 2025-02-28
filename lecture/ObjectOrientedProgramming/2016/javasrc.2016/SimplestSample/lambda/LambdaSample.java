package lambda;

import java.awt.geom.Point2D;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.function.BinaryOperator;

/**
 *
 * @author tadaki
 */
public class LambdaSample {

    static public double eval(
            List<Double> list, BinaryOperator<Double> op) {
        double result = 0;
        for (Double d : list) {//計算内容を直接記述
            result = op.apply(result, d);
        }
        return result;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        List<Double> list = Arrays.asList(new Double[]{0.1, 0.2, 0.8, 0.9});
        double result = LambdaSample.eval(list,
                (x, y) -> {
                    return x + y * y;
                });
        System.out.println(result);
    }

}
