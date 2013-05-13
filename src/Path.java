
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    /**
     * tablica danych wejsciowych z bazy
     */
    private ArrayList<Data> DataList;
    
    /**
     * mapa wierzchołków
     * przy czym: klucz to numer wierzchołka
     * wartość to referencja na wierzchołek
     */
    private Map<Integer, Vertex> VertexMap;
    
    /**
     * Funckja uzupełniająca wierzchołki o krawędzie wychodzące z nich
     * wszystko w oparciu o dane z krawędzi
     * @param dataList dane o krawędziach
     * @param map mapa wierzchołków
     */
    private void ResolveEdges(List<Data> dataList, Map<Integer, Vertex> map)
    {
        for(Data d : dataList)
        {
            map.get(d.x).adjacencies.add(new Edge(map.get(d.y), d.p));
        }
    }

    /**
     * przekształca map<numer wierzcholka, wierzcholek> na tablicę wierzchołków
     * @param map mapa wierzchołków
     * @return tablica wierzchołków
     */
    private ArrayList<Vertex> ConvertMapOfVertextToList(Map<Integer, Vertex> map)
    {
        ArrayList<Vertex> vertices = new ArrayList<>();
        for (Map.Entry<Integer, Vertex> entry : map.entrySet()) 
        {
            vertices.add(entry.getValue());
        }
        return vertices;
    }

    /**
     * uzupełnia mapę wierzchołków z dancyh o krawędziach
     * @return mapa wierzchołków
     */
    private Map<Integer, Vertex> GetGraphFromData()
    {
        Map<Integer, Vertex> map = new HashMap<>();
        
        for(Data d: DataList)
        {
            map.put(d.x, new Vertex(d.x));
            map.put(d.y, new Vertex(d.y));
        }
        
        return map;
    }
    
    /**
     * Funkcja szukająca ścieżki od źródła do końca
     * szuka za pomocą djikstry
     * jeśli nie znajdzie to zwraca false;
     * @param vertexIndex indeks końcowego wierzchołka
     * @return czy znaleziono ścieżkę z A do B?
     */
    private boolean ResolveProblem(int vertexIndex)
    {
        boolean found = false;
        
        ArrayList<Vertex> vertices = ConvertMapOfVertextToList(VertexMap);

        try
        {
            for (Vertex v : vertices)
            {
                if(v.index == 1)
                {
                    Dijkstra.computePaths(v);
                    break;
                }
            }
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
            return false;
        }
                
        for (Vertex v : vertices) 
        {
            if (v.minDistance != Double.POSITIVE_INFINITY) 
            {
                if(VertexMap.get(vertexIndex).index == v.index)
                {
                    Main.degugLog =  Main.degugLog.concat(" - - - znalazłem - - - - - - - - - - - - - - - -  : " + v +"\n");
                    found = true;
                }

                Main.degugLog =  Main.degugLog.concat( "Path: " + Dijkstra.getShortestPathTo(v) + "\n" );
            }
        }
        
        return found;
    }
    
    /**
     * Przygotowuje dane do znalezienia maksymalnej przepustowości w grafi z A do B
     * @param vertexIndex numer końcowego wierzchołka
     * @return czy znaleziono ścieżkę ?
     */
    private boolean PrepareToFindMaxBrandwidth(int vertexIndex)
    {
        if(VertexMap != null)
            VertexMap.clear();
        
        VertexMap = GetGraphFromData();
        ResolveEdges(DataList, VertexMap);            

        return ResolveProblem(vertexIndex);
    }
    
    /**
     * Główna funkcja obliczająca maksymalną przepustowość 
     * @param vertexIndex numer wierzchołka końcowego
     * @param dataList dane z bazy - krawędzie
     * @return maksymalna przepustowość
     */
    public Float Go(int vertexIndex, ArrayList<Data> dataList)
    {
        DataList = dataList;
        
        if(DataList == null)
            return null;
        
        Collections.sort(DataList, new CompareByP());
        
        Float result = DataList.get(0).p;
        
        for(; DataList.size() > 2 ; DataList.remove(DataList.get(0)))
        {
            if(!PrepareToFindMaxBrandwidth(vertexIndex))
            {
                Main.degugLog =  Main.degugLog.concat( "STOP --> " + DataList.get(0).p + "\n" );
                break;
            }
            
            result = DataList.get(0).p;
        }

        return result;
    }
}


/**
 * Klasa porównująca po zmiennej: z
 * @author Michal
 */
class CompareByP implements Comparator<Data> 
{
    /**
     * komparator
     * @param o1 obiekt 1
     * @param o2 obiekt 2
     * @return wynik
     */
    @Override
    public int compare(Data o1, Data o2) 
    {
        return o1.p.compareTo(o2.p);
    }
}

/**
 * Klasa przechowująca dane z bazy
 * główne krawędzie (x,y)
 * oraz przepustowość p
 * @author Michal
 */
class Data
{
    public int x;
    public int y;
    public Float p;
    
    /**
     * konstruktor inicjalizujacy
     * @param x wierzchołek A
     * @param y wierzchołek B
     * @param p przepustowość
     */
    public Data(int x, int y, float p)
    {
        this.x = x;
        this.y = y;
        this.p = p;
    }
}


/**
 * klasa przechowująca krawędzie pomiędzy wierzchołkami
 * @author Michal
 */
class Edge 
{
    /**
     * cel krawędzi
     */
    public final Vertex target;
    
    /**
     * waga krawędzi
     */
    public final double weight;

    /**
     * konstruktor
     * @param argTarget cel
     * @param argWeight waga
     */
    public Edge(Vertex argTarget, double argWeight) 
    {
        target = argTarget;
        weight = argWeight;
    }
}


/**
 * Klasa przechowująca wierzchołki
 * @author Michal
 */
class Vertex implements Comparable<Vertex> 
{
    public double               minDistance = Double.POSITIVE_INFINITY;
    public final int            index;
    public ArrayList<Edge>      adjacencies;
    public Vertex               previous;

    public Vertex(int argName) 
    {
        index = argName;
        adjacencies = new ArrayList<>();
    }

    public String toString() 
    {
        return "v"+index;
    }

    public int compareTo(Vertex other) 
    {
        return Double.compare(minDistance, other.minDistance);
    }
}

class Dijkstra 
{
    /**
     * Funkcja obliczająca zgodnie z algorytmem Djikstry najkrótszą ścieżkę do celu
     * @param source źródłowy wierzchołek
     */
    public static void computePaths(Vertex source) 
    {
        source.minDistance = 0.;

        PriorityQueue<Vertex> vertexQueue = new PriorityQueue<Vertex>();

        vertexQueue.add(source);

        while (!vertexQueue.isEmpty()) 
        {
            Vertex u = vertexQueue.poll();

            // Visit each edge exiting u
            for (Edge e : u.adjacencies) 
            {
                Vertex v                = e.target;
                double weight           = e.weight;
                double distanceThroughU = u.minDistance + weight;

                if (distanceThroughU < v.minDistance) 
                {
                    vertexQueue.remove(v);
                    v.minDistance = distanceThroughU;
                    v.previous    = u;
                    vertexQueue.add(v);
                }
            }
        }
    }

    /**
     * przechodzi po ścieżce przekształcając ją w listę
     * @param target cel
     * @return lista wierzchołków wchodząca w skład ścieżki
     */
    public static List<Vertex> getShortestPathTo(Vertex target) 
    {
        List<Vertex> path = new ArrayList<Vertex>();

        for (Vertex vertex = target; vertex != null; vertex = vertex.previous) 
        {
            path.add(vertex);
        }

        Collections.reverse(path);

        return path;
    }
}







