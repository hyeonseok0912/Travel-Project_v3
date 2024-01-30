<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.
</style>
<title>국내 게시판</title>
</head>
<body>
	<head>
	<%@ include file="menu.jsp" %>
	</head>
   <article>
      <div class="title">
      <h1>국내 여행 게시판</h1>
         <div>
            <div>
               <table>
                  <tbody>
                     <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>추천</th>
                        <th>조회</th>
                        <th>날짜</th>
                     </tr>
                     <tr>
                     	<td>${list }</td>
                     	<td></td>
                     	<td></td>
                     	<td></td>
                     	<td></td>
                     	<td></td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </article>
</body>
</html>