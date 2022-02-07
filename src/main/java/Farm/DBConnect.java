package Farm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DBConnect {

	public static Connection getConn() {
		Connection con=null;
                String dbname = "Farm";
		String loadDriver ="com.mysql.jdbc.Driver"; // driver name for mysql
		String dbURL ="jdbc:mysql://localhost:3303/"+dbname+"?"; // url of the
															// database
		String dbUSERNAME ="root"; // username to coonect db
		String dbPASSWORD =""; // password to connect db

		try {
			Class.forName(loadDriver); // load the driver
			con = DriverManager.getConnection(dbURL, dbUSERNAME, dbPASSWORD);// get
																				// the
																				// connection
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
}
