
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


class Data
{
    public int x;
    public int y;
    public Float p;
    
    public Data(int x, int y, float p)
    {
        this.x = x;
        this.y = y;
        this.p = p;
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

public class Main
{    
    /**
     * do wypisow testowych
     */
    private static Boolean test = Boolean.TRUE;
    

    private ArrayList<Data> DataList;
    private Map<Integer, Vertex> VertexMap;
    
    /**
     * @return the Test
     */
    public static Boolean getTest()
    {
        return test;
    }

    
    /**
     * main 
     * @param args wejscie
     */
    public static void main(String args[])
    {
        String url = "";
        int vertexIndex = -1;
        try
        {
            url = args[0];
        }
        catch(Exception e)
        {
            url = "jdbc:sqlserver://MICHAL-KOMPUTER\\SQLEXPRESS;databaseName=ztp;user=user;password=user";
        }
        
        try
        {
            vertexIndex = Integer.parseInt(args[1]);
        }
        catch(Exception e)
        {
            Main.test = true;
            
            if(Main.getTest())
                e.printStackTrace();
            
            return;
        }
        
        if(Main.getTest())
            System.out.println("conn url: "+ url +"\n"+"end vertex: "+vertexIndex);
        
        Main m = new Main();
        m.polaczDoBazy(url);
        m.Go(vertexIndex);
    }
    
    /**
     * polaczenie do bazy
     * @param url url do bazy
     * @return lista punktow z bazy
     */
    private void polaczDoBazy(String url)
    {
        try 
        {
            Connection con = DriverManager.getConnection(url);
            Statement st = con.createStatement();
            
            ResultSet rs = null;
//            try
//            {
                rs = st.executeQuery("SELECT * FROM Gtable");
//            }
//            catch(Exception e)
//            {
//                rs = HandleUnexpected(rs, st);
//                if(rs == null)
//                    return null;
//            }
                
            DataList = getData(rs);        
            
            rs.close();
            st.close();
            con.close();
        }
        catch (SQLException | NumberFormatException e)
        {
            if(Main.getTest())
                e.printStackTrace(); 
        }
    }

    /**
     * pobranie wyniku koncowego
     * @param tempList lista punktow wejsciowych
     */
    private void PrintResult(double result)
    {
               
//        result = (double)new Random().nextInt(200) + new Random().nextDouble();
        
        System.out.println("Maksimum : " + String.format("%.3f", result).replace(",", "."));
    }

    /**
     * jak cos pojdzie nie tak
     * @param rs wejscie
     * @param st statemenr
     * @return wynik
     */
    private ResultSet HandleUnexpected(ResultSet rs, Statement st)
    {
        try
        {
            rs = st.executeQuery("SELECT * FROM `Gtable`");
        }
        catch(Exception ee)
        {
            rs = HandleMoreUnexpected(rs, st);
        }
        return rs;
    }

    /**
     * ja cos pojdzie jeszcze bardziej nie tak :(
     * @param rs wejscie
     * @param st statement
     * @return wynik
     */
    private ResultSet HandleMoreUnexpected(ResultSet rs, Statement st)
    {
        try
        {
            rs = st.executeQuery("SELECT * FROM 'Gtable'");
        }
        catch(Exception eee)
        {
            if(Main.getTest())
                System.out.println("cos poszlo nie tak :(");
        }
        return rs;
    }
    
    /**
     * pobranie danych
     * @param rs rs
     * @param tempList lista
     * @throws SQLException t
     * @throws NumberFormatException t
     */
    private ArrayList<Data> getData(ResultSet rs) throws SQLException, NumberFormatException
    {
        ArrayList<Data> tmpDataList = new ArrayList<>();
        
        while (rs.next()) 
        {
            int index = rs.getInt(1);
            int x = rs.getInt(2);
            int y = rs.getInt(3);
            float p = rs.getFloat(4);
            
            tmpDataList.add(new Data(x,y,p));
            
            if(getTest())
                System.out.println(index + " " + x + " " + y + " " +p);
        }
        
        return tmpDataList;
    }
    
    private void ResolveEdges(List<Data> dataList, Map<Integer, Vertex> map)
    {
        for(Data d : dataList)
        {
            map.get(d.x).adjacencies.add(new Edge(map.get(d.y), d.p));
        }
    }

    private ArrayList<Vertex> ConvertMapOfVertextToList(Map<Integer, Vertex> tempVertexes)
    {
        ArrayList<Vertex> vertices = new ArrayList<>();
        for (Map.Entry<Integer, Vertex> entry : tempVertexes.entrySet()) 
        {
            vertices.add(entry.getValue());
        }
        return vertices;
    }

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
    
    private boolean ResolveProblem(int vertexIndex)
    {
        boolean found = false;
        
        ArrayList<Vertex> vertices = ConvertMapOfVertextToList(VertexMap);

        ////////////////////////////////////////////////////////////////////////////////////////////////
        // zmienić to z 0 na 1
        Dijkstra.computePaths(vertices.get(0));

        for (Vertex v : vertices) 
        {
//                if (v.minDistance != Double.POSITIVE_INFINITY) 
//                {

                if(VertexMap.get(VertexMap) == v)
                    found = true;

                if(Main.getTest())
                {
                    if(VertexMap.get(vertexIndex) == v)
                        System.out.println(" - - - znalazłem - - - - - - - - - - - - - - - -  : " + v );
                    System.out.println("Distance to " + v + ": " + v.minDistance);
                    List<Vertex> path = Dijkstra.getShortestPathTo(v);
                    System.out.println("Path: " + path);
                }

//                }
        }
        
        return found;
    }
    
    private Float Go(int vertexIndex)
    {
        Collections.sort(DataList, new CompareByP());
        
        Float result = DataList.get(0).p;
        
        for(int i=0; i < DataList.size(); ++i)
        {
            if(VertexMap != null)
                VertexMap.clear();
            VertexMap = GetGraphFromData();
            ResolveEdges(DataList, VertexMap);
        
            
            
            if(ResolveProblem(vertexIndex))
            {
                DataList.remove(0);
                continue;
            }
            
            result = DataList.get(i).p;
            
        }
        
        if(Main.getTest())
        {
            System.out.println(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
            System.out.println("Obecny wynik: "+ result+"\n");
        }
        
        return result;
    }
}
