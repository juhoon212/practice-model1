<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	
	
	
	#container {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 200px;
	}
	
	#body {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	#btn1 {
		margin : 10px;
	}
	
	#btn2 {
		margin : 10px;
	}
	
	#btn3 {
		margin : 10px;
		display: none;
	}
	
	#welcome {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	
</style>
<body>
	<div id="container">
		<h1>홈</h1>

		
	</div>
	
	<div id="body">
			<button type="button" id="btn1" onclick="location.href='<%=request.getContextPath()%>/web/joinForm.jsp'">회원가입</button>
			<button type="button" id="btn2" onclick="location.href='<%=request.getContextPath()%>/web/login.jsp'">로그인</button>
			<button type="button" id="btn3" onclick="location.href='<%=request.getContextPath()%>/web/logout.jsp'">로그아웃</button>
	</div>
	<div id="welcome"></div>

	
	
	<script type="text/javascript">
	
	<%
	Member member = (Member)session.getAttribute("member");
	
	if(member != null) { %> document.querySelector('#welcome').innerHTML = "<%= member.getId() %>님 환영합니다.";
						document.querySelector('#btn3').style.display = 'inline';
						
	<% } %>
	
	
	
	
		
	</script>

</body>
</html>