<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	<div>
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div>
			<article>
				<div>
					<h1>회원가입</h1>
					<div>
						<form>
							<div>
								<label>아이디</label>
								<input>
								<button>ID검사</button>
							</div>
							<div>
								<p>올바른 아이디를 입력해주세요</p>
							</div>
							<div>
								<label>이름</label>
								<input>
							</div>
							<div>
								<p>올바른 이름을 입력해주세요</p>
							</div>
							<div>
								<label>암호</label>
								<input>
								<label>암호 확인</label>
								<input>
							</div>
							<div>
								<p>올바른 암호를 입력하세요</p>
							</div>
							<div>
								<button>초기화</button>
								<button>가입하기</button>
							</div>
						</form>
					</div>
				</div>
			</article>
		</div>
	</div>
</body>
</html>