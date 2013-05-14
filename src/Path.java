
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;

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
    private Map<Integer, Wierzcholek> VertexMap;
    
    /**
     * Funckja uzupełniająca wierzchołki o krawędzie wychodzące z nich
     * wszystko w oparciu o dane z krawędzi
     * @param dataList dane o krawędziach
     * @param map mapa wierzchołków
     */
    private void ResolveEdges(List<Data> dataList, Map<Integer, Wierzcholek> map)
    {
        for(Data d : dataList)
        {
            map.get(d.X).getPrzylegleWierzcholki().add(new Krawedz(map.get(d.Y), d.P));
        }
    }

    /**
     * przekształca map<numer wierzcholka, wierzcholek> na tablicę wierzchołków
     * @param map mapa wierzchołków
     * @return tablica wierzchołków
     */
    private ArrayList<Wierzcholek> ConvertMapOfVertextToList(Map<Integer, Wierzcholek> map)
    {
        ArrayList<Wierzcholek> vertices = new ArrayList<>();
        for (Map.Entry<Integer, Wierzcholek> entry : map.entrySet()) 
        {
            vertices.add(entry.getValue());
        }
        return vertices;
    }

    /**
     * uzupełnia mapę wierzchołków z dancyh o krawędziach
     * @return mapa wierzchołków
     */
    private Map<Integer, Wierzcholek> GetGraphFromData()
    {
        Map<Integer, Wierzcholek> map = new HashMap<>();
        
        for(Data d: DataList)
        {
            map.put(d.X, new Wierzcholek(d.X));
            map.put(d.Y, new Wierzcholek(d.Y));
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
        
        ArrayList<Wierzcholek> vertices = ConvertMapOfVertextToList(VertexMap);

        try
        {
            for (Wierzcholek v : vertices)
            {
                if(v.getId() == 1)
                {
                    DijkstraAlgorithm.wyznaczSciezki(v);
                    break;
                }
            }
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
            return false;
        }
                
        for (Wierzcholek v : vertices) 
        {
            if (v.getMinDistance() != Double.POSITIVE_INFINITY) 
            {
                if(VertexMap.get(vertexIndex).getId() == v.getId())
                {
                    Main.DegugLog =  Main.DegugLog.concat(" - - - znalazłem - - - - - - - - - - - - - - - -  : " + v +"\n");
                    found = true;
                }

                Main.DegugLog =  Main.DegugLog.concat( "Path: " + DijkstraAlgorithm.getNajkrotszaDrogaDo(v) + "\n" );
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
        
        Float result = DataList.get(0).P;
        
        for(; DataList.size() > 2 ; DataList.remove(DataList.get(0)))
        {
            if(!PrepareToFindMaxBrandwidth(vertexIndex))
            {
                Main.DegugLog =  Main.DegugLog.concat( "STOP --> " + DataList.get(0).P + "\n" );
                break;
            }
            
            result = DataList.get(0).P;
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
        return o1.P.compareTo(o2.P);
    }
}

/**
 * Klasa przechowująca dane z bazy
 * główne krawędzie (X,Y)
 * oraz przepustowość P
 * @author Michal
 */
class Data
{
    /**
     * identyfikator pierwszego wierzcholka
     */
    public int X;
    
    /**
     * identyfikator drugiego wierzcholka
     */
    public int Y;
    
    /**
     * wartosc przepustowości
     */
    public Float P;
    
    /**
     * konstruktor inicjalizujacy
     * @param X wierzchołek A
     * @param Y wierzchołek B
     * @param P przepustowość
     */
    public Data(int x, int y, float p)
    {
        this.X = x;
        this.Y = y;
        this.P = p;
    }
}





/**
 * klasa przechowująca krawędzie pomiędzy wierzchołkami
 * @author Michal
 */
class Krawedz 
{
    /**
     * cel krawędzi
     */
    private final Wierzcholek cel;
    
    /**
     * waga/przepustowość krawędzi
     */
    private final double przepustowosc;

    /**
     * konstruktor
     * @param argTarget cel
     * @param argBrandwidth waga
     */
    public Krawedz(Wierzcholek argTarget, double argBrandwidth) 
    {
        cel = argTarget;
        przepustowosc = argBrandwidth;
    }

    /**
     * @return the target
     */
    public Wierzcholek getTarget()
    {
        return cel;
    }

    /**
     * @return the brandwidth
     */
    public double getBrandwidth()
    {
        return przepustowosc;
    }
}




/**
 * Klasa przechowująca wierzchołki
 * @author Michal
 */
class Wierzcholek implements Comparable<Wierzcholek> 
{
    /**
     * zmienna opusjąca minimalną odległość pomiędzy wierzchołkami
     */
    private double              minimalnaOdleglosc = Double.POSITIVE_INFINITY;
    
    /**
     * identyfikator wierzchołka
     */
    private final int            id;
    
    /**
     * zmienna opisujaca przylegle wierzcholki
     */
    private ArrayList<Krawedz>      przylegleWierzcholki;
    
    /**
     * poprzedzajacy wierzcholek.
     * Dzięki poprzedzajacym wierzcholkom jestemy w stanie odtworzyc sciezke jaka poruszal sie algorytm
     * jest to referencja na poprzedzajacy w sciezce wierzcholek.
     */
    private Wierzcholek               poprzedniWierzcholek;

    public Wierzcholek(int argName) 
    {
        id = argName;
        przylegleWierzcholki = new ArrayList<>();
    }

    @Override
    public String toString() 
    {
        return "v"+getId();
    }

    @Override
    public int compareTo(Wierzcholek other) 
    {
        return Double.compare(getMinDistance(), other.getMinDistance());
    }

    /**
     * @return the minDistance
     */
    public double getMinDistance()
    {
        return minimalnaOdleglosc;
    }

    /**
     * @param minDistance the minDistance to set
     */
    public void setMinDistance(double minDistance)
    {
        this.minimalnaOdleglosc = minDistance;
    }

    /**
     * @return the id
     */
    public int getId()
    {
        return id;
    }

    /**
     * @return the przylegleWierzcholki
     */
    public ArrayList<Krawedz> getPrzylegleWierzcholki()
    {
        return przylegleWierzcholki;
    }

    /**
     * @param przylegleWierzcholki the przylegleWierzcholki to set
     */
    public void setPrzylegleWierzcholki(ArrayList<Krawedz> przylegleWierzcholki)
    {
        this.przylegleWierzcholki = przylegleWierzcholki;
    }

    /**
     * @return the poprzedniWierzcholek
     */
    public Wierzcholek getPoprzedniWierzcholek()
    {
        return poprzedniWierzcholek;
    }

    /**
     * @param poprzedniWierzcholek the poprzedniWierzcholek to set
     */
    public void setPoprzedniWierzcholek(Wierzcholek poprzedniWierzcholek)
    {
        this.poprzedniWierzcholek = poprzedniWierzcholek;
    }
}

/**
 * klasa zawierajaca potrzebne funkcje do wyznaczenia sciezki algorytmem Dijkstry
 * @author Michal
 */
class DijkstraAlgorithm 
{
    /**
     * Funkcja obliczająca zgodnie z algorytmem Djikstry najkrótszą ścieżkę do celu
     * @param source źródłowy wierzchołek
     */
    public static void wyznaczSciezki(Wierzcholek source) 
    {
        source.setMinDistance(0.);

        PriorityQueue<Wierzcholek> vertexQueue = new PriorityQueue<>();

        vertexQueue.add(source);

        while (!vertexQueue.isEmpty()) 
        {
            Wierzcholek u = vertexQueue.poll();

            for (Krawedz e : u.getPrzylegleWierzcholki()) 
            {
                Wierzcholek v           = e.getTarget();
                double weight           = e.getBrandwidth();
                double distanceThroughU = u.getMinDistance() + weight;

                if (distanceThroughU < v.getMinDistance()) 
                {
                    vertexQueue.remove(v);
                    v.setMinDistance(distanceThroughU);
                    v.setPoprzedniWierzcholek(u);
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
    public static List<Wierzcholek> getNajkrotszaDrogaDo(Wierzcholek target) 
    {
        List<Wierzcholek> path = new ArrayList<>();

        for (Wierzcholek vertex = target; vertex != null; vertex = vertex.getPoprzedniWierzcholek()) 
        {
            path.add(vertex);
        }

        Collections.reverse(path);

        return path;
    }
}







