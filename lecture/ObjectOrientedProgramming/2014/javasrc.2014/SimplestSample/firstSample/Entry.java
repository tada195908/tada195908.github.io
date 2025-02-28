package firstSample;

/**
 * Entry クラス 名前と点数を保持
 *
 * @author tadaki
 */
public class Entry {

    final private String name;//名前
    final private int score;//点数

    /**
     * コンストラクタ
     *
     * @param name 名前
     * @param score 点数
     */
    public Entry(String name, int score) {
        /**
         * this はこのインスタンスを表す
         */
        this.name = name;
        this.score = score;
    }

    /**
     * 他のインスタンスをコピーするコンストラクタ
     *
     * @param entry コピー元
     */
    public Entry(final Entry entry) {
        this.name = entry.getName();
        this.score = entry.getScore();
    }

    /**
     * 名前を返す
     *
     * @return このインスタンスの保持している名前
     */
    public String getName() {
        return name;
    }

    /**
     * 点数を返す
     *
     * @return このインスタンスが保持している名前
     */
    public int getScore() {
        return score;
    }

    @Override
    /**
     * 文字列への変換
     */
    public String toString() {
        return getName() + ":" + getScore();
    }
}
