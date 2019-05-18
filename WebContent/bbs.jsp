<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="euc-kr"%>
	<!--  ���þ� ���� ��ũ��Ʈ ������ ����ɼ� �ֵ��� �Ұ��̴�. -->
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
<title>���ɾ� - �����̾� �Ϻ����� ��������</title>
</head>
<script type="text/javascript">
</script>
<body>
	<%
		//�α��εȻ���� �α��������� ������ �ֵ��� ������̴�.
		String userID=null;
		String userPassword=null;
		if(session.getAttribute("userID") != null){ //
			userID = (String) session.getAttribute("userID");
			userPassword = (String) session.getAttribute("userPassword");
		}
		//���° ���������� �˷��ֱ� ���ؼ��̴�.
		int pageNumber=1;//�⺻ �������� �ǹ��Ѵ�.
		if(request.getParameter("pageNumber") !=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<!-- �׺���̼��� ������ ���ε� �׺���̼��̶�  �ϳ��� ������Ʈ�� �������� ������ �����ִ� ������ �Ѵ�.-->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<!-- �����°� Ȩ�������� �ΰ����� �ִ°��̴�. -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<!--  �۴���� �����̶�� �����ϸ� �ȴ� ���� ��� ���̸� ��Ÿ����. -->
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">���ɾ�</a>
		</div>
		<!--  ���� data-target�̸��� �Ȱ����� �־�����Ѵ�. -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">�Ұ�</a></li>
				<li><a href="sake1.jsp">���̱���</a></li>
				<li><a href="sake2.jsp">����</a></li>
				<li><a href="sake3.jsp">�ظ���</a></li>
				<li><a href="sake4.jsp">ȥ����</a></li>
				<li><a href="sake5.jsp">������</a></li>
				<li><a href="sake6.jsp">����</a></li>
				<!-- �ϳ��� ���Ҹ� �ִ� ���̴�. -->
				<li><a href="bbs.jsp">�Խ���</a></li>
				<!-- �ϳ��� ���Ҹ� �ִ� ���̴�. -->
			</ul>
			<!-- �α��� �Ǿ����� ���� ��츸 ������ �Ұ��̴�.�� �α��� �Ǿ����� ���� ������� �� �� �ִ� ȭ�� -->
			<%
				if(userID ==null){
					%>	
				<ul class="nav navbar-nav navbar-right">
				<!--  �����ʿ� �־��� ���̴�. -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">�����ϱ�<span class="caret"></span></a> 
					<!-- #�� �������� ����Ű�� ��ũ�� ���̻� ���ٴ°� �˷��ִ� ���̴�. -->
					<!--  �����ϱ��ư�� ������ �Ʒ� �ߵ��� �Ұ��̴�. -->
					<ul class="dropdown-menu">
						<li><a href="login.jsp">�α���</a></li>
						<li><a href="join.jsp">ȸ������</a></li>
			</ul>
			</li>
			</ul>
				<% 
				}else{
					%>
				<!--  �α��� �Ǿ��ִ� ������� ���� �ִ� ȭ�� -->
						<ul class="nav navbar-nav navbar-right">
				<!--  �����ʿ� �־��� ���̴�. -->
				<li class="dropdown">
				<li>�ݰ����ϴ�.<%=userID %>��</li>
				<a href="mem_delete.jsp" class="dropdown-toggle" 
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">ȸ������<span class="caret"></span></a> 
					<!--  �����ϱ��ư�� ������ �Ʒ� �ߵ��� �Ұ��̴�. -->
					<ul class="dropdown-menu">
					<!-- �α׾ƿ��� ������ ��ũ�� Ÿ�� ���� ���� �α׾ƿ����������� ���������ϵ��� �غ��� -->
					    <li><a href="mem_admin.jsp">��������</a></li>
						<li><a href="logoutAction.jsp">�α׾ƿ�</a></li>
			</ul>
			</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<!--  �Խ��� ȭ���� ���� �־��ٰ��̰� ���� �Ϸķ� �����Ǵ� ���°� �Ǿ�� �Ѵ�. �׷��Ƿ� ������ ���̺��� ���������Ѵ�. -->
	<div class="container">
		<div class="row"><!-- �̰� ��� �߰���  -->
	<!--  ȸ�� ����ϰ� �����̴�. -->
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	
	<!--  ���̺��� ����κ��� ���ϴ� �����μ� ���� ������ ���ϴ� ���̴�. -->
	<thead>
	
	<!-- tr�� ���̺��ϳ��� ���� ���Ѵ�. th�� �ϳ��� �Ӽ��� ���Ѵ�.-->
	<tr>
		<th style="background-color : #eeeeee; text-align: center;">��ȣ</th>
		<th style="background-color : #eeeeee; text-align: center;">����</th>
		<th style="background-color : #eeeeee; text-align: center;">�ۼ���</th>
		<th style="background-color : #eeeeee; text-align: center;">�ۼ���</th>
		<th style="background-color : #eeeeee; text-align: center;">��ȸ��</th>
	</tr>
	</thead>
	
	<tbody>
	
		<!-- �Խñ��� �̾ƿü� �ֵ��� �Ұ��̴�. -->
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
	<a href="write.jsp" class="btn btn-primary pull-right">�۾���</a>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>
