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
	<head>
	<%@ include file="menu.jsp" %>
	</head>
   <article>
      <div class="title">
      <h1>국내 여행 게시판</h1>
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
                     	<td>${row.no}</td>
                     	<td><a href="./detail?no=${row.no}">${row.title }</a></td>
                     	<td>${row.write }</td>
                     	<td>${row.like }</td>
                     	<td>${row.count }</td>
                     	<td>${row.date }</td>
                     </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </article>
</body>
</html>