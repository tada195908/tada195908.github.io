package thirdSample;

/**
 *
 * @author tadaki
 */
public class EntryOne extends AbstractEntry {

    public EntryOne(String name, int scoreOne,int scoreTwo) {
        super(name, scoreOne,scoreTwo);
    }

    public int compareTo(AbstractEntry e) {
        if (e.getScoreOne() > getScoreOne()) {
            return -1;
        }
        if (e.getScoreOne() < getScoreOne()) {
            return 1;
        }
        return getName().compareTo(e.getName());
    }
}
