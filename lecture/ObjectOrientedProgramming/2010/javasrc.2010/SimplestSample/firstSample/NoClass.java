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
    private int data[] = null;
    //コンストラクタ
    public NoClass(String[] strs) {
        data = new int[strs.length];//Javaでは配列もクラスである
        //文字列の配列として渡された整数を整数配列に格納
        for (int i = 0; i < strs.length; i++) {
            data[i] = Integer.valueOf(strs[i]);
        }
    }
    //パブリックメソッド
    public String sort() {
        bubble(data);
        return data2String(data);
    }

    //プライベートメソッド
    private String data2String(int d[]) {//配列内の数値を文字列化する
        //String は変更できない文字列
        //StringBufferは変更できる文字列
        StringBuffer buffer = new StringBuffer();
        for (int i = 0; i < d.length - 1; i++) {
            buffer.append(data[i]);
            buffer.append(' ');
        }
        buffer.append(data[data.length - 1]);
        return buffer.toString();//StringBufferをStringに変換
    }

    private void bubble(int d[]) {//泡立ち法
    //ここを実装
    }

    /**
     * ここから実行が始まる
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        if (args.length == 0) {//引数のチェック
            System.exit(0);
        }
        //インスタンスの生成
        NoClass noClass = new NoClass(args);
        //インスタンス中のsort()メソッドの結果を標準出力へ
        System.out.println(noClass.sort());
    }
}
