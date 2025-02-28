package universityMembers;
import java.util.Calendar;
/**
 *
 * @author tadaki
 */
public class Period {
    private Calendar from;
    private Calendar to;

    public Period() {
        this.from = Calendar.getInstance();
        this.to=(Calendar)from.clone();
    }
    public Period(Calendar from, Calendar to) {
        this.from = from;
        this.to = to;
    }

    public Calendar getFrom() {
        return from;
    }

    public void setFrom(Calendar from) {
        this.from = from;
    }

    public Calendar getTo() {
        return to;
    }

    public void setTo(Calendar to) {
        this.to = to;
    }
}
