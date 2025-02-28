
import histogram.Histogram;
import java.awt.geom.Point2D;
import java.io.BufferedWriter;
import java.io.IOException;
import java.util.List;
import myLib.utils.FileUtils;
import randomNumbers.*;

/**
 *
 * @author tadaki
 */
public class Main {

    public static enum Type {//乱数の型

        EXPONENTIAL, GAUSSIAN, UNIFORM, 
        STEP, STEPByTRANSFORM, SINRANDOM, SINRANDOMByTRANSFORM;
    }

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        int N = 100000;
        for (Type type : Type.values()) {
            MyRandom random;
            double min = 0.;
            double max = 1.;
            double bin = 0.01;
            switch (type) {
                case EXPONENTIAL:
                    random = new Exponential(1.);
                    max = 10.;
                    bin = 0.1;
                    break;
                case GAUSSIAN:
                    random = new Gaussian(0., 1.);
                    min=-5.;
                    max = 5.;
                    break;
                case STEP:
                    random = new Step(0.5, 2.);
                    break;
                case STEPByTRANSFORM:
                    random = new StepByTransform(0.5, 2.);
                    break;
                case SINRANDOM:
                    random = new SinRandom();
                    break;
                case SINRANDOMByTRANSFORM:
                    random = new SinRandomByTransform();
                    break;
                default:
                    random = new Uniform(0., 1.);
                    break;
            }
            Histogram histogram = new Histogram(min, max, bin);
            for (int i = 0; i < N; i++) {
                double r = random.next();
                histogram.put(r);
            }
            List<Point2D.Double> list = histogram.getHistData();
            String filename = random.getClass().getSimpleName() + ".txt";
            try (BufferedWriter writer = FileUtils.openWriter(filename)) {
                for (Point2D.Double p : list) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(p.x).append(" ").append(p.y);
                    writer.write(sb.toString());
                    writer.newLine();
                }
            }
        }
    }
}
