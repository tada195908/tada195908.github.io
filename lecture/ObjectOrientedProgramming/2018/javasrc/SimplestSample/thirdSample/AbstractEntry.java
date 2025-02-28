package thirdSample;

/**
 *
 * @author tadaki
 */
public abstract class AbstractEntry 
	implements Comparable<AbstractEntry> {

    private String name;
    private int scoreOne;
    private int scoreTwo;

    public AbstractEntry(String name, int scoreOne, int scoreTwo) {
        this.name = name;
        this.scoreOne = scoreOne;
        this.scoreTwo = scoreTwo;
    }

    public abstract int compareTo(AbstractEntry e);

    public String getName() {
        return name;
    }

    public int getScoreOne() {
        return scoreOne;
    }

    public int getScoreTwo() {
        return scoreTwo;
    }

    @Override
    public String toString() {
        return getName() + ":" + getScoreOne() + "," + getScoreTwo();
    }
}
