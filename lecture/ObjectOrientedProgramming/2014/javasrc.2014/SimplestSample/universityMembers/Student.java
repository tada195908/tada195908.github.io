package universityMembers;

import java.util.Calendar;

/**
 *
 * @author tadaki
 */
public class Student extends Member {

    private String studentID = null;

    static public enum REC {

        GRAD("卒業・終了"),
        TERM("除籍"),
        MOVE("転学部・転学科"),
        NONE("");
        private String jName;

        REC(String jName) {
            this.jName = jName;
        }

        public String getJName() {
            return jName;
        }
    }
    private REC rec = REC.NONE;

    public Student(String name, String uname,
            String affiliation, String studentID) {
        super(name, uname, affiliation);
        this.studentID = studentID;
        getPeriod().getTo().add(Calendar.YEAR, 4);
    }

    @Override
    public void extend(Calendar c) {
        getPeriod().getTo().add(Calendar.YEAR, 1);
    }

    @Override
    public void invalidate() {
        invalidate(REC.GRAD);
    }

    public void invalidate(REC rec) {
        super.invalidate();
        this.rec = rec;
    }
}
