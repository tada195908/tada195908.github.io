package firstSample;

import java.util.Arrays;
import java.util.List;

/**
 * java.lang.Comparableを実装したクラステンプレートT を
 * 使うことを指示 明示的にクラスEntryNewが使われていない点に注意
 *
 * @author tadaki
 * @param <T>
 */
public class WithClassNew<T extends Comparable<T>> {

    private final T entries[];//データを保存する整数配列

    public WithClassNew(T entries[]) {
        this.entries = entries;
    }

    public List<T> sort() {
        return bubble(entries);
    }

    private List<T> bubble(T d[]) {//泡立ち法
        for (int j = d.length - 1; j >= 1; j--) {//後ろからループを回す
            for (int i = 0; i < j; i++) {
                if (d[i].compareTo(d[i + 1]) > 0) {
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
        EntryNew e[] = new EntryNew[]{
            new EntryNew("Bob", 90),
            new EntryNew("Mary", 70),
            new EntryNew("Tom", 95),
            new EntryNew("Mark", 85),
            new EntryNew("Betty", 80)
        };

        WithClassNew<EntryNew> withClass = new WithClassNew<>(e);
        List<EntryNew> list = withClass.sort();
        list.stream().forEachOrdered(
                (p) -> {
                    System.out.println(p.toString());
                }
        );
    }
}
