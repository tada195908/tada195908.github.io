/*
 * 属するパッケージを宣言
 */
package firstSample;

/**
 *
 * @author tadaki
 */
public class NoClass {
    //データを保存する整数配列

    private final int data[];

    /**
     * コンストラクタ
     *
     * @param data データ
     */
    public NoClass(int data[]) {
        this.data = data;
    }

    /**
     * ソート
     *
     * @return
     */
    public int[] sort() {
         return bubble(data);
    }

    private int [] bubble(int d[]) {//泡立ち法
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
        int data[] = {4, 2, 5, 8, 3, 1};
        //インスタンスの生成
        NoClass noClass = new NoClass(data);
        int d[] = noClass.sort();
        for(int i=0;i<d.length;i++){
            System.out.print(d[i]);
            System.out.print(" ");
        }
        System.out.println();        
    }
}
