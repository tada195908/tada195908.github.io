package utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author tadaki
 */
public class Utils {

    /**
     * リストの作成
     *
     * @param <T> リストの要素のクラス
     * @return
     */
    public static <T> List<T> createList() {
        List<T> points = Collections.synchronizedList(
                new ArrayList<T>());
        return points;
    }

    /**
     * 整数のでたらめなリスト作成
     *
     * @param max リスト要素の最大値-1
     * @return
     */
    public static int[] createRandomNumberList(int max) {
        //入力リスト生成
        List<Integer> inputList = createList();
        for (int i = 0; i < max; i++) {
            inputList.add(i);
        }
        //出力リスト
        List<Integer> list = createList();
        while (inputList.size() > 0) {
            int k = (int) (inputList.size() * Math.random());
            Integer kk = inputList.remove(k);
            list.add(kk);
        }
        //出力リストの配列化
        int out[] = new int[max];
        for (int i = 0; i < max; i++) {
            out[i] = list.get(i);
        }
        return out;
    }
}
