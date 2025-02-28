/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package firstSample;

/**
 * java.lang.Comparableを実装したクラステンプレートT を使うことを指示
 * @author tadaki
 */
public class WithClassNew<T extends Comparable<T>> {

    private boolean ascending = true;
    private T entries[];

    public WithClassNew(T entries[]) {
        this.entries = entries;
    }

    public String sort() {
        bubble(entries);
        return data2String(entries);
    }

    private String data2String(T d[]) {//配列内の数値を文字列化する
        String nl = System.getProperty("line.separator");

        StringBuffer buffer = new StringBuffer();
        for (int i = 0; i < d.length - 1; i++) {
            buffer.append(d[i].toString());
            buffer.append(nl);
        }
        int n = d.length - 1;
        buffer.append(d[n].toString());
        buffer.append(nl);
        return buffer.toString();
    }

    private void bubble(T d[]) {//泡立ち法
        for (int j = d.length - 1; j >= 1; j--) {//後ろからループを回す
            for (int i = 0; i < j; i++) {
                if (!order(d[i], d[i + 1])) {
                    T c = d[i];
                    d[i] = d[i + 1];
                    d[i + 1] = c;
                }
            }
        }
    }

    private boolean order(T a, T b) {
        boolean ans = false;
        if (this.isAscending() && (a.compareTo(b) < 0)) {
            ans = true;
        }
        return ans;
    }

    public boolean isAscending() {
        return ascending;
    }

    public void setAscending(boolean ascending) {
        this.ascending = ascending;
    }

    public void setAscending() {
        setAscending(true);
    }

    public void setDescending() {
        setAscending(false);
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
        
        WithClassNew<EntryNew> withClass =
                new WithClassNew<EntryNew>(e);

        System.out.println(withClass.sort());

    }
}
