/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package firstSample;

/**
 *
 * @author tadaki
 */
public class EntryNew
        implements java.lang.Comparable<EntryNew> {

    private String name;
    private int score;

    public EntryNew(String name, int score) {
        this.name = name;
        this.score = score;
    }

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

    public String toString() {
        return getName() + ":" + getScore();
    }
}
