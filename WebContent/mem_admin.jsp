<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta httq-equiv="Content-Type" content="text/html; charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
<!--  반응형 웹을 위해서 meta date를 넣어주었다. 핸드폰과 사이트 둘다 봤을때 깔끔하게 보이게 하기 위해서이다. -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>사케야 - 프리미엄 일본사케 직구쇼핑</title>
<%
String userID=(String)session.getAttribute("userID");
%>
</head>
<body>
	<!-- 네비게이션 구현 시작 :사이트전반 레이아웃 설정-->
	<nav class="navbar navbar-default">
		<!-- 1.나브헤더 -->
		<div class="navbar-header">
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
			<ul class="nav navbar-nav navbar-right">
				<!--  오른쪽에 넣어줄 것이다. -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a> <!-- #을 쓴이유는 가리키는 링크가 더이상 없다는걸 알려주는 것이다. -->

					<!--  접속하기버튼을 누르면 아래 뜨도록 할것이다. -->
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="memAdminAction.jsp">
				<h3 style="text-align: center;">회원정보 수정</h3>
				<div class="form-group">
					<input type="text" class="form-control"
						name="userID" maxlength="20" readonly="readonly" value="<%=userID %>">
				</div>

				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름"
						name="userName" maxlength="20">
				</div>
				
				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggle="buttons">
						<!--  label 태그는 양식 입력창 을 설명하는 이름표이다 -->
						<label class="btn btn-primary active"> <input type="radio"
							name="userGender" autocomplete="off" value="남자" checked>남자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="userGender" autocomplete="off" value="여자" checked>여자
						</label>
					</div>
				</div>
				<!--이멜부분 -->
				<div class="form-group">
					<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="정보수정">
			</form>
		</div>
</body>
</html>