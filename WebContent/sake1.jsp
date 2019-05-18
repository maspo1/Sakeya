<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!--  지시어 삽입 스크립트 문장이 실행될수 있도록 할것이다. -->
	<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<head>
	<meta charset="utf-8">
	<title></title>
	<style>
	* {
		box-sizing: border-box;
	}
	.img-container {
		float: left;
		width: 33.33%;
		padding: 5px;
	}
	.clearfix::after {
		content: "";
		clear: both;
		display: table;
	}
	#ddd{
	font-family: arial, sans-serif;
	font-size: 10px;
}
</style>
<meta httq-equiv="Content-Type" content="text/html; charset="UTF-8">
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
		String userID=null;
		if(session.getAttribute("userID") != null){
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
				<span class="icon-bar"></span>
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">사케야</a>
		</div>
		<!--  위에 data-target이름과 똑같은걸 넣어줘야한다. -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<!--  하나의 리스트 같은걸 보여줄때 사용하는 것이다. -->
			<ul class="nav navbar-nav">
			<!-- 메인페이지에 class=active를 넣을 것이다.현재 접속한 페이지가 메인페이지라고 알려주면 된다. -->
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
					aria-expanded="false">접속하기<span class="caret"></span></a> <!-- #을 쓴이유는 가리키는 링크가 더이상 없다는걸 알려주는 것이다. -->

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
				<!-- ㅇㅇㅇ-->
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<li>반갑습니다.<%=userID %>님</li>
				<a href="mem_delete.jsp" class="dropdown-toggle" 
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">회원관리<span class="caret"></span></a> 
					<ul class="dropdown-menu">
					    <li><a href="mem_admin.jsp">정보수정</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</ul>
				<!-- ㅇㅇㅇ -->
				
						
					<%
					
				}
			%>
		
		</div>
		<div class="clearfix">
		<div class="img-container">
			<img width="45%" height="45%" src="image/dai.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>월계관 준마이 다이긴죠</p>
			<p id="ddd">50% 이상 도정한 쌀만을 가지고 전통적인 주조 기법으로 정성껏 빚어낸 프리미엄 사케로, 최고 등급인 쥰마이다이긴죠 등급 중 국내에서 가장 오랫동안, 가장 많은 사랑을 받아쥰마이다이긴죠급의 대명사가 된 제품입니다.</p>
	    </div>
	    <div class="img-container">
			<img width="45%" height="45%" src="image/kiku_dai.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>키쿠마사무네 다이긴죠</p>
			<p id="ddd">오랜 세월동안 전해져 내려온 전통의 ‘키모토즈쿠리’로 빚은 카라쿠치 다이긴죠슈입니다. 산뜻한 맛과 화려한 향기가 무척이나 매력적인 제품입니다.</p>
	    </div>
	    <div class="img-container">
			<img width="45%" height="45%" src="image/horin.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>호린 준마이 다이긴죠</p>
			<p id="ddd">일본 최고의 주조미인 야마다니시끼(山田錦)와 고햐쿠만고쿠(五百萬石)를 각50%이상 도정한 쌀과 누룩만으로 정성껏 빚어낸 대표적인 프리미엄 청주입니다. </p>
	    </div>
	    <div class="img-container">
			<img width="45%" height="45%" src="image/koka.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>호화 준마이 다이긴죠 천년수</p>
			<p id="ddd">오랜 시간에 걸쳐 50% 도정한 쌀과 천하의 명수로 불리는 미야미즈(官水), 그리고 하쿠시카 전통의 기술로 빚어 낸 고급 사케입니다. 다이긴죠답게 잡맛이 없고 상쾌하면서도 깨끗한 맛과 향이 특징입니다.
			</p>
	    </div>
	    <div class="img-container">
			<img width="45%" height="45%" src="image/hakkaisan_dai.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>핫카이산 준마이 다이긴죠</p>
			<p id="ddd">40%까지 도정한 최상급 품질의 쌀을 장인이 심혈을 기울여 빚어내어 천천히 숙성시켜 만든 술로, 부드럽고 풍부한 맛이 일품인 사케입니다.</p>
	    </div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>
