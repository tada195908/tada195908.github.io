package secondSample;

/**
 *
 * @author tadaki
 */
public class EntryNew {

    final private String name;
    final private int score;

    public EntryNew(String name, int score) {
        this.name = name;
        this.score = score;
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
