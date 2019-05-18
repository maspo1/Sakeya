<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!--  지시어 기능이다. -->
	<%@ page import="bbs.User1DAO" %>
	<%@ page import="java.io.PrintWriter" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	<!-- 로그인페이지에서 userID를 받아서 한명의 사용자에 userID에 넣어주는 것이다 이페이지에 넘어오는게 그대로 담겨질 것이다. -->
	<jsp:useBean id="user" class="bbs.User1" scope="page" />
	<jsp:setProperty name="user" property="userID" />
	<jsp:setProperty name="user" property="userPassword" />
	
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta httq-equiv="Content-Type" content="text/html; charset="UTF-8">


<title>JSP 게시판 웹 사이트</title>
</head>
<body>

<!--  자바 코드를 삽입하기 위한 것이다.  -->

<%

	String userID=null;
	String userPassword=null;
	if(session.getAttribute("userID")!= null){
		
		//세션에 있는 값을 불러와서 userID에 담음.
		userID = (String) session.getAttribute("userID");
		userPassword = (String) session.getAttribute("userPassword");
	}
	
	//로그인 한사람은 또 로그인 할 수 없도록 막을 것이다.
	if(userID !=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		//-1일경우 아이디가 존재하지 않는다.
		script.println("alert('이미 로그인이 되어있습니다.')");
		
		//이전페이지로 돌려보내는것이다. 즉 로그인페이지로 돌려버리는 것이다.
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}


//로그인 페이지에서 값을 넣을경우 여기다가 저장을 하는 것이다.얻어오는건 getUserID랑 getUserpassword를 갖고올 것이다.
	User1DAO userDAO = new User1DAO();
	int result=userDAO.login(user.getUserID(), user.getUserPassword());
	if(result==1){
		
		//세션은 현재 접속한 회원에게 주는 고유한 ID이다.
		session.setAttribute("userID", user.getUserID());
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		//로그인 성공시 이페이지 넘어가게끔 할것이다.
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
		else if(result==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
			//0일경우 비밀번호가 틀린 경우이다.
			script.println("alert('비밀번호가 틀립니다.')");
			
			//이전페이지로 돌려보내는것이다. 즉 로그인페이지로 돌려버리는 것이다.
			script.println("history.back()");
			script.println("</script>");
	}
		else if(result==-1){//아이디가 없는 경우이다.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
			//-1일경우 아이디가 존재하지 않는다.
			script.println("alert('존재하지 않는 아이디입니다.')");
			
			//이전페이지로 돌려보내는것이다. 즉 로그인페이지로 돌려버리는 것이다.
			script.println("history.back()");
			script.println("</script>");
	}
		else if(result==-2){//이거인경우엔 user1DAO에 리턴값을 -2 해놓았기때문이다.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			
			//로그인 성공시 이페이지 넘어가게끔 할것이다.
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			
			//이전페이지로 돌려보내는것이다. 즉 로그인페이지로 돌려버리는 것이다.
			script.println("history.back()");
			script.println("</script>");
	}
%>


</body>
</html>