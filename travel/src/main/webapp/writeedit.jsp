<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 중</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link href="./css/menu.css" rel= "stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
	<header>
		<%@ include file="./menu.jsp" %>
		<!-- jsp:은 출력 결과만 화면에 나옵니다. -->
	</header>
	<div class="main">
		<div class="mainstyle">
			<article>
			<h1>글 수정하기</h1>
						
			<div class="writeFORM">
				<form action="./writeedit" method="post">
					<input type="text" name="title" id="title" value="${write.title }">
					<textarea id="summernote" name="content" >${write.content }</textarea>
					<button type="submit" >수정</button>
					<input type="number" name="no" value="${write.no }">
				</form>
				</div>
			</article>
		
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){
		$('#summernote').summernote({
			height: 600
		});
	});
	</script>
</body>
</html>