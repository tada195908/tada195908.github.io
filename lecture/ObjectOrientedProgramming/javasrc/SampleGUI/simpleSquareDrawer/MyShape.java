/**
 *
 * @author tadaki
 */
package simpleSquareDrawer;

import java.awt.Color;
import java.awt.Shape;
import java.awt.Stroke;

public class MyShape {

    private Shape shape;
    private Color color;
    private Stroke stroke;
    private boolean fill = false;

    public Shape getShape() {
        return shape;
    }

    public void setShape(Shape shape) {
        this.shape = shape;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Stroke getStroke() {
        return stroke;
    }

    public void setStroke(Stroke stroke) {
        this.stroke = stroke;
    }

    public boolean isFill() {
        return fill;
    }

    public void setFill(boolean fill) {
        this.fill = fill;
    }
}
