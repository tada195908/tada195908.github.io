package universityMembers;

/**
 *
 * @author tadaki
 */
abstract public class Member {

    private String name;
    private String uname;
    private String affiliation;
    private boolean valid = true;
    private Period period;

    public Member(String name, String uname, String affiliation) {
        this.name = name;
        this.uname = uname;
        this.affiliation = affiliation;
        period = new Period();
    }
    //無効化処理

    public void invalidate() {
        setValid(false);
    }
    //期限延長処理

    abstract public void extend(java.util.Calendar c);

    public Period getPeriod() {
        return period;
    }

    public void setPeriod(Period period) {
        this.period = period;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUname() {
        return uname;
    }

    public String getAffiliation() {
        return affiliation;
    }

    public void setAffiliation(String affiliation) {
        this.affiliation = affiliation;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }
}
