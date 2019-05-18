<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="euc-kr"%>
	<!--  지시어 삽입 스크립트 문장이 실행될수 있도록 할것이다. -->
	<%@ page import="java.io.PrintWriter" %>
	<%@ page import="bbs.BbsDAO" %>
	<%@ page import="bbs.Bbs" %>
	<%@ page import="bbs.conn" %>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta httq-equiv="Content-Type" content="text/html; charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
<title>사케야 - 프리미엄 일본사케 직구쇼핑</title>
</head>
<script type="text/javascript">
</script>
<body>
	<%
		//로그인된사람은 로그인정보를 담을수 있도록 만들것이다.
		String userID=null;
		String userPassword=null;
		if(session.getAttribute("userID") != null){ //
			userID = (String) session.getAttribute("userID");
			userPassword = (String) session.getAttribute("userPassword");
		}
		//몇번째 페이지인지 알려주기 위해서이다.
		int pageNumber=1;//기본 페이지를 의미한다.
		if(request.getParameter("pageNumber") !=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
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
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">사케야</a>
		</div>
		<!--  위에 data-target이름과 똑같은걸 넣어줘야한다. -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
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
				if(userID ==null){
					%>	
				<ul class="nav navbar-nav navbar-right">
				<!--  오른쪽에 넣어줄 것이다. -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a> 
					<!-- #을 쓴이유는 가리키는 링크가 더이상 없다는걸 알려주는 것이다. -->
					<!--  접속하기버튼을 누르면 아래 뜨도록 할것이다. -->
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
			</ul>
			</li>
			</ul>
				<% 
				}else{
					%>
				<!--  로그인 되어있는 사람들이 볼수 있는 화면 -->
						<ul class="nav navbar-nav navbar-right">
				<!--  오른쪽에 넣어줄 것이다. -->
				<li class="dropdown">
				<li>반갑습니다.<%=userID %>님</li>
				<a href="mem_delete.jsp" class="dropdown-toggle" 
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">회원관리<span class="caret"></span></a> 
					<!--  접속하기버튼을 누르면 아래 뜨도록 할것이다. -->
					<ul class="dropdown-menu">
					<!-- 로그아웃을 눌러서 링크를 타고 들어갔을 때는 로그아웃페이지가서 세션해제하도록 해보자 -->
					    <li><a href="mem_admin.jsp">정보수정</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
			</ul>
			</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<!--  게시판 화면의 글을 넣어줄것이고 글이 일렬로 정리되는 형태가 되어야 한다. 그러므로 간단히 테이블을 만들어줘야한다. -->
	<div class="container">
		<div class="row"><!-- 이거 방금 추가함  -->
	<!--  회색 비슷하게 갈것이다. -->
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	
	<!--  테이블의 제목부분을 말하는 것으로서 가장 윗줄을 말하는 것이다. -->
	<thead>
	
	<!-- tr은 테이블하나의 행을 말한다. th는 하나의 속성을 말한다.-->
	<tr>
		<th style="background-color : #eeeeee; text-align: center;">번호</th>
		<th style="background-color : #eeeeee; text-align: center;">제목</th>
		<th style="background-color : #eeeeee; text-align: center;">작성자</th>
		<th style="background-color : #eeeeee; text-align: center;">작성일</th>
		<th style="background-color : #eeeeee; text-align: center;">조회수</th>
	</tr>
	</thead>
	
	<tbody>
	
		<!-- 게시글을 뽑아올수 있도록 할것이다. -->
		<%
		Connection con = conn.getMySqlConnection();
		String sql = "select * from bbs";
	    PreparedStatement pstmt1 = con.prepareStatement(sql);
	    ResultSet rs = pstmt1.executeQuery();
	    int bbsID,readcnt,idx;
	    String bbsTitle,userID2,bbsDate=null;
	    while(rs.next()){
	         bbsID=rs.getInt("bbsID");
	         bbsTitle=rs.getString("bbsTitle");
	         userID2 = rs.getString("userID");
	         bbsDate=rs.getString("bbsDate");
	         readcnt=rs.getInt("readcnt");
        %>
	         <td><%=bbsID %></td>
	         <td><a href="bbsView.jsp?idx=<%=bbsID %>"><%=bbsTitle %></a></td>
	         <td><%=userID2 %></td>
	         <td><%=bbsDate %></td>
	         <td><%=readcnt %></td>
	         </tr>
	         <%
	    }
	         %>
	</tbody>
	</table>
	<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>
