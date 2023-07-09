<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		
		String message = (String)session.getAttribute("message");

		if(message == null) {
			message = "";
		} else {
			session.removeAttribute("message");
		}
		
	%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<style>

	#header{
		height: 200px;
		text-align: center;
		margin-top: 100px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.join {
		font-size: 80px;
		background-color: rgba(108, 113, 119, 0.576);
		border-radius: 10%;
	}
	section {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#container{
		height: 300px;
		width: 500px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	
	#id-box {
		margin: 10px;
	}

	.insert-id {
		font-size: 20px;
		margin: 10px;
	}

	#password-box {
		flex: 1;
		margin: 10px;
	}

	



	

	
	#pw {
		font-size: 20px;
	}
	
	#button-box {
		display: flex;
		justify-content: center;
		
	}
	
	#check {
		font-size: 15px;
		color : red;
	}
	
	
	#pw-check {
		font-size: 15px;
		color : red;
	}
	
	#state {
		font-size : 15px;
		color : red;
		display:flex;
	}

	
</style>
<body>

		<Header>
			<div id="header">
				<div class="join">로그인</div>
			</div>
		</Header>
		<section>
		<div id="container">
			<form action="login_action.jsp" method="post">
				<div id="id-box">
					<label for="id" class="insert-id">아이디</label>
					<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
					<p id="check"></p>
							 
				</div>
				<div id="password-box">
					<label for="password" id="pw">password</label>
					<input type="password" id="password" name="password" placeholder="비밀번를 입력해주세요"><p id="pw-check"></p>
				</div>
				
				<div id="button-box">
					<button type="submit" id="submit">로그인</button>
					<button type="button" onclick="location.href='<%=request.getContextPath()%>/web/home.jsp'">홈으로</button>
					
				</div>
				<div id="state"></div>
				
				
				
			</form>
		</div>
	</section>
	
	
	
	<script type="text/javascript">
	
	// 로그인 공백 검사
	document.querySelector('#submit').addEventListener('click', (e) => {
		
		let data = document.querySelector('#id').value;
		let password = document.querySelector('#password').value;

		if(data == "") {
			document.querySelector('#check').innerHTML = "아이디를 입력해주세요";
			e.preventDefault()
		} else {
			document.querySelector('#check').innerHTML = "";
		}
		
		if(password == "") {
			document.querySelector('#pw-check').innerHTML = "비밀번호를 입력해주세요";
			e.preventDefault()
		} else {
			document.querySelector('#pw-check').innerHTML = "";
		}
	})
	
	// 틀리면 메세지 보여주기
	
	document.querySelector('#state').innerHTML = "<%= message %>"
	
	</script>
</body>
</html>