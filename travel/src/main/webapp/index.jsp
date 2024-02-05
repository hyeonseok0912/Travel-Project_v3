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

</head>
<body>
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