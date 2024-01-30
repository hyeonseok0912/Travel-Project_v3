<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>

<!-- jstl 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<header>
		<%@include file="menu.jsp"%>
	</header>

	<!-- 로그인 했으면 댓글 작성 가능 -->
	<%-- <c:if test="${sessionScope.mid ne null }"> --%>

	<!-- 댓글쓰기 창 -->
	<div class="comment-form">
		<textarea onclick="writecomment()" id="comment-write" placeholder="여행을 떠나요~"></textarea>
		<button id="commentBtn">등록</button>
	</div>

	<%-- </c:if> --%>

	<!-- 댓글 출력창 -->
	<d:forEach items="${commentList }" var="co">
		<div class="comments">
			<div class="cname">${co.mname }</div>
			<div class="cdate">${co.cdate }</div>
			<c:if test="{co.mid eq sessionScope.mid}">
				<img class="commentDelete" src="./img/comment_del.png">
			</c:if>
			<div class="ccomment">${co.ccomment }</div>
			<button id="reply">답글</button>
		</div>
	</d:forEach>


</body>
</html>