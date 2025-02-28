package firstSample;

import java.util.Arrays;
import java.util.List;

/**
 * Entryクラスを使った例題
 *
 * @author tadaki
 */
public class WithClass {

    private final Entry entries[];//データを保存する整数配列

    /**
     * コンストラクタ
     *
     * @param entries Entryクラスの配列で、データを登録
     */
    public WithClass(Entry entries[]) {
        this.entries = entries;
    }

    /**
     * ソートの実行
     *
     * @return 結果を文字列で返す
     */
    public List<Entry> sort() {
        return bubble(entries);
    }

    private List<Entry> bubble(Entry d[]) {//泡立ち法
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
        return Arrays.asList(d);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        WithClass withClass = new WithClass(new Entry[]{
            new Entry("Bob", 90),
            new Entry("Mary", 70),
            new Entry("Tom", 95),
            new Entry("Mark", 85),
            new Entry("Betty", 80)
        });

        List<Entry> list = withClass.sort();
        //streamとラムダ式による表記
        list.stream().forEachOrdered(
                p -> {
                    System.out.println(p.toString());
                }
        );
        /*
        for(Entry p:list){
            System.out.println(p.toString());
        }*/
    }
}
