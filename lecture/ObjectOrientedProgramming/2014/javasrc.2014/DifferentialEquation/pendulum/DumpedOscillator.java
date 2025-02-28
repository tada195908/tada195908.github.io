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
public class DumpedOscillator {

    private final double x;
    private final double v;
    private final double k;
    private final double lambda;
    DifferentialEquation equation;

    public DumpedOscillator(double x, double v, double k, double lambda) {
        this.x = x;
        this.v = v;
        this.k = k;
        this.lambda = lambda;
        equation = (double xx, double[] y) -> {
            double dy[] = new double[2];
            dy[0] = y[1];
            dy[1] = -k * y[0] - lambda * y[1];
            return dy;
        };

    }

    public List<Point2D.Double> evolution(double t, int nstep) {
        double y[] = new double[2];
        y[0] = x;
        y[1] = v;
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
        DumpedOscillator sys = new DumpedOscillator(0., 1., 1., 0.1);
        double t = 50.;
        int nstep = 10000;
        try (FileOutputStream fStream1 = new FileOutputStream(
                new File("output.txt"))) {
            List<Point2D.Double> points = sys.evolution(t, nstep);
            FileIO.printPointsList(points, fStream1);
        }
    }

}
