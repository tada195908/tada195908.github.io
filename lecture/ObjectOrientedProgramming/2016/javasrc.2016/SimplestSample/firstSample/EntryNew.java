package firstSample;

/**
 * EntryNew クラス 名前と点数を保持 Comparableインターフェイスを使う
 *
 * @author tadaki
 */
public class EntryNew implements Comparable<EntryNew> {

    final private String name;//名前
    final private int score;//点数

    /**
     * コンストラクタ
     *
     * @param name 名前
     * @param score 点数
     */
    public EntryNew(String name, int score) {
        this.name = name;
        this.score = score;
    }

    /**
     * Comparableインターフェイスに必要な比較のメソッド
     *
     * @param e 比較対象
     * @return 自分が大きければ1、小さければ-1、同じならば0
     */
    @Override
    public int compareTo(EntryNew e) {
        if (e.getScore() > score) {
            return -1;
        }
        if (e.getScore() < score) {
            return 1;
        }
        return 0;
    }

    public String getName() {
        return name;
    }

    public int getScore() {
        return score;
    }

    @Override
    public String toString() {
        return getName() + ":" + getScore();
    }
}
