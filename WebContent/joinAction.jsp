<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.User1DAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="bbs.User1" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta httq-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>사케야</title>
</head>
<body>
	<%
		//로그인된사람은 회원가입에 접속할 수 없게끔 만든것이다.
		String userID = null;
		if (session.getAttribute("userID") != null) {
			//userID가 세션된 값을 담을 수 있게 만든다.
			userID = (String) session.getAttribute("userID");
		}
		//로그인 한사람은 또 로그인 할 수 없도록 막을 것이다.
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			//-1일경우 아이디가 존재하지 않는다.
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		//입력안된 경우
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
				|| user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			User1DAO userDAO = new User1DAO();
			int result = userDAO.join(user); //조인함수 실행하고 결과값(-1이냐,아니냐)을 int result로 반환;
			if (result == -1) {//중복이거나 데베오류인경우
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 이미 존재합니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {//가입성공한 경우
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입에 성공하였습니다.^^')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}

		}
	%>


</body>
</html>