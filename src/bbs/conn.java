package bbs;
import java.sql.*;
public class conn {
	private static Connection con = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	public static Connection getMySqlConnection() {
		try {
			String DB_SERVER = "localhost:3306";  
			String DB_USERNAME = "888";          
			String DB_PASSWORD = "dlznfk00";   
			String DB_DATABASE = "jspdb";       
			String DB_TimeZoneSet = "?serverTimezone=Asia/Seoul";
			String jdbcUrl = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE + DB_TimeZoneSet;
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcUrl, DB_USERNAME, DB_PASSWORD);
			System.out.println("DB 연결성공");
			System.out.println("DB 로드성공");
			
		} catch (Exception e) {

			System.out.println("DB 로드 실패 " + e.toString());
		}
		
		return con;
	}
	
	public static ResultSet select() {
		try {
			con = getMySqlConnection();
			pstmt = con.prepareStatement("select * from join_table");
			rs = pstmt.executeQuery();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

}
