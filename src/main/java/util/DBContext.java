package util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection conn = null;

    public DBContext() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            String dbURL = "jdbc:sqlserver://localhost:1433;"
                    + "databaseName=PRJ301_YouTube;"
                    + "user=sa;"
                    + "password=123456;"
                    + "encrypt=true;trustServerCertificate=true;";

            conn = DriverManager.getConnection(dbURL);

            if (conn != null) {
                DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());
                
                // Test if database has data
                try {
                    java.sql.Statement stmt = conn.createStatement();
                    java.sql.ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as userCount FROM Users");
                    if (rs.next()) {
                        System.out.println("DEBUG: Total users in database: " + rs.getInt("userCount"));
                    }
                    rs.close();
                    
                    rs = stmt.executeQuery("SELECT COUNT(*) as videoCount FROM Videos");
                    if (rs.next()) {
                        System.out.println("DEBUG: Total videos in database: " + rs.getInt("videoCount"));
                    }
                    rs.close();
                    stmt.close();
                } catch (Exception e) {
                    System.out.println("DEBUG: Error checking database data: ");
                    e.printStackTrace();
                }
            } else {
                System.out.println("Ket noi that bai (NULL)");
            }
        } catch (SQLException ex) {
            System.out.println("Khong ket noi duoc roi em oi...........");
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DBContext c = new DBContext();
    }
}
