<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ page import="bbs.conn" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int bbsID = Integer.parseInt(request.getParameter("idx"));
Connection con = conn.getMySqlConnection();
String sql ="DELETE FROM bbs WHERE bbsID="+bbsID;
PreparedStatement pstmt = con.prepareStatement(sql);
//Query Run
pstmt.executeUpdate(sql);
pstmt.close();
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('삭제완료')");
script.println("location.href='bbs.jsp'");
script.println("</script>");
%>
</body>
</html>