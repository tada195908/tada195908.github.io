package mapExample;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author tadaki
 */
public class MapExample {

    private Map<String, Integer> map;

    public MapExample() {
        map = Collections.synchronizedMap(new HashMap<>());
    }

    public double getAverage() {
        int a = map.keySet().stream().map(
                (name) -> map.get(name)
        ).reduce(
                0, (accumulator, v) -> accumulator + v);
        return (double) a / map.size();
    }

    public Integer putData(String k, Integer v) {
        return map.put(k, v);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String names[] = {"Bob", "Mary", "Tom", "Mark", "Betty"};
        Integer values[] = {90, 70, 95, 85, 80};

        MapExample mapExample = new MapExample();
        for (int i = 0; i < names.length; i++) {
            mapExample.putData(names[i], values[i]);
        }
        System.out.println("average=" + mapExample.getAverage());
    }

}
