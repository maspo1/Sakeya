<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="bbs.conn" 
    import="bbs.User1DAO" import="java.io.PrintWriter"%>
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
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<%
User1DAO x = new User1DAO();
x.insert(user);
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('수정에 성공하였습니다.^^')");
script.println("location.href='main.jsp'");
script.println("</script>");

%>
</body>
</html>