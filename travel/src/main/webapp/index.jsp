<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 변경 ttt</title>

<!-- menu.js 연결 -->
<script type="text/javascript" src="./js/menu.js"></script>
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<header>
		<%@ include file="menu.jsp"%>
	</header>
	<h1>index[홈]</h1>
	<article>
		<div class=inHot>
			<h2>국내여행 인기글</h2>
			<a class=moreinboard href="./inboard">more+</a>
		</div>
		<div class=inHotList>
			<ol>
				<c:forEach items="${inHotList }" var="li">
					<li><a href="./detail?no=${li.no}&inout=${li.inout}">[${li.header}] ${li.title}</a></li>
				</c:forEach>
			</ol>
		</div>
	</article>

	<article>
		<div class=outHot>
			<h2>해외여행 인기글</h2>
			<a class=moreoutboard href="./outboard">more+</a>
		</div>
		<div class=outHotList>
			<ol>
				<c:forEach items="${outHotList }" var="li">
					<li><a href="./detail?no=${li.no}&inout=${li.inout}">[${li.header}] ${li.title}</a></li>
				</c:forEach>
			</ol>
		</div>
	</article>

</body>
</html>