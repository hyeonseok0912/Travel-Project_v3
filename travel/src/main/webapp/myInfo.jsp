<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>

<!-- jstl 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- menu.js 연결 -->
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
   <header>
      <%@include file="menu.jsp"%>
   </header>
   <div class=main>
   
   <h1>나의 활동</h1>
   <hr>
   
      <article>
         <h2>내 정보 관리</h2>
         <form action="./myInfo" method="post" onsubmit="return check()">
         	<div class=mid>아이디 : ${myInfo.mid }</div>
         	<div class=mname>이름 : ${myInfo.mname }</div>
        	<div class=mpw>새로운 비밀번호 입력 : 
         		<input type="password" name="newPW" id="newPW" placeholder="새로운 비밀번호를 입력">
         		<br>새로운 비밀번호 확인 : 
         		<input type="password" name="newPWcheck" id="newPWcheck" placeholder="새로운 비밀번호를 확인">
		        <button type="submit">수정하기</button>
         	</div>
         </form>
      </article>
      <hr>
      
      <article>
      	<h2>내가 쓴 게시글</h2>
      		<table>
      			<tr>
      				<th>번호</th>
      				<th>제목</th>
      				<th>등록일</th>
      				<th>조회</th>
      				<th>추천</th>
      			</tr>
      			<c:forEach items="${mylist }" var="row">
      				<tr>
      					<td>${row.no}</td>
      					<td><a href="./detail?no=${row.no}">${row.title}</a></td>
      					<td>${row.date}</td>
      					<td>${row.count}</td>
      					<td>${row.like}</td>
      				</tr>
      			</c:forEach>
      		</table>
      </article>
      <hr>
      
      <article>
      	<h2>내가 쓴 댓글</h2>
      		<table>
      			<tr>
      				<th>댓글</th>
      				<th>등록일</th>
      				<th>추천</th>
      			</tr>
      			<c:forEach items="${myclist }" var="mco">
					<tr>
						<td><a href="./detail?no=${mco.tboard_no}">${mco.ccomment }<br></a></td>
						<td>${mco.cdate }</td>
						<td>${mco.clike }</td>
					</tr>
      			</c:forEach>
      		</table>
      </article>
      
   </div>

</body>
</html>