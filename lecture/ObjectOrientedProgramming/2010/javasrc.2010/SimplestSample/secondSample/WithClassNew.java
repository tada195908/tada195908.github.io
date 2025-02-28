package secondSample;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;
/**
 *
 * @author tadaki
 */
public class WithClassNew<T extends Comparable<T>> {
    //クラスT のインスタンスを要素とするベクトル
    private List<T> entries;

    public WithClassNew(List<T> entries) {
        this.entries = entries;
    }

    public String sort() {
        //クラスT のインスタンスを要素とするソートされた集合
        //ソートは、クラスT のcompareTo()を使って行われる
        TreeSet<T> treeSet = new TreeSet<T>(entries);
        return data2String(treeSet);
    }

    private String data2String(TreeSet<T> treeSet) {
    	//配列内の数値を文字列化する
        String nl = System.getProperty("line.separator");

        StringBuilder buffer = new StringBuilder();
        for(T t:treeSet){//拡張されたfor
            buffer.append(t.toString());
            buffer.append(nl);
        }
        return buffer.toString();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        List<EntryNew> entries=new ArrayList<EntryNew>();
        
        entries.add(new EntryNew("Bob", 90));
        entries.add(new EntryNew("Mary", 70));
        entries.add(new EntryNew("Tom", 95));
        entries.add(new EntryNew("Mark", 85));
        entries.add(new EntryNew("Betty", 80));
        entries.add(new EntryNew("Tim", 70));
        entries.add(new EntryNew("Ann", 85));
        entries.add(new EntryNew("Kim", 95));
        
        WithClassNew<EntryNew> withClass =
                new WithClassNew<EntryNew>(entries);

        System.out.println(withClass.sort());
    }
}
