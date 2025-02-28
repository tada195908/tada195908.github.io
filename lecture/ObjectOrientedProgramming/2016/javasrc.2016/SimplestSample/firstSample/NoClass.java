/*
 * 属するパッケージを宣言
 */
package firstSample;

/**
 * クラスを使わない例
 *
 * @author tadaki
 */
public class NoClass {

    /**
     * ソート(整列)
     *
     * @param d
     * @return
     */
    static public int[] sort(int d[]) {
        for (int j = d.length - 1; j >= 1; j--) {//後ろからループを回す
            for (int i = 0; i < j; i++) {
                if (d[i] > d[i + 1]) {//順序が逆の場合
                    int c = d[i];
                    d[i] = d[i + 1];
                    d[i + 1] = c;
                }
            }
        }
        return d;
    }

    /**
     * ここから実行が始まる
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int d[] = {4, 2, 5, 8, 3, 1};

        d = NoClass.sort(d);
        for (int i = 0; i < d.length; i++) {
            System.out.print(d[i]);
            System.out.print(" ");
        }
        System.out.println();
    }
}
