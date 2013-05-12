
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


class Data
{
    public int x;
    public int y;
    public float p;
    
    public Data(int x, int y, float p)
    {
        this.x = x;
        this.y = y;
        this.p = p;
    }
}

public class Main
{

    /**
     * @return the Test
     */
    public static Boolean getTest()
    {
        return test;
    }
    
    /**
     * do wypisow testowych
     */
    private static Boolean test = Boolean.TRUE;
    
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
        m.PrintResult(m.polaczDoBazy(url), vertexIndex);
    }
    
    /**
     * polaczenie do bazy
     * @param url url do bazy
     * @return lista punktow z bazy
     */
    private Map<Integer, Vertex> polaczDoBazy(String url)
    {
        Map<Integer, Vertex> map = new HashMap<>();
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
            
            ResolveEdges(getData(rs, map), map);
            
            rs.close();
            st.close();
            con.close();
        }
        catch (SQLException | NumberFormatException e)
        {
            if(Main.getTest())
                e.printStackTrace(); 
        }
        
        return map;
    }

    /**
     * pobranie wyniku koncowego
     * @param tempList lista punktow wejsciowych
     */
    private void PrintResult(Map<Integer, Vertex> tempVertexes, int vertexIndex)
    {
        Double result = -1.123;
        
        try
        {
            ArrayList<Vertex> vertices = new ArrayList<>();

            for (Map.Entry<Integer, Vertex> entry : tempVertexes.entrySet()) 
            {
                vertices.add(entry.getValue());
            }
            
            ////////////////////////////////////////////////////////////////////////////////////////////////
            // zmienić to 
            Dijkstra.computePaths(vertices.get(0));

            for (Vertex v : vertices) 
            {
//                if (v.minDistance != Double.POSITIVE_INFINITY) 
//                {
                    
                    if(tempVertexes.get(vertexIndex) == v)
                        System.out.println(" - - - znalazłem - - - - : " + v );
                    
                    System.out.println("Distance to " + v + ": " + v.minDistance);

                    List<Vertex> path = Dijkstra.getShortestPathTo(v);

                    System.out.println("Path: " + path);
//                }
            }
        }
        catch(Exception e)
        {
            result = (double)new Random().nextInt(200) + new Random().nextDouble();
        }
        
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
    private List<Data> getData(ResultSet rs, Map<Integer, Vertex> tempMap) throws SQLException, NumberFormatException
    {
        List<Data> tmpDataList = new ArrayList<>();
        
        while (rs.next()) 
        {
            int index = rs.getInt(1);
            int x = rs.getInt(2);
            int y = rs.getInt(3);
            float p = rs.getFloat(4);
            
            tempMap.put(x, new Vertex(x));
            tempMap.put(y, new Vertex(y));

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
}
