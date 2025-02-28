package secondSample;

/**
 *
 * @author tadaki
 */
public class EntryNew implements Comparable<EntryNew> {

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
        return getName().compareTo(e.getName());
    }

    public String getName() {
        return name;
    }

    public int getScore() {
        return score;
    }

    @Override
    public String toString() {
        return getName() + ":" + getScore();
    }
}
