package secondSample;

//必要なライブラリの取り込み
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * Comparatorを使った例
 * @author tadaki
 * @param <T>
 */
public class WithClassNew<T> {

    private final Comparator<T> comparator;
    //クラスT のインスタンスを要素とするリスト
    private final T entries[];//データを保存する整数配列

    public WithClassNew(T entries[], Comparator<T> comparator) {
        this.entries = entries;
        this.comparator = comparator;
    }

    public List<T> sort() {
        return bubble(entries);
    }

    private List<T> bubble(T d[]) {//泡立ち法
        for (int j = d.length - 1; j >= 1; j--) {//後ろからループを回す
            for (int i = 0; i < j; i++) {
                if (comparator.compare(d[i], d[i + 1]) > 0) {
                    T c = d[i];
                    d[i] = d[i + 1];
                    d[i + 1] = c;
                }
            }
        }
        return Arrays.asList(d);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntryNew entries[] = new EntryNew[]{
            new EntryNew("Bob", 90),
            new EntryNew("Mary", 70),
            new EntryNew("Tom", 95),
            new EntryNew("Mark", 85),
            new EntryNew("Betty", 80),
            new EntryNew("Ann", 85),
            new EntryNew("Kim", 95)
        };

        WithClassNew<EntryNew> withClass = new WithClassNew<>(entries,
                (x, y) -> x.getScore() - y.getScore());

        List<EntryNew> result = withClass.sort();
        result.stream().forEachOrdered((x) -> {
            System.out.println(x.toString());
        });
    }
}
