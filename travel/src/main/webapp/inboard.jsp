<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국내 게시판</title>
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>
	<header>
	<%@ include file="menu.jsp" %>
	</header>
   <article>
      <div class="title">
      <h1>국내 여행 게시판</h1>
         <button onclick="url('./write?write=0')">글쓰기</button>
        <div>
       	 <a> | 전체 |</a>
         <a>공지사항 |</a>
         <a>정보 |</a>
         <a>잡담 |</a>
        </div>
         <div>
            <div>
               <table>
                  <tbody> 
                     <tr>
                        <th class="t1">번호</th>
                        <th class="t3">제목</th>
                        <th class="t2">글쓴이</th>
                        <th class="t2">등록일</th>
                        <th class="t1">조회</th>
                        <th class="t1">추천</th>
                     </tr>
                     <c:forEach items="${list }" var="row">
                     <tr>
                     <c:if test="${row.inout eq 0 }">
                     	<td>${row.no}</td>
                     	<td><a href="./detail?no=${row.no}">${row.title }</a></td>
                     	<td>${row.write }</td>
                     	<td>${row.date }</td>
                     	<td>${row.count }</td>
                     	<td>${row.like }</td>
                     </c:if>
                     </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
      <div>
			<button onclick="url('./write?write=0')" >글쓰기</button>
	 </div>
   </article>
</body>
</html>