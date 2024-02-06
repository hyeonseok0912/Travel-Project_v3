<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 찾기</title>
<script type="text/javascript" src="./js/menu.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<style type="text/css">
.id-alert, .name-alert, .pw-alert {
	background-color: gray;
}

.alert {
	color: red;
}
</style>
<script type="text/javascript">
	let idCheckBool = false;

	function pwCheck() {
		let pw1 = $('#newPW').val();
		let pw2 = $('#newPWcheck').val();

		if (pw1.length < 8 || pw1 == "") {
			alert("암호는 8글자 이상이어야 합니다.");
			$('.pw-alert').show();
			$('#pw1').focus();
			return false;
		}

		if (pw2 !== pw1) {
			alert("암호는 동일해야 합니다.");
			$('#newPW').val("");
			$('#newPWcheck').val("");
			$('#newPW').focus();
			return false;
		}
		return true; // 암호가 일치하면 true 반환
	}

	function idHintFind() {
		let name = $('#nameForHint').val();

		$.ajax({
			url : './idHintFind',
			type : 'post',
			dataType : 'text',
			data : {name : name},
			success : function(result) {
				if (result != null && result != "") {
					//hint가 있을때
					alert("힌트가 있습니다.");
					alert(result);
				} else {
					//id가 없을때
					alert("해당 정보를 찾을 수 없습니다.");
				}
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		});
	}

	//힌트에 대한 답이 맞는지 확인해주는 부분(id파트)
	function idHintCheck() {
		let hint = $('#hintForId').val();
		let name = $('#nameForHint').val();

		if (hint == null || hint == "") {
			alert("힌트에 대한 답을 입력해주셔야 합니다.");
			$('.id-alert').show();
			$('#hintForId').focus();
			return false;
		} else {
			// 힌트에 대한 답을 확인하는 함수 호출
			idCheckHint(name, hint);
		}
	}
	
	//힌트에 대한 답이 맞는지 확인해주는 부분(pw파트)
	function pwHintCheck() {
		let hint = $('#hintForPW').val();
		let name = $('#nameForPw').val();

		if (hint == null || hint == "") {
			alert("힌트에 대한 답을 입력해주셔야 합니다.");
			$('.id-alert').show();
			$('#hintForId').focus();
			return false;
		} else {
			// 힌트에 대한 답을 확인하는 함수 호출
			pwCheckHint(name, hint);
		}
	}

	function idCheckHint(name, hint) {
		$.ajax({
			url : './hintCheck',
			type : 'post',
			dataType : 'text',
			data : {hint : hint, name : name},
			success : function(result) {
				if (result == 1) {
					// id 찾기 버튼 활성화
					alert("ID 찾기 활성화!");
					$("#idBtn").removeAttr("disabled");// id 찾기 버튼 활성화
				} else {
					// id가 없을때
					alert("해당 정보를 찾을 수 없습니다.");
					$("#idBtn").attr("disabled", "disabled");// id 찾기 버튼 비활성화
				}
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		});
	}
	
	function pwCheckHint(name, hint) {
		$.ajax({
			url : './hintCheck',
			type : 'post',
			dataType : 'text',
			data : {hint : hint, name : name},
			success : function(result) {
				if (result == 1) {
					// id 찾기 버튼 활성화
					alert("PW 수정 활성화!");
					$("#pwBtn").removeAttr("disabled");// pw 찾기 버튼 활성화
				} else {
					// id가 없을때
					alert("해당 정보를 찾을 수 없습니다.");
					$("#pwBtn").attr("disabled", "disabled");// pw 찾기 버튼 비활성화
				}
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		});
	}

	function idFind() {
		let hint = $('#hintForId').val();
		let name = $('#nameForHint').val();

		// ID 찾기 버튼을 누를 때 힌트에 대한 답이 없는지 확인하지 않도록 수정
		$.ajax({
			url : './idFind',
			type : 'post',
			dataType : 'text',
			data : {name : name, hint : hint},
			success : function(result) {
				if (result != null && result != "") {
					// id가 있을때
					//alert("힌트 테스트 통과!");
					alert("ID를 알려드리겠습니다.");
					alert("ID는 : " + result);

				} else {
					// id가 없을때
					alert("해당 정보를 찾을 수 없습니다.");
				}
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		});
	}

	function pwHintFind() {
		let name = $('#nameForPw').val();
		let id = $('#idForPw').val();

		$.ajax({
			url : './pwHintFind',
			type : 'post',
			dataType : 'text',
			data : {name : name, id : id},
			success : function(result) {
				if (result != null && result != "") {
					//hint가 있을때
					alert("힌트가 있습니다.");
					alert(result);
				} else {
					//정보가 일치하지 않을 때
					alert("해당 정보를 찾을 수 없습니다.");
				}
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		});
	}

	function pwFind() {
		let name = $('#nameForPw').val();
		let id = $('#idForPw').val();
		let pw = $('#newPW').val();

		$.ajax({
			url : './pwFind',
			type : 'post',
			dataType : 'text',
			data : {name : name, id : id, pw : pw},
			success : function(result) {
				if (result == 1) {
					//쿼리문이 실행됐을 때
					alert("PassWord가 수정되었습니다.");
					window.location.href = './login';
				} else {
					//쿼리문 실행 안됐을 때
					alert("해당 정보를 찾을수 없습니다.");
					//window.href('./url')
				}
			},
			error : function(request, status, error) {
				alert("문제가 발생했습니다.");
			}
		});
	}
</script>
</head>
<body>
	<div>
		<header>
			<%@ include file="menu.jsp"%>
		</header>
	</div>
	<div class="main">
		<article>
			<div class="idSearch-form">
				<h1>ID 찾기</h1>
				<div>
					<div>
						<label class="input-group-text">이&ensp;름</label>
						<input type="text" id="nameForHint" name="name" class="form-control" placeholder="이름을 입력하세요">
					</div>
					<div>
						<button class="btn btn-primary input-group-text" onclick="return idHintFind()">힌트 찾기</button>
						<label class="input-group-text">힌&ensp;트</label> <input type="text" id="hintForId" name="idHint" class="form-control" placeholder="힌트에 대한 답을 입력하세요">
					</div>
					<div>
						<label class="input-group-text">힌트 답 확인</label>
						<button class="btn btn-primary input-group-text" onclick="return idHintCheck()">정답 체크</button>
					</div>
					<div>
						<button id="idBtn" disabled="disabled" class="btn btn-danger input-group-text" onclick="return idFind()">ID 찾기</button>
					</div>
				</div>
			</div>
			<div class="PwSearch-form">
				<h1>PW 찾기</h1>
				<div>
					<div>
						<label class="input-group-text">이&ensp;름</label>
						<input type="text" id="nameForPw" name="name" class="form-control" placeholder="이름을 입력하세요">
					</div>
					<div>
						<label class="input-group-text">I&ensp;D</label>
						<input type="text" id="idForPw" name="id" class="form-control" placeholder="아이디를 입력하세요">
						<button class="btn btn-primary input-group-text" onclick="return pwHintFind()">힌트 찾기</button>
					</div>
					<div>
						<label class="input-group-text">힌&ensp;트</label>
						<input type="text" id="hintForPW" name="pwHint" class="form-control" placeholder="힌트에 대한 답을 입력하세요">
					</div>
					<div>
						<label class="input-group-text">힌트 답 확인</label>
						<button class="btn btn-primary input-group-text" onclick="return pwHintCheck()">정답 체크</button>
						<label class="input-group-text">새로운 비밀번호 입력</label>
						<input type="password" name="newPW" id="newPW" placeholder="새로운 비밀번호를 입력해주세요"> <input type="password" name="newPWcheck" id="newPWcheck" placeholder="새로운 비밀번호를 확인해주세요">
						<button id="pwBtn" disabled="disabled" class="btn btn-danger input-group-text" onclick="return pwCheck() && pwFind()">PW 수정</button>
					</div>
				</div>
			</div>
		</article>
	</div>
</body>
</html>