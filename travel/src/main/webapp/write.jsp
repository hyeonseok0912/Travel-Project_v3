<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript" src="js/menu.js"></script>
<!-- summernot -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<header>
	<%@ include file="menu.jsp" %>
	</header>
	<div>
		<article>
			<h2>작성</h2>
				<div>
					<form action="./write" method="post">
						<input type="hidden" name="write" value="${param.write}">
						<input type="text" name="title" id="title">
						<textarea id="summernote" name="content"></textarea>
						<button type="submit" >저장</button>
					</form>
				</div>
		</article>
	</div>
	<script type="text/javascript">
	$(function(){
		$("#summernote").summernote({
			height:600
		});
	});
	</script>
</body>
</html>