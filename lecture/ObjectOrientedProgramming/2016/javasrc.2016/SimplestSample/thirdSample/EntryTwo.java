package thirdSample;

/**
 *
 * @author tadaki
 */
public class EntryTwo extends AbstractEntry {

    public EntryTwo(String name, int scoreOne,int scoreTwo) {
        super(name, scoreOne,scoreTwo);
    }

    public int compareTo(AbstractEntry e) {
        if (e.getScoreTwo() > getScoreTwo()) {
            return -1;
        }
        if (e.getScoreTwo() < getScoreTwo()) {
            return 1;
        }
        return getName().compareTo(e.getName());
    }
}
