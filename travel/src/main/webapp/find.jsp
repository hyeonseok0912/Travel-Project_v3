<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 찾기</title>
<script type="text/javascript" src="./js/menu.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

	function idHintFind(){
		let name = $('#nameForHint').val();
	
		$.ajax({
			url : './hintFind',
			type : 'post',
			dataType : 'text',
			data : {name : name},
			success : function(result){
				if(result != null && result != ""){
					//hint가 있을때
					alert("힌트가 있습니다.");
					alert(result);
				} else{
					//id가 없을때
					alert("해당 정보를 찾을 수 없습니다.");
			}
			},
			error : function(request, status, error){
				alert("문제가 발생했습니다.");
			}
		});
	}
	
	function idFind(){
		let hint = $('#hintForId').val();
		let name = $('#nameForHint').val();
		
		$.ajax({
			url : './idFind',
			type : 'post',
			dataType : 'text',
			data : {name : name, hint : hint},
			success : function(result){
				if(result != null && result != ""){
					//id가 있을때
					alert("힌트 테스트 통과!");
					alert("ID를 알려드리겠습니다.");
					alert("ID는 : " + result);
					
				} else{
					//id가 없을때
					alert("해당 정보를 찾을 수 없습니다.");
				}
			},
			error : function(request, status, error){
				alert("문제가 발생했습니다.");
			}
		});
	}
	
	function pwFind(){
		let name = $('#nameForPw').val();
		let id = $('#idForPw').val();
		
		$.ajax({
			url : './pwFind',
			type : 'post',
			dataType : 'text',
			data: {name : name, id : id},
			success : function(result){
				if(result != null && result != ""){
					//id가 있을때
					alert("PassWord를 알려드리겠습니다.");
					alert("PassWord : " + result)
				} else{
					//일치 정보가 없을때
					alert("해당 정보를 찾을수 없습니다.");
				}
			},
			error : function(request, status, error){
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
						<button class="btn btn-danger input-group-text" onclick="return idHintFind()">힌트찾기</button>
						<label class="input-group-text">힌&ensp;트</label>
						<input type="text" id="hintForId" name="hint" class="form-control" placeholder="힌트에 대한 답을 입력하세요">
						<button class="btn btn-danger input-group-text" onclick="return idFind()">ID찾기</button>
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
						<button class="btn btn-danger input-group-text" onclick="return pwFind()">PW찾기</button>
					</div>
					<div>
						
					</div>
				</div>
			</div>
		</article>
	</div>
</body>
</html>