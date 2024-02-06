<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
							<button type="reset">지우기</button>
							<button type="submit">로그인</button>
							<div id="errorMSG"></div>
						</form>
						
						<a href="./join">회원가입</a>
					</div>
				</article>
			</div>
		</div>
	</div>
</body>
</html>