package t3h.vn.k34_dl.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtils {
    static String DB_INFO = "jdbc:mysql://localhost:3306/k34_dl";
    static String USER_NAME = "root";
    static String PASS = "";

    public static Connection getCollection() throws SQLException {
        Connection con = DriverManager.getConnection(DB_INFO, USER_NAME, PASS);
        return con;
    }
}
