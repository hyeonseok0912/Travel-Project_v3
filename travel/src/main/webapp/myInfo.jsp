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
      <article>
         <h1>내 프로필</h1>
        ${myInfo.mname }/${myInfo.mid }/${myInfo.mpw }
      </article>
   </div>

</body>
</html>