<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해외게시판</title>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<header>
		<%@ include file="menu.jsp"%>
	</header>
      <h1>해외 여행 게시판</h1>
	<article>
		<!-- <button name="writebtn" onclick="url('./write?write=1')">글쓰기</button> -->
		
<!-- 		<div>
			<a href="./outboard?write=1"> | 전체 |</a>
			<a href="./outboard?write=1&category=공지사항">공지사항 |</a>			
			<a href="./outboard?write=1&category=여행정보">여행정보 |</a>
			<a href="./outboard?write=1&category=잡담">잡담 |</a>
		</div> -->
		
<div class="btn-group" role="group" aria-label="Basic outlined example">
  <button type="button" class="btn btn-outline-primary" onclick="url('./outboard?write=1')">전체</button>
  <button type="button" class="btn btn-outline-primary" onclick="url('./outboard?write=1&category=공지사항')">공지사항</button>
  <button type="button" class="btn btn-outline-primary" onclick="url('./outboard?write=1&category=여행정보')">여행정보</button>
  <button type="button" class="btn btn-outline-primary" onclick="url('./outboard?write=1&category=잡담')">잡담</button>
</div>
		
    	<div>
<%--          	<table>
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
					<c:choose>
					<c:when test="${param.category eq '공지사항'}">
					<c:forEach items="${list}" var="row">
            		<tr>
        	   			<c:if test="${row.inout eq 1 && row.del ne 0 && row.header eq '공지사항'}">
						<td>${row.no}</td>
						<td><a href="./detail?no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>                    
						<td>${row.write}</td>
						<td>${row.date}</td>
						<td>${row.count}</td>
						<td>${row.like}</td>
						</c:if>
					</tr>
					</c:forEach></c:when>
					<c:when test="${param.category eq '여행정보'}">
					<c:forEach items="${list}" var="row">
            		<tr>
        	   			<c:if test="${row.inout eq 1 && row.del ne 0 && row.header eq '여행정보'}">
						<td>${row.no}</td>
						<td><a href="./detail?no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>                    
						<td>${row.write}</td>
						<td>${row.date}</td>
						<td>${row.count}</td>
						<td>${row.like}</td>
						</c:if>
					</tr>
					</c:forEach></c:when>
					<c:when test="${param.category eq '잡담'}">
					<c:forEach items="${list}" var="row">
            		<tr>
        	   			<c:if test="${row.inout eq 1 && row.del ne 0 && row.header eq '잡담'}">
						<td>${row.no}</td>
						<td><a href="./detail?no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>                    
						<td>${row.write}</td>
						<td>${row.date}</td>
						<td>${row.count}</td>
						<td>${row.like}</td>
						</c:if>
					</tr>
					</c:forEach></c:when>
					<c:otherwise>
					<c:forEach items="${list}" var="row">
            		<tr>
        	   			<c:if test="${row.inout eq 1 && row.del ne 0}">
						<td>${row.no}</td>
						<td><a href="./detail?no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>                    
						<td>${row.write}</td>
						<td>${row.date}</td>
						<td>${row.count}</td>
						<td>${row.like}</td>
						</c:if>
					</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table> --%>
			<br>
			 <table class="table table-hover">
  <thead>
    <tr class="table-info">
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">글쓴이</th>
      <th scope="col">등록일</th>
      <th scope="col">조회</th>
      <th scope="col">추천</th>
    </tr>
  </thead>
  <tbody>
	<c:choose>
	<c:when test="${param.category eq '공지사항'}">
	<c:forEach items="${list}" var="row">
   	<tr>
		<c:if test="${row.inout eq 1 && row.del ne 0 && row.header eq '공지사항'}">
      			<th scope="row">${row.no}</th>
    			<td><a href="./detail?no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>
      			<td>${row.write}</td>
      			<td>${row.date}</td>
      			<td>${row.count}</td>
      			<td>${row.like}</td>
		</c:if>
    	</tr>
	</c:forEach></c:when>
	<c:when test="${param.category eq '여행정보'}">
	<c:forEach items="${list}" var="row">
   	<tr>
		<c:if test="${row.inout eq 1 && row.del ne 0 && row.header eq '여행정보'}">
      			<th scope="row">${row.no}</th>
    			<td><a href="./detail?no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>  
      			<td>${row.write}</td>
      			<td>${row.date}</td>
      			<td>${row.count}</td>
      			<td>${row.like}</td>
		</c:if>
    	</tr>
	</c:forEach></c:when>
	<c:when test="${param.category eq '잡담'}">
	<c:forEach items="${list}" var="row">
   	<tr>
		<c:if test="${row.inout eq 1 && row.del ne 0 && row.header eq '잡담'}">
      			<th scope="row">${row.no}</th>
    			<td><a href="./detail?no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>  
      			<td>${row.write}</td>
      			<td>${row.date}</td>
      			<td>${row.count}</td>
      			<td>${row.like}</td>
		</c:if>
    	</tr>
	</c:forEach></c:when>
	<c:otherwise>
	<c:forEach items="${list}" var="row">
	<tr>
		<c:if test="${row.inout eq 1 && row.del ne 0}">
			<th scope="row">${row.no}</th>
			<td><a href="./detail?no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>  
      			<td>${row.write}</td>
      			<td>${row.date}</td>
      			<td>${row.count}</td>
      			<td>${row.like}</td>
		</c:if>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
  </tbody>
</table>
			
		</div>
		
		<div>
			<button type="button" class="btn btn-outline-primary" name="writebtn" onclick="url('./write?write=1')">글쓰기</button>
		</div>
		
	</article>

</body>
</html>