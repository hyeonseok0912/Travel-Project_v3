<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="./js/menu.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	let idCheckBool = false;

	$(function() {
		$('.id-alert, .name-alert, .pw-alert').hide();

		$('#id').on(
				"change keyup paste",
				function() {
					$('.id-alert').show();
					$('.id-alert').html('<p class = "alert">당신이 입력한 ID는 ' + $('#id').val() + '</p>');
					//if($('#id').val().length > 4)
				});
	});
	
	function findId() {
	    alert("ID를 찾습니다.");
	    window.location.href = './idFind';
	}

	function findPw() {
	    alert("PW를 찾습니다.");
	    window.location.href = './pwFind';
	}

	function check() {

		let id = $("#id").val();
		if (id.length < 4 || id == "") {
			$('.id-alert').show();
			$('#id').focus();
			return false;
		} else {
			$('.id-alert').hide();
		}
		if (!idCheckBool) {
			alert("ID검사를 먼저 진행해주세요.");
			return false;
		}

		let name = $('#name').val();
		if (name.length <= 2) {
			alert("이름은 2글자 이상이어야 합니다.");
			$('.name-alert').show();
			$('#name').focus();
			return false;
		}
		$('.name-alert').hide();

		let pw1 = $('#pw1').val();
		if (pw1.length < 8 || pw1 == "") {
			alert("암호는 8글자 이상이어야 합니다.");
			$('.pw-alert').show();
			$('#pw1').focus();
			return false;
		}

		let pw2 = $('#pw2').val();
		if (pw2 != pw1) {
			alert("암호는 동일해야 합니다.");
			$('#pw2').val("");
			$('#pw2').focus();
			return false;
		}
	}

	function idCheck() {
		alert('id검사를 진행합니다.');
		let id = $('#id').val();
		const regExp = /^[a-z0-9]{5,15}$/;
		if (id.length < 4 || !regExp.test(id)) {
			$('.id-alert').html('<p class="alert">아이디는 5글자 이상 15글자 미만이고, 특수문자가 없어야 합니다.</p>');
			$('#id').focus();
		} else {
			//AJAX로 가상폼 방식으로 서블릿에 전달
			$.ajax({
				url : './idCheck',
				type : 'post',
				dataType : 'text',
				data : {id : id},
				success : function(result) {
					if (result == 1) {
						$('.id-alert').append('<p class="alert">중복된 id입니다.</p>');
						$('.id-alert .alert').css("color","red");
						$('.id-alert .alert').css("font-weight","bold");
						idCheckBool = false;
						$("#joinBtn").attr("disabled", "disabled");//가입버튼 비활성화
						$('#id').focus();
					} else {
						$('.id-alert').append('<p class="alert">사용 가능한 id입니다.</p>');
						$('.id-alert .alert').css("color", "blue");
						$('.id-alert .alert').css("font-weight","bold");
						idCheckBool = true;
						$("#joinBtn").removeAttr("disabled");//가입버튼 활성화
					}
				},
				error : function(request, status, error) {
					alert("에러가 발생했습니다.");
				}
			});
		}
		return false;
	}
</script>

</head>
<body>
	<div class="container1">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="join-form">
						<h1>회원가입</h1>
						<div>
							<form action="./join" method="post" onsubmit="return check()">
								<div class="input-group mb-2">
									<label class="input-group-text">아이디</label>
									<input type="text" id="id" name="id" class="form-control" placeholder="ID를 입력해주세요">
									<button class="btn btn-danger input-group-text"
										onclick="return idCheck()">ID검사</button>
								</div>
								<div class="input-group mb-2 id-alert">
									<p class="alert">올바른 아이디를 입력해주세요</p>
								</div>
								<div class="input-group mb-2">
									<label class="input-group-text">이&ensp;&ensp;름</label>
									<input type="text" id="name" name="name"
										class="form-control" placeholder="이름을 입력해주세요">
								</div>
								<div class="input-group mb-2 name-alert">
									<p class="alert">올바른 이름을 입력해주세요</p>
								</div>
								<div class="input-group mb-2">
									<label class="input-group-text">Password</label>
									<input type="password" id="pw1" name="pw1" class="form-control" placeholder="PW를 입력해주세요">
									<label class="input-group-text">Password 확인</label>
									<input type="password" id="pw2" class="form-control" placeholder="PW를 한번 더 입력해주세요">
								</div>
								<div class="input-group mb-2 pw-alert">
									<p class="alert">올바른 Password를 입력하세요</p>
								</div>
								<div class="input-group mb-2">
									<button type="reset" class="btn btn-danger">초기화</button>
									<button id="joinBtn" type="submit" disabled="disabled" class="btn btn-primary">가입하기</button>
								</div>
							</form>
						</div>
					</div>
				</article>
			</div>
			<div class="input-group mb-2">
    			<button id="idBtn" type="button" class="btn btn-light" onclick="findId()">ID찾기</button>
    			<button id="pwBtn" type="button" class="btn btn-secondary" onclick="findPw()">PW찾기</button>
			</div>
		</div>
	</div>
</body>
</html>