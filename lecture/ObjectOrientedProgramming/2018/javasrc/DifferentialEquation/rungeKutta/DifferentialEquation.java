package rungeKutta;


/**
 *
 * @author tadaki
 */
@FunctionalInterface
public interface DifferentialEquation {

    public double[] derivatives(double x, double y[]);

}
