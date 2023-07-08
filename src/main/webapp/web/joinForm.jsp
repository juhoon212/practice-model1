<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<style>

	html,body {
		display:flex;
		justify-content: center;
		align-items: center;
	}

	
</style>
<body>
		
		<div id="container">
			<form action="joinForm_action.jsp" method="post">
				<div>
					<label for="id">아이디</label>
					<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
					<button type="button" class="id_check">아이디 중복 검사</button><p id="check"></p>
							 
				</div>
				<div>
					<label for="password">패스워드</label>
					<input type="password" id="password" name="password" placeholder="비밀번를 입력해주세요">
				</div>
				<div>
					<label for="name">이름</label>
					<input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
				</div>
				<div>
				<button type="submit">회원가입	</button>
				<button type="button" onclick="<%=request.getContextPath()%>/web/home">홈으로</button>
				</div>
				
			</form>
		</div>
		
		<script type="text/javascript">
		
			
			// 아이디 중복 검사
			
			document.querySelector('.id_check').addEventListener('click', () => {

				let data = document.querySelector('#id').value;
				console.log(data);
				$.ajax({
						type: 'post',
						url: 'id_check.jsp',
						data: {"id" : data}
				})
				.then((data) => {
						if(data == "ok") {
							document.querySelector('#check').innerHTML = "사용 가능한 아이디 입니다";
						} else {
							document.querySelector('#check').innerHTML = "이미 사용중인 아이디 입니다";
						}	
				})
				.catch(() => {
					document.querySelector('#check').innerHTML = "ajax 오류";
				})
			})
		</script>
		
		
</body>
</html>