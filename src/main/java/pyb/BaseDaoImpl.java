package pyb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDaoImpl {
	static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
		final String URL = "jdbc:mysql://" + System.getenv("MYSQL_ADDR") + ":3306/letterdb";
		final String USER = "root";
		final String PASSWD = "ihatesql";
		return DriverManager.getConnection(URL, USER, PASSWD);
	}
}
