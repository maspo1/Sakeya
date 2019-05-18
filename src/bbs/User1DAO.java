package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DBMS에 접근하는 클래스파일
public class User1DAO {

	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet res=null;
	
	public User1DAO() {
		
	
		try {
			String DB_SERVER = "localhost:3306";  
			String DB_USERNAME = "888";          
			String DB_PASSWORD = "dlznfk00";   
			String DB_DATABASE = "jspdb";       
			String DB_TimeZoneSet = "?serverTimezone=Asia/Seoul";
			String jdbcUrl = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE + DB_TimeZoneSet;
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, DB_USERNAME, DB_PASSWORD);
			System.out.println("DB 연결성공");
			System.out.println("DB 로드성공");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//1. 로그인기능
	public int login(String x, String y) {
		/*
		 [함수작동순서]
		
		 함수 login은 매개변수x와 y에 각각 문자열을 받아와서
		 쿼리를 실행하고 res에 저장한다.
		 
		 단, 쿼리를 실행할때 ?자리에는 setString함수를이용 (자리를 지정해주고 x값을 대입)한다.
		 
		 res.next를 실행하여 받아온 y값과 같다면 로그인성공, 아니면 실패
		 */
		String query="SELECT userPassword FROM user1 WHERE userID=?";
		//userID가 x인행에서 userPassword를 검색하는 SQL문
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, x);
			res=pstmt.executeQuery();
			if(res.next()) {
				if(res.getString(1).equals(y)) {
					return 1; //로그인 성공
				}
				else {
					return 0; //비밀번호 불일치
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -2; //데이터베이스 오류
		
	}
	
	//2. 가입기능
	public int join(User1 user) {
		//User1클라스를 상속하는 user라는 이름의 user1변수를 매개변수로 받을 수있음.
		System.out.println("조인함수 실행중..");
		String query = "INSERT INTO user1 VALUES(?,?,?,?,?)";
		
		try {
			System.out.println("User1DAO실행중...");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getUserID()); //겟유저아이디는 리턴값 유저아이디를 가지고있음.
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			//성공할 경우 0이상의 값이 들어간다.
			return pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("문법이 틀렸다아이가..");
		}
		
		return -1; //데이터베이스 오류
	}
	
	public int insert(User1 user) {
		//User1클라스를 상속하는 user라는 이름의 user변수를 매개변수로 받을 수있음.
		String query = "UPDATE user1 SET userPassword=?, userName=?, "
				+ "userGender=?, userEmail=? WHERE userID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserGender());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserID());
			//성공할 경우 0이상의 값이 들어간다.
			System.out.println("값넣기성공;");
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("문법이 틀렸다아이가..");
		}
		
		return -1; //데이터베이스 오류
	}
}