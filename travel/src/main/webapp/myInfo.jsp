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
         	<div class=mid>내 아이디 : ${myInfo.mid }</div>
         	<div class=mname>내 이름 : ${myInfo.mname }</div>
        	<div class=mpw>내 비밀번호 :
         		<input type="password" name="newPW" placeholder="변경할 암호를 입력하세요">
		        <button type="submit">수정하기</button>
         	</div>
         </form>
      </article>
      <hr>
      
      <article>
      	<h2>내가 쓴 게시글</h2>
      </article>
      <hr>
      
      <article>
      	<h2>내가 쓴 댓글</h2>
      </article>
      
   </div>

</body>
</html>