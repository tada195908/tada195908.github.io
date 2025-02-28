package simpleTimer;

import java.util.Calendar;
import java.awt.Dimension;
/**
 *
 * @author tadaki
 */
public class Timer extends javax.swing.JLabel implements Runnable {

    private Thread runner = null;
    private volatile boolean running = false;
    private Calendar now = null;

    public Timer() {
        setText("0 sec");
        Dimension dimension = new Dimension(100,10);
        setMaximumSize(dimension);
        setPreferredSize(dimension);
    }

    public void start() {
        running = true;
        now = Calendar.getInstance();
        runner = new Thread(this);
        runner.start();
    }

    public void stop() {
        running = false;
    }

    public void run() {
        while (running) {
            Calendar c = Calendar.getInstance();
            int d = (int) (c.getTimeInMillis() - now.getTimeInMillis()) / 1000;
            setText(String.valueOf(d) + " sec");
            setVisible(true);
            try {
                Thread.sleep(100);
            } catch (InterruptedException ex) {
            }
        }
    }
}
