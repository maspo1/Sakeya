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
			<img width="45%" height="45%" src="image/kyo.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>교노이즈미</p>
			<p id="ddd">엄선된 최상급의 양조미를 40%까지 도정하여 빚어낸 프리미엄 청주로, 
			향긋한 과일향이 특징이며 약간 차게 드시는 것이 좋습니다.</p>
	    </div>
	    <div class="img-container">
			<img width="45%" height="45%" src="image/haku_ginjo.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>하쿠시카 준마이 긴죠 팩</p>
			<p id="ddd">주원료인 쌀을 60%까지 도정하고 
천하의 명수로 불리는 미야미즈(官水)를 더해 
하쿠시카 전통의 증미지코미 방식으로 
장기간 저온 발효시켜 빚은 고급 사케입니다.</p>
	    </div>
	    <div class="img-container">
			<img width="45%" height="45%" src="image/haku_nama.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>하쿠시카 준마이 긴죠 나마죠조</p>
			<p id="ddd">양질의 쌀로 빚은 술을 저온에서 숙성한 후, 
병입 시 다시 한 번 저온으로 
순간 살균하여 만든 긴조슈입니다. 
신선하고 깨끗한 맛에 
상쾌한 목넘김이 좋은 품위있는 술입니다.</p>
	    </div>
	    <div class="img-container">
			<img width="45%" height="45%" src="image/hakkaisan_ginjo.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>핫카이산 준마이 긴죠</p>
			<p id="ddd">마치 맑게 갠 겨울날 깨끗하고 청명한 공기 속에서 
햇볕에 사르르 눈이 녹는 듯한, 
말로 형언하기 힘든 고요하고 평온한 느낌이 
무척이나 매력적인 사케입니다. 
쌀의 감칠맛과 부드러운 목넘김이 좋습니다.</p>
	    </div>
	    <div class="img-container">
			<img width="45%" height="45%" src="image/nubel.png" />
			<img width="50%" height="50%" src="image/r1.png" />
			<p>월계관 준마이 누벨</p>
			<p id="ddd">국내에서 오랜기간 사랑받아온 누벨준마이의 상급 리뉴얼 제품으로 
화려하고 프루티한 향기와 주원료인 쌀 본연의 감칠 맛을 
잘 살린 것이 특징입니다. 15도 이하로 시원하게 드실 때 
가장 깔끔한 맛이 살아나며 요리와 함께하면 
더욱 좋은 맛을 내는 제품입니다.</p>
	    </div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	

</body>
</html>
