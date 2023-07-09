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

	#name-box {
		flex: 1;
		margin: 10px;
	}



	

	
	#pw {
		font-size: 20px;
	}
	#name-box {
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
	#name-check {
		font-size: 15px;
		color : red;
	}
	
	#pw-check {
		font-size: 15px;
		color : red;
	}

	
</style>
<body>

		<Header>
			<div id="header">
				<div class="join">회원가입</div>
			</div>
		</Header>
		<section>
		<div id="container">
			<form action="joinForm_action.jsp" method="post">
				<div id="id-box">
					<label for="id" class="insert-id">아이디</label>
					<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
					<button type="button" class="id_check">아이디 중복 검사</button><p id="check"></p>
							 
				</div>
				<div id="password-box">
					<label for="password" id="pw">password</label>
					<input type="password" id="password" name="password" placeholder="비밀번를 입력해주세요"><p id="pw-check"></p>
				</div>
				<div id="name-box">
					<label for="name" id="name-box">이름</label>
					<input type="text" id="name" name="name" placeholder="이름을 입력해주세요"><p id="name-check"></p>
				</div>
				<div id="button-box">
					<button type="submit" id="submit">회원가입</button>
					<button type="button" onclick="location.href='<%=request.getContextPath()%>/web/home.jsp'">홈으로</button>
				</div>
				
			</form>
		</div>
	</section>
		
		<script type="text/javascript">


			// 아이디 중복 검증
			
			document.querySelector('.id_check').addEventListener('click', () => {
				
				let data = document.querySelector('#id').value;
				
				if(data == "") {
					return;
				}
			
				$.ajax({
						type: 'post',
						url: 'id_check.jsp',
						data: {"id" : data}
				})
				.then((result) => {
						
						
						let reflect = result.trim(); // 문자열 공백제거
						
						
						
						if(reflect == "ok") { //성공
							document.querySelector('#check').innerHTML = "사용 가능한 아이디 입니다";
							document.querySelector('#check').style = "color : blue";
						} else { // 실패	
							document.querySelector('#check').innerHTML = "이미 사용중인 아이디 입니다";
							document.querySelector('#check').style = "color : red";
						}
						
				})
				.catch(() => {
					document.querySelector('#check').innerHTML = "ajax 오류";
				})
			})
			
			
			// 공백 검증

			document.querySelector('#submit').addEventListener('click', (e) => {
				
				let data = document.querySelector('#id').value;
				let password = document.querySelector('#password').value;
				let name = document.querySelector('#name').value;

				
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

				if(name == "") {
					document.querySelector('#name-check').innerHTML = "이름을 입력해주세요";
					e.preventDefault()	
				} else {
					document.querySelector('#name-check').innerHTML = "";
				}
			})
		</script>
		
		
</body>
</html>