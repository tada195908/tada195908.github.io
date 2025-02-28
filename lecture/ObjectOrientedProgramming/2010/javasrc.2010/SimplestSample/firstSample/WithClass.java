/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package firstSample;

/**
 *
 * @author tadaki
 */
public class WithClass {

    private boolean ascending = true;
    private Entry entries[];

    public WithClass(Entry entries[]) {
        this.entries =entries;
    }

    public String sort() {
        bubble(entries);
        return data2String(entries);
    }

    private String data2String(Entry d[]) {//配列内の数値を文字列化する
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

    private void bubble(Entry d[]) {//泡立ち法
        for (int j = d.length - 1; j >= 1; j--) {//後ろからループを回す
            for (int i = 0; i < j; i++) {
                //順序が逆の場合
                if (!order(d[i], d[i + 1])) {
                    Entry c = d[i];
                    d[i] = d[i + 1];
                    d[i + 1] = c;
                }
            }
        }
    }

    private boolean order(Entry a, Entry b) {
        boolean ans = false;
        if (this.isAscending() && (a.getScore() < b.getScore())) {
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
        WithClass withClass = new WithClass(new Entry[]{
            new Entry("Bob", 90),
            new Entry("Mary", 70),
            new Entry("Tom", 95),
            new Entry("Mark", 85),
            new Entry("Betty", 80)
        });
        System.out.println(withClass.sort());

    }
}
