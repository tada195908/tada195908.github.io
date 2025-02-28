package listExample;

import firstSample.EntryNew;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author tadaki
 */
public class ListExample {

    private final List<EntryNew> list;
    private double average;
    private double sigma;
    private final String nl = System.getProperty("line.separator");

    /**
     * コンストラクタ
     *
     * @param data
     */
    public ListExample(EntryNew data[]) {
        list = Collections.synchronizedList(new ArrayList<>());
        list.addAll(Arrays.asList(data));
    }

    /**
     * 統計の実行
     */
    public void statics() {
        int n = list.size();
        int a = list.stream().map(//リストの要素からscoreへの変換
                (entry) -> entry.getScore()
        ).reduce(//要素から一つの値への変換
                0, (accumulator, v) -> accumulator + v);
        //平均
        average = (double) a / n;
        int b = list.stream().map(
                (entry) -> entry.getScore()
        ).reduce(
                0, (accumulator, v) -> accumulator + v * v);
        //標準偏差
        sigma = Math.sqrt((double) b / n - average * average);
    }

    /**
     * データリストを文字列化
     *
     * @return
     */
    public String getStringOfList() {
        StringBuilder sb = new StringBuilder();
        //各要素に対応する文字列を追加
        sb.append("[");
        list.stream().forEachOrdered(p -> {
            sb.append(p.toString()).append(",");
        });
        //最後の","を削除
        int last = sb.lastIndexOf(",");
        sb.deleteCharAt(last);
        sb.append("]");
        return sb.toString();
    }

    public double getAverage() {
        return average;
    }

    public double getSigma() {
        return sigma;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntryNew entries[] = new EntryNew[]{
            new EntryNew("Bob", 90), new EntryNew("Mary", 70),
            new EntryNew("Tom", 95), new EntryNew("Mark", 85),
            new EntryNew("Betty", 80)
        };

        ListExample listSample = new ListExample(entries);
        listSample.statics();
        System.out.println(listSample.getStringOfList());
        System.out.println("average=" + listSample.getAverage());
        System.out.println("sigma=" + listSample.getSigma());
    }
}
