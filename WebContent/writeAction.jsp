<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 로그인페이지에서 userID를 받아서 한명의 사용자에 userID에 넣어주는 것이다 이페이지에 넘어오는게 그대로 담겨질 것이다. -->
<!-- 동작원리 : 폼으로 전달한 bbsTitle과bbsContent를 자바빈으로 가져온다.
 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta httq-equiv="Content-Type" content="text/html; charset="UTF-8">


<title>JSP 게시판 웹 사이트</title>
</head>
<body>

	<!--  자바 코드를 삽입하기 위한 것이다.  -->

	<%
		//로그인된사람은 회원가입에 접속할 수 없게끔 만든것이다.
		String userID = null;
		if (session.getAttribute("userID") != null) { //유저아이디이름으로 세션이 존재하는 회원들은

			//userID가 세션된 값을 담을 수 있게 만든다.
			userID = (String) session.getAttribute("userID"); //유저아이디에 해당 세션값을 넣어준다.
		}

		//로그인 한사람은 또 로그인 할 수 없도록 막을 것이다.
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			//이전페이지로 돌려보내는것이다. 즉 로그인페이지로 돌려버리는 것이다.
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			//입력이 안되었을 경우를 말하는 것이다.
			if (bbs.getBbsTitle() == null || bbs.getBbsContent()==null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				//로그인 페이지에서 값을 넣을경우 여기다가 저장을 하는 것이다.얻어오는건 getUserID랑 getUserpassword를 갖고올 것이다.
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(),userID,bbs.getBbsContent()); 
				//조인기능과 마찬가지로 write함수실행후 결과값을 int로 반환하여 성공여부를 판단한다.
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					//이전페이지로 돌려보내는것이다. 즉 로그인페이지로 돌려버리는 것이다.
					script.println("history.back()");
					script.println("</script>");
				} else {//회원가입이 이루어진 경우이다.
						//세션은 현재 접속한 회원에게 주는 고유한 ID이다.
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}

			}
		}

		
	%>


</body>
</html>