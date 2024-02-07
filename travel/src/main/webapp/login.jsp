<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- 부트스트랩 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        // 로그인 실패 시
        var errorMSG = '${errorMSG}';
        if(errorMSG && errorMSG.trim() !== ''){
            alert(errorMSG);
        }
    });
</script>
</head>
<body>
	<div>
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div>
			<div>
				<article>
					<h1>login</h1>
					<div>
						<form action="./login" method="post">
						<img alt="login" src="./img/login.png">
							<input type="text" name="id" placeholder="아이디 입력란">
							<input type="password" name="pw" placeholder="비밀번호 입력란">
							<button type="submit">로그인</button>
							<div id="errorMSG"></div>
						</form>
						<a href="./join">회원가입</a>
						<a href="./idFind">ID 찾기</a>
						<a href="./idFind">PW 찾기</a>
					</div>
				</article>
			</div>
		</div>
	</div>
</body>
</html>