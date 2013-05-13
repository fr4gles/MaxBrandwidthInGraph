
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
    private static Boolean test = Boolean.FALSE;
    public static String degugLog = "";

    /**
     * @param aTest the test to set
     */
    public static void setTest(Boolean aTest)
    {
        test = aTest;
    }
    

    private ArrayList<Data> DataList;
    private Map<Integer, Vertex> VertexMap;
    private Vertex SourceVertex;
    
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
            Main.setTest(true);
            url = "jdbc:sqlserver://MICHAL-KOMPUTER\\SQLEXPRESS;databaseName=ztp;user=user;password=user";
        }
        
        Main.degugLog += " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" + "\n";
        
        try
        {
            vertexIndex = Integer.parseInt(args[1]);
        }
        catch(Exception e)
        {
            Main.setTest(true);

            Main.degugLog += e.getMessage() + "\n";
            Main.degugLog += e.getStackTrace().toString() + "\n";
        }
        
        
        Main.degugLog +="conn url: "+ url +"\n"+"end vertex: "+vertexIndex +"\n";
        
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
            try
            {
                rs = st.executeQuery("SELECT * FROM Gtable");
            }
            catch(Exception e)
            {
                rs = HandleUnexpected(rs, st);
                if(rs == null)
                {
                    System.out.println(Main.degugLog);
                    return;
                }
            }
                
            DataList = getData(rs);        
            
            rs.close();
            st.close();
            con.close();
        }
        catch (SQLException | NumberFormatException e)
        {
            Main.degugLog += e.getMessage() + "\n";
            Main.degugLog += e.getStackTrace().toString() + "\n";
        }
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
        catch(Exception e)
        {
            Main.degugLog += "coś poszło bardzo nie tak :(" + "\n";
            Main.degugLog += e.getMessage() + "\n";
            Main.degugLog += e.getStackTrace().toString() + "\n";
            
            Main.setTest(true);
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
            tmpDataList.add(new Data(y,x,p));
            
            Main.degugLog += index + " " + x + " " + y + " " +p + "\n";
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

        for (Vertex v : vertices)
        {
            if(v.name.equals("v1"))
            {
                try
                {
                    Dijkstra.computePaths(vertices.get(vertices.indexOf(v)));
                }
                catch(ArrayIndexOutOfBoundsException e)
                {
                    return false;
                }
                break;
            }
        }
                
        for (Vertex v : vertices) 
        {
            if (v.minDistance != Double.POSITIVE_INFINITY) 
            {

                if(VertexMap.get(vertexIndex) == v)
                    found = true;

                if(VertexMap.get(vertexIndex) == v)
                    Main.degugLog += " - - - znalazłem - - - - - - - - - - - - - - - -  : " + v +"\n";

                List<Vertex> path = Dijkstra.getShortestPathTo(v);
                Main.degugLog += "Distance to " + v + ": " + v.minDistance + "\n"
                            + "Path: " + path + "\n";
            }
        }
        
        return found;
    }
    
    private boolean FindMaxBrandwidth(int vertexIndex)
    {
        if(VertexMap != null)
            VertexMap.clear();
        
        VertexMap = GetGraphFromData();
        ResolveEdges(DataList, VertexMap);            

        return ResolveProblem(vertexIndex);
    }
    
    private Float Go(int vertexIndex)
    {
        Collections.sort(DataList, new CompareByP());
        
        Float result = DataList.get(0).p;
        
        for(; DataList.size() > 2 ; DataList.remove(DataList.get(0)))
        {
            if(!FindMaxBrandwidth(vertexIndex))
            {
                Main.degugLog += "STOP --> " + DataList.get(0).p + "\n";
                break;
            }
            
            result = DataList.get(0).p;
        }
        
        
        if(Main.getTest())
            System.out.println(Main.degugLog);

        System.out.println("Przepustowość : " + String.format("%.3f", result).replace(",", "."));

        return result;
    }
}
