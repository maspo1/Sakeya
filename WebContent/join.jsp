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
</head>
<body>
	<!-- 네비게이션 구현 시작 :사이트전반 레이아웃 설정-->
	<nav class="navbar navbar-default">
		<!-- 1.나브헤더 --> -->
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

	<!--  로그인 양식을 만들어 볼것이다. -->
	<!--  마치하나의 컨테이너처럼 감싸주는걸 할것이다. -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">

			<!-- post같은 경우 회원가입이나 로그인같이 숨기면서 보낼때 사용하는 것이다. -->
			<!--  joinAction페이지로 아래 내용것을 다 보낼것이다. -->
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align: center;">회원가입 화면</h3>

				<!-- 회원가입이니 여기부분을 추가시킬 것이다. -->
				<div class="form-group">
					<!-- placeholder은 어떠한것도 입력되지 않았을때 나오게 할수 있는 것이다.아이디 길이 20으로 제한  -->
					<input type="text" class="form-control" placeholder="아이디"
						name="userID" maxlength="20">
				</div>

				<div class="form-group">
					<!-- placeholder은 어떠한것도 입력되지 않았을때 나오게 할수 있는 것이다.패스워드 길이 20으로 제한  -->
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
				</div>

				<!--  이름을 넣는 것이다. -->
				<div class="form-group">
					<!-- placeholder은 어떠한것도 입력되지 않았을때 나오게 할수 있는 것이다.이름 길이 20으로 제한  -->
					<input type="text" class="form-control" placeholder="이름"
						name="userName" maxlength="20">
				</div>

				<!--  성별을 넣는 것이다. -->
				<div class="form-group" style="text-align: center;">
					<!--  성별을 넣을 것이다. -->
					<div class="btn-group" data-toggle="buttons">

						<!--  label 태그는 양식 입력창 을 설명하는 이름표이다 -->
						<label class="btn btn-primary active"> <input type="radio"
							name="userGender" autocomplete="off" value="남자" checked>남자
						</label> <label class="btn btn-primary"> <input type="radio"
							name="userGender" autocomplete="off" value="여자" checked>여자
						</label>
					</div>
				</div>
				<!--이멜부분 -->>
				<div class="form-group">
					<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="회원가입">
			</form>
		</div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>