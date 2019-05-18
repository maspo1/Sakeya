<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ page import="bbs.conn" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int bbsID = Integer.parseInt(request.getParameter("idx"));
String bbsTitle =request.getParameter("bbsTitle");
String bbsContent=request.getParameter("bbsContent");
Connection con = conn.getMySqlConnection();
String sql ="UPDATE bbs SET bbsTitle='"+bbs.getBbsTitle()+"', bbsContent='"+bbs.getBbsContent()+"' WHERE bbsID="+bbs.getBbsID();
PreparedStatement pstmt = con.prepareStatement(sql);
//Query Run
pstmt.executeUpdate(sql);
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('수정완료')");
script.println("location.href='bbs.jsp'");
script.println("</script>");
%>
</body>
</html>