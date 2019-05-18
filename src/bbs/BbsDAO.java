package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn=null;
	private ResultSet res=null;
	public BbsDAO() {
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
	//게시판에 시간을 저장해줄 것이다.
	public String getDate() {

		String query="SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			res = pstmt.executeQuery();
			if(res.next()) {
				return res.getString(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ""; //데이터베이스 오류

	}

	//게시판에 마지막 번호의 글에서 +1을 해야되니 그거때문에 가져올려는 것이다.
	public int getNext() {

		String query="SELECT bbsID from bbs ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			res = pstmt.executeQuery();
			if(res.next()) {
				return res.getInt(1)+1;//게시글에 다음번호를 쓰기 위해 1을 더했다.
			}
			return 1;//첫번째 게시물인 경우 1을 반환.

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getNext문법오류아이가zz");
		}
		return -1; //데이터베이스 오류
	}

	//실제로 글을 작성하는 함수
	public int write(String bbsTitle, String userID, String bbsContent) {
		String query="INSERT INTO bbs VALUES (?,?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); //1은 게시글 확인을 위한 코드입니다.
			pstmt.setInt(7, 9087);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("write문법오류아이가..");
		}
		return -1; //데이터베이스 오류
	}
	
	public int insert(int bbsID, String bbsTitle, String bbsContent, String userID) {
		String query="INSERT INTO bbs VALUES (?,?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bbsID);
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); //1은 게시글 확인을 위한 코드입니다.
			pstmt.setInt(7, 9087);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("insert문법오류아이가..");
		}
		return -1; //데이터베이스 오류
	}
	
	public int delete(String bbsTitle, String userID, String bbsContent) {
		String query="INSERT INTO bbs VALUES (?,?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); //1은 게시글 확인을 위한 코드입니다.
			pstmt.setInt(7, 9087);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("write문법오류아이가..");
		}
		return -1; //데이터베이스 오류
	}

	//게시판 목록 구현하기
	public ArrayList<Bbs> getList(int pageNumber) {
		String query="select * from (select * from bbs where bbsID <? and bbsAvailable=1 order by bbsID desc) where rownum<=10";
		/*
		 * "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
  ArrayList<Bbs> list = new ArrayList<Bbs>();
		 */
		//Bbs에서나오는 걸 보관할수 있는 인스턴스를 만들자
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getNext() - (pageNumber -1)*10);
			//게시글의 개수에 따라 값으로 나오게 할려고 그래서 6보다 작게 할려고 모든 글자가 다 나오게 할려고 이다.그래서 일부러 함수를 만든 것이다.
			res = pstmt.executeQuery();
			//System.out.println("여기에러");
			if(res.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(res.getInt(1));
				bbs.setBbsTitle(res.getString(2));
				bbs.setUserID(res.getString(3));
				bbs.setBbsDate(res.getString(4));
				bbs.setBbsContent(res.getString(5));
				bbs.setBbsAvailable(res.getInt(6));
				list.add(bbs);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
	//다음페이지 버튼이 없어야 한다.왜냐하면 글을 10개씩 출력을 하는데 없는경우 알려주거나 할려고 페이징처리를 위해 만들었다.
	//게시물이 10,20단위로 끊을때 게시물이 10개라면 다음 페이지가 없어야된다.
	public boolean nextPage(int pageNumber) {
		
		String query="select * from (select * from bbs where bbsid <? and bbsAvailable=1 order by bbsID desc) where rownum<=10";
		
		
		//String query="select * from bbs where bbsID < ? AND bbsAvailable = 1";
		
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
			//게시글의 개수에 따라 값으로 나오게 할려고 그래서 6보다 작게 할려고 모든 글자가 다 나오게 할려고 이다.그래서 일부러 함수를 만든 것이다.
			res = pstmt.executeQuery();
			
			if(res.next()) {
				return true;//게시글 20개면 페이지 2개 , 게시글 21개면 3으로 늘어나는 것이다.
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}


}