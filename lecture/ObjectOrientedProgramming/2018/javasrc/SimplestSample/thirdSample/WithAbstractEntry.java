package thirdSample;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;
/**
 *
 * @author tadaki
 */
public class WithAbstractEntry<T extends Comparable<T>> {
    //クラスT のインスタンスを要素とするリスト
    private List<T> entries;

    public WithAbstractEntry(List<T> entries) {
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
        List<AbstractEntry> entries=new ArrayList<AbstractEntry>();
        
        entries.add(new EntryOne("Bob", 90,80));
        entries.add(new EntryOne("Mary", 70,60));
        entries.add(new EntryOne("Tom", 95,80));
        entries.add(new EntryOne("Mark", 85,90));
        entries.add(new EntryOne("Betty", 80,95));
        entries.add(new EntryOne("Tim", 70,80));
        entries.add(new EntryOne("Ann", 85,85));
        entries.add(new EntryOne("Kim", 95,70));
        
        WithAbstractEntry<AbstractEntry> withClass =
                new WithAbstractEntry<AbstractEntry>(entries);

        System.out.println(withClass.sort());
    }
}
