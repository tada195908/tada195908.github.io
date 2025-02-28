package firstSample;

import java.util.Arrays;
import java.util.List;

/**
 * Entryクラスを使った例題
 *
 * @author tadaki
 */
public class WithClass {

    /**
     * ソートの実行
     *
     * @param d
     * @return 結果をリストで返す
     */
    static public Entry[] sort(Entry d[]) {
        for (int j = d.length - 1; j >= 1; j--) {//後ろからループを回す
            for (int i = 0; i < j; i++) {
                //順序が逆の場合
                if (d[i].getScore() > d[i + 1].getScore()) {
                    Entry c = d[i];
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
        Entry entries[] = new Entry[]{
            new Entry("Bob", 90),
            new Entry("Mary", 70),
            new Entry("Tom", 95),
            new Entry("Mark", 85),
            new Entry("Betty", 80)};
        
        entries = WithClass.sort(entries);
        for (Entry entry : entries) {
            System.out.println(entry.toString());
        }
    }
}
