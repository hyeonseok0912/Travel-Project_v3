<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	let idCheckBool = false;
	
	$(function(){
		$('.id-alert, .name-alert, .pw-alert').hide();
		
		$('#id').on("change keyup paste", function(){
			$('.id-alert').show();
			$('.id-alert').html('<p class = "alert">당신이 입력한 ID는 ' + $('#id').val() + '</p>');
			if($('#id').val().length > 4)
		})
	})
</script>
</head>
<body>
	<div>
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div>
			<article>
				<div class="join-form">
					<h1>회원가입</h1>
					<div>
						<form action="./join" method="post" onsubmit="return check()">
							<div>
								<label>아이디</label>
								<input type="text" id="id" name="id" class="form-control" placeholder="ID를 입력해주세요">
								<button class="btn btn-danger input-group-text" onclick="return idCheck()">ID검사</button>
							</div>
							<div>
								<p>올바른 아이디를 입력해주세요</p>
							</div>
							<div>
								<label>이름</label>
								<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력해주세요">
							</div>
							<div>
								<p>올바른 이름을 입력해주세요</p>
							</div>
							<div>
								<label>Password</label>
								<input type="password" id="pw1" class="form-control" placeholder="PW를 입력해주세요">
								<label>Password 확인</label>
								<input type="password" id="pw2" class="form-control" placeholder="PW를 한번 더 입력해주세요">
							</div>
							<div>
								<p>올바른 Password를 입력하세요</p>
							</div>
							<div>
								<button type="reset">초기화</button>
								<button id="joinBtn" type="submit" disabled="disabled">가입하기</button>
							</div>
						</form>
					</div>
				</div>
			</article>
		</div>
	</div>
</body>
</html>