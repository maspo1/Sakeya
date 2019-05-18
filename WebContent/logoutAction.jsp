<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta httq-equiv="Content-Type" content="text/html; charset="UTF-8">


<title>JSP 게시판 웹 사이트</title>
</head>
<body>

	<!--  자바 코드를 삽입하기 위한 것이다.  -->

	<%
		//로그아웃 할경우 세션의 값을 없앨 것이다.
		session.invalidate();
	%>
	<!-- main.jsp으로 가면 끝이다. -->
	<script>
		location.href = 'main.jsp';
	</script>


</body>
</html>