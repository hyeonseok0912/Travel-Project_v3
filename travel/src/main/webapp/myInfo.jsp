<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- jstl 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- menu.js 연결 -->
<script type="text/javascript" src="./js/menu.js"></script>
<!-- 부트스트랩 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
   <header>
      <%@include file="menu.jsp"%>
   </header>
   <div class=main>
   
   <h1>나의 활동</h1>
   <hr>
		
      <article>
    	  <h2 class="myinfo">내 정보 관리</h2>
         <form action="./myInfo" method="post" onsubmit="return check()">
         	<div class=mid>아이디 : ${myInfo.mid }</div>
         	<div class=mname>이름 : ${myInfo.mname }</div>
        	<div class=mpw>새로운 비밀번호 입력 : 
         		<input type="password" name="newPW" id="newPW" placeholder="새로운 비밀번호를 입력">
         		<br>새로운 비밀번호 확인 : 
         		<input type="password" name="newPWcheck" id="newPWcheck" placeholder="새로운 비밀번호를 확인">
		        <button type="submit">수정하기</button>
         </form>
      </article>
      <hr>
      
      <article>
      	<h2 id="myboardinfo">내가 쓴 게시글</h2>
      	<c:if test="${not empty mylist }">
      		<table class="table table-hover">
      			<thead>
      				<tr class="table-info">
      					<th scope="col">번호</th>
						<th scope="col">제목</th>
      					<th scope="col">등록일</th>
      					<th scope="col">조회</th>
						<th scope="col">추천</th>
      				</tr>
      			</thead>
      			<c:forEach items="${mylist }" var="row">
      				<tr>
      					<td>${row.no}</td>
      					<td><a href="./detail?no=${row.no}">[${row.header}]${row.title}</a></td>
      					<td>${row.date}</td>
      					<td>${row.count}</td>
      					<td>${row.like}</td>
      				</tr>
      			</c:forEach>
      		</table>
      	</c:if>
      	
      	<c:if test="${empty mylist }">
      		<p>게시글이 없습니다. 게시글을 작성해보세요.</p>
      	</c:if>
      </article>
      <hr>
      
      <article>
      	<h2 id="myccomentinfo">내가 쓴 댓글</h2>
      	<c:if test="${not empty myclist }">
      		<table class="table table-hover">
      			<thead>
      			<tr class="table-info">
      				<th scope="col">게시글 번호
      				<th scope="col">댓글</th>
      				<th scope="col">등록일</th>
      				<th scope="col">추천</th>
      			</tr>
      			</thead>
      			<c:forEach items="${myclist }" var="mco">
					<tr>
						<td>${mco.tboard_no }</td>
						<td><a href="./detail?no=${mco.tboard_no}">${mco.ccomment }<br></a></td>
						<td>${mco.cdate }</td>
						<td>${mco.clike }</td>
					</tr>
      			</c:forEach>
      		</table>
      	</c:if>
      	<br><br><br><br>
      	<c:if test="${empty mylist }">
      		<p>댓글이 없습니다. 댓글을 작성해보세요.</p>
      	</c:if>
      </article>
      
   </div>
<script type="text/javascript">
$(".myinfo").next().hide();
$(".myinfo").click(function(){
	$(this).next().toggle("slow");
});

$("#myboardinfo").next().hide();
$("#myboardinfo").click(function(){
	$(this).next().toggle("slow");
});
$("#myccomentinfo").next().hide();
$("#myccomentinfo").click(function(){
	$(this).next().toggle("slow");
});

</script> 
</body>
</html>