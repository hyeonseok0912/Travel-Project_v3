<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<header>
		<%@ include file="menu.jsp"%>
	</header>
      <h1>해외 여행 게시판</h1>
	<article>
    	<div>
        	<table>
        	<thead>
        		<tr>
                	<th class="t1">번호</th>
					<th class="t3">제목</th>
					<th class="t2">글쓴이</th>
					<th class="t2">등록일</th>
					<th class="t1">조회</th>
					<th class="t1">추천</th>
				</tr>
            </thead>
            
            <tbody>
            	<c:forEach items="${list}" var="row">
            	<tr>
					<td>${row.no}</td>
					<td>${row.title}</td>                    
					<td>${row.write}</td>
					<td>${row.date}</td>
					<td>${row.count}</td>
					<td>${row.like}</td>
				</tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
</article>