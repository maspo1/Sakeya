<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--  지시어 삽입 스크립트 문장이 실행될수 있도록 할것이다. -->
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*" %>
<%@ page import="bbs.conn"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta httq-equiv="Content-Type" content="text/html; charset= "UTF-8" >
<!--  반응형 웹을 위해서 meta date를 넣어주었다. 핸드폰과 사이트 둘다 봤을때 깔끔하게 보이게 하기 위해서이다. -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
<title>사케야 - 프리미엄 일본사케 직구쇼핑</title>
</head>
<body>
	<%
		//로그인된사람은 로그인정보를 담을수 있도록 만들것이다.
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<!-- 네비게이션을 구현할 것인데 네비게이션이란  하나의 웹사이트에 전반적인 구성을 보여주는 역할을 한다.-->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<!-- 헤더라는건 홈페이지의 로고같은걸 넣는것이다. -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!--  작대기의 역할이라고 생각하면 된다 우측 상단 줄이면 나타난다. -->
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">사케야</a>
		</div>

		<!--  위에 data-target이름과 똑같은걸 넣어줘야한다. -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<!--  하나의 리스트 같은걸 보여줄때 사용하는 것이다. -->
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">소개</a></li>
				<li><a href="sake1.jsp">다이긴죠</a></li>
				<li><a href="sake2.jsp">긴죠</a></li>
				<li><a href="sake3.jsp">준마이</a></li>
				<li><a href="sake4.jsp">혼죠조</a></li>
				<li><a href="sake5.jsp">보통주</a></li>
				<li><a href="sake6.jsp">소주</a></li>
				<!-- 하나의 원소를 넣는 것이다. -->
				<li><a href="bbs.jsp">게시판</a></li>
				<!-- 하나의 원소를 넣는 것이다. -->
			</ul>

			<!-- 로그인 되어있지 않은 경우만 나오게 할것이다.즉 로그인 되어있지 않은 사람들이 볼 수 있는 화면 -->
			<%
				if (userID == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('로그인을 하세요')");
					//이전페이지로 돌려보내는것이다. 즉 로그인페이지로 돌려버리는 것이다.
					script.println("location.href='login.jsp'");
					script.println("</script>");
			%>
			<%} else{
				Connection con = conn.getMySqlConnection();
				String bbsTitle = null;
				String bbsContent =null;
				String sql = "select bbsTitle, bbsContent from bbs where bbsID=?";
			    PreparedStatement pstmt1 = con.prepareStatement(sql);
			    int idx= Integer.parseInt(request.getParameter("idx")); //from bbs.jsp href link
			    pstmt1.setInt(1,idx); //set sql "?"
			    ResultSet rs = pstmt1.executeQuery();
			    
			    while(rs.next()){
			    	bbsTitle = rs.getString("bbsTitle");
					bbsContent = rs.getString("bbsContent");
					out.println("무사통과");
			    }%>
			    
			<!--  로그인 되어있는 사람들이 볼수 있는 화면 -->
			<ul class="nav navbar-nav navbar-right">
				<!--  오른쪽에 넣어줄 것이다. -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a> <!-- #을 쓴이유는 가리키는 링크가 더이상 없다는걸 알려주는 것이다. -->

					<!--  접속하기버튼을 누르면 아래 뜨도록 할것이다. -->
					<ul class="dropdown-menu">
						<!-- 로그아웃을 눌러서 링크를 타고 들어갔을 때는 로그아웃페이지가서 세션해제하도록 해보자 -->
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!--  게시판 화면의 글을 넣어줄것이고 글이 일렬로 정리되는 형태가 되어야 한다. 그러므로 간단히 테이블을 만들어줘야한다. -->
	<div class="container">
		<div class="row">
				<!--  회색 비슷하게 갈것이다. -->
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<!--  테이블의 제목부분을 말하는 것으로서 가장 윗줄을 말하는 것이다. -->
					<thead>
						<!-- tr은 테이블하나의 행을 말한다. th는 하나의 속성을 말한다.-->
						<tr>
							<!-- 2개의 열만 들어갈수 있도록 해보겠다. -->
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">글 출력</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<!-- 한개의 예시 데이터를 넣어볼 것이다. -->
							<td><input type="text" class="form-control" readonly="readonly"
								placeholder="<%=bbsTitle %>" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<!--  장문의 글을 작성할때 textarea를 쓴다. 크기가 커지지 않게 350으로 고정하겠다.-->
							<td><textarea class="form-control" placeholder="글 내용" readonly="readonly"
									name="bbsContent" maxlength="2048" style="height: 350px"><%=bbsContent %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="button" class="btn btn-primary pull-right" value="수정" onclick="window.location='bbsModify.jsp?idx=<%= idx%>'">
				<input type="button" class="btn btn-primary pull-right" value="삭제" onclick="window.location='bbsDeleteAction.jsp?idx=<%= idx%>'">
				<form method="post" action="bbs.jsp">
				<input type="submit" class="btn btn-primary pull-right" value="목록으로" name="list">
				</form>
				
		</div>
	</div>	
				<%} %>
</body>
</html>