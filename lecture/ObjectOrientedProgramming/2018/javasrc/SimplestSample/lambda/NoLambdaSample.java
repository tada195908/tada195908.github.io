package lambda;

import java.util.Arrays;
import java.util.List;

/**
 * 二乗和を計算する
 *
 * @author tadaki
 */
public class NoLambdaSample {

    static public Double eval(List<Double> list) {
        double result = 0;
        for (Double d : list) {//計算内容を直接記述
            result += d * d;
        }
        return result;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        List<Double> list = Arrays.asList(new Double[]{0.1, 0.2, 0.8, 0.9});
        double result = NoLambdaSample.eval(list);
        System.out.println(result);
    }

}
