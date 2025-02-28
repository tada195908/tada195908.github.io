package pendulum;

import java.awt.geom.Point2D;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import rungeKutta.DifferentialEquation;
import rungeKutta.RungeKutta;
import utils.FileIO;
import utils.Utils;

/**
 *
 * @author tadaki
 */
public class Pendulum  {

    private final double theta;
    private final double omega;
    private final double r;
    private final double c;
    private final double g = 9.8;
    DifferentialEquation equation;

    public Pendulum(double x, double v, double r) {
        this.theta = x;
        this.omega = v;
        this.r = r;
        c = r * omega * omega - 2. * g * Math.cos(theta);
        //defining equation of motion
        equation = (double xx, double[] yy) -> {
            double dy[] = new double[2];
            dy[0] = yy[1];
            dy[1] = -(g / r) * Math.sin(yy[0]);
            return dy;
        };
    }

    public List<Point2D.Double> evolution(double t, int nstep) {
        double y[] = new double[2];
        y[0] = theta;
        y[1] = omega;
        double yy[][] = RungeKutta.rkdumb(y, 0., t, nstep, equation);
        List<Point2D.Double> points = Utils.createList();
        double dt = t / nstep;
        for (int i = 0; i < nstep; i++) {
            double tt = i * dt;
            points.add(new Point2D.Double(tt, yy[0][i]));
        }
        return points;
    }

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        Pendulum sys = new Pendulum(0., 0.1, 10.);
        double t = 50.;
        int nstep = 10000;
        try (FileOutputStream fStream1 = new FileOutputStream(
                new File("output.txt"))) {
            List<Point2D.Double> points = sys.evolution(t, nstep);
            FileIO.printPointsList(points, fStream1);
        }
    }

}
