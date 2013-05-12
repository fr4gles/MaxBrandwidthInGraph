
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.PriorityQueue;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Michal
 */
public class Path
{
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Michal
 */

class Edge 
{
    public final Vertex target;
    public final double weight;

    public Edge(Vertex argTarget, double argWeight) 
    {
        target = argTarget;
        weight = argWeight;
    }
}


class Vertex implements Comparable<Vertex> 
{
    public double       minDistance = Double.POSITIVE_INFINITY;
    public final String name;
    public ArrayList<Edge>       adjacencies;
    public Vertex       previous;

    public Vertex(int argName) 
    {
        name = "v"+argName;
        adjacencies = new ArrayList<>();
    }

    public String toString() 
    {
        return name;
    }

    public int compareTo(Vertex other) 
    {
        return Double.compare(minDistance, other.minDistance);
    }
}

class Dijkstra 
{
    public static void computePaths(Vertex source) {
        source.minDistance = 0.;

        PriorityQueue<Vertex> vertexQueue = new PriorityQueue<Vertex>();

        vertexQueue.add(source);

        while (!vertexQueue.isEmpty()) {
            Vertex u = vertexQueue.poll();

            // Visit each edge exiting u
            for (Edge e : u.adjacencies) {
                Vertex v                = e.target;
                double weight           = e.weight;
                double distanceThroughU = u.minDistance + weight;

                if (distanceThroughU < v.minDistance) {
                    boolean t = vertexQueue.remove(v);
                    v.minDistance = distanceThroughU;
                    v.previous    = u;
                    vertexQueue.add(v);
                }
            }
        }
    }

    public static List<Vertex> getShortestPathTo(Vertex target) {
        List<Vertex> path = new ArrayList<Vertex>();

        for (Vertex vertex = target; vertex != null; vertex = vertex.previous) {
            path.add(vertex);
        }

        Collections.reverse(path);

        return path;
    }


}







