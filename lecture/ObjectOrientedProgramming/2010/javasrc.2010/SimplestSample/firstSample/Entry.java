/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package firstSample;

/**
 *
 * @author tadaki
 */
public class Entry {
    private String name;
    private int score;
    public Entry(String name, int score){
        this.name=name; this.score=score;
    }

    public Entry(final Entry entry){
        this.name=entry.getName();
        this.score=entry.getScore();
    }
    
    public String getName() {
        return name;
    }

    public int getScore() {
        return score;
    }
    
    public String toString(){
        return getName()+":"+getScore();
    }
}
