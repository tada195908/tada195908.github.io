package firstSample;

/**
 * java.lang.Comparableを実装したクラステンプレートT を 使うことを指示
 *
 * 明示的にクラスEntryNewが使われていない点に注意
 *
 * @author tadaki
 */
public class WithClassNew {

    /**
     * ソートの実行
     *
     * @param <T> 型パラメタ：Comparableを実装
     * @param d 整列対象の配列
     * @return
     */
    static public <T extends Comparable<T>> T[] sort(T d[]) {
        for (int j = d.length - 1; j >= 1; j--) {//後ろからループを回す
            for (int i = 0; i < j; i++) {
                if (d[i].compareTo(d[i + 1]) > 0) {
                    T c = d[i];
                    d[i] = d[i + 1];
                    d[i + 1] = c;
                }
            }
        }
        return d;
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
            new EntryNew("Betty", 80)
        };

        entries = WithClassNew.sort(entries);
        for (EntryNew entry : entries) {
            System.out.println(entry.toString());
        }
    }
}
