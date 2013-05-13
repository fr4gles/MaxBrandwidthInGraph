
import java.sql.Array;
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


public class Main
{    
    /**
     * do wypisow testowych
     */
    private static Boolean test = Boolean.FALSE;
    
    /**
     * zbiera dane z całego programu
     */
    public static String degugLog = "";

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

            Main.degugLog =  Main.degugLog.concat(  e.getMessage() + "\n" );
            Main.degugLog =  Main.degugLog.concat(  e.getStackTrace().toString() + "\n" );
        }
        
        
        Main.degugLog =  Main.degugLog.concat( "conn url: "+ url +"\n"+"end vertex: "+vertexIndex +"\n");
        
        Main m = new Main();
        Path path = new Path();
        
        Float result = -1f;
        try
        {
            result = path.Go(vertexIndex, m.polaczDoBazy(url));
        }
        catch(Exception e)
        {
            Main.degugLog = Main.degugLog.concat(e.getMessage() + "\n");
            Main.degugLog = Main.degugLog.concat(e.getStackTrace().toString() + "\n");
            Main.setTest(true);
        }
        
        if(Main.getTest())
            System.out.println(Main.degugLog);
        
        System.out.println("Przepustowość : " + String.format("%.3f", result).replace(",", "."));
    }
    
    /**
     * polaczenie do bazy
     * @param url url do bazy
     * @return lista punktow z bazy
     */
    private ArrayList<Data> polaczDoBazy(String url)
    {
        ArrayList<Data> tmp = new ArrayList<>();
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
                    return null;
                }
            }
                
            tmp = getData(rs);        
            
            rs.close();
            st.close();
            con.close();
        }
        catch (SQLException | NumberFormatException e)
        {
            Main.degugLog =  Main.degugLog.concat(e.getMessage() + "\n");
            Main.degugLog =  Main.degugLog.concat(e.getStackTrace().toString() + "\n");
        }
        return tmp;
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
            Main.degugLog =  Main.degugLog.concat("coś poszło bardzo nie tak :(" + "\n");
            Main.degugLog =  Main.degugLog.concat(e.getMessage() + "\n");
            Main.degugLog =  Main.degugLog.concat(e.getStackTrace().toString() + "\n");
            
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
            
            Main.degugLog =  Main.degugLog.concat(index + " " + x + " " + y + " " +p + "\n");
        }
        
        return tmpDataList;
    }
    
    /**
     * @param aTest the test to set
     */
    public static void setTest(Boolean aTest)
    {
        test = aTest;
    }
    
    
    /**
     * @return the Test
     */
    public static Boolean getTest()
    {
        return test;
    }
}
