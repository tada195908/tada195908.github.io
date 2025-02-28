package secondSample;

//必要なライブラリの取り込み
import java.util.Comparator;
import firstSample.Entry;

/**
 * Comparatorを使った例
 *
 * @author tadaki
 */
public class WithComparatorWithoutLambda {

    static public <T> T[] sort(T d[], Comparator<T> comparator) {
        for (int j = d.length - 1; j >= 1; j--) {//後ろからループを回す
            for (int i = 0; i < j; i++) {
                if (comparator.compare(d[i], d[i + 1]) > 0) {
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
        Entry entries[] = new Entry[]{
            new Entry("Bob", 90),
            new Entry("Mary", 70),
            new Entry("Tom", 95),
            new Entry("Mark", 85),
            new Entry("Betty", 80),
            new Entry("Ann", 85),
            new Entry("Kim", 95)
        };

        entries = WithComparatorWithoutLambda.sort(entries,
                new Comparator<Entry>() {
            @Override
            public int compare(Entry o1, Entry o2) {
                int dv = o1.getScore() - o2.getScore();
                if (dv == 0) {
                    return o1.getName().compareTo(o2.getName());
                }
                return dv;
            }
        });
        for (Entry p : entries) {
            System.out.println(p.toString());
        }
    }
}
