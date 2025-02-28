import histogram.Histogram;
import java.awt.geom.Point2D;
import java.io.BufferedWriter;
import java.io.IOException;
import java.util.List;
import randomNumbers.*;

/**
 *
 * @author tadaki
 */
public class NewMain {

    public static enum Type {

        EXPONENTIAL, GAUSSIAN, UNIFORM,STEP;
    }

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        int N = 100000;
        Type type = Type.GAUSSIAN;
        MyRandom random;
        switch (type) {
            case EXPONENTIAL:
                random = new Exponential(1.);
                break;
            case GAUSSIAN:
                random = new Gaussian(0., 1.);
                break;
            case STEP:
                random = new Step(0.5,2.);
                break;
            default:
                random = new Uniform(0., 1.);
                break;
        }
        Histogram histogram = new Histogram(0., 10., 0.1);
        for (int i = 0; i < N; i++) {
            double r = random.next();
            histogram.put(r);
        }
        List<Point2D.Double> list = histogram.getHistData();
        try (BufferedWriter writer = FileIO.openWriter("out.txt")) {
            for (Point2D.Double p : list) {
                StringBuilder sb = new StringBuilder();
                sb.append(p.x).append(" ").append(p.y);
                writer.write(sb.toString());
                writer.newLine();
            }
        }
    }

}
