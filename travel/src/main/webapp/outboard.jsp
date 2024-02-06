<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
	<header>
		<%@ include file="menu.jsp"%>
	</header>
      <h1>해외 여행 게시판</h1>
	<article>
		<button name="writebtn" onclick="url('./write?write=1')">글쓰기</button>
		<div>
			<a href="./outboard?write=1"> | 전체 |</a>
			<a href="./outboard?write=1&category=공지사항">공지사항 |</a>			
			<a href="./outboard?write=1&category=여행정보">여행정보 |</a>
			<a href="./outboard?write=1&category=잡담">잡담 |</a>
		</div>
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
					<c:choose>
					<c:when test="${param.category eq '공지사항' && fn:length(list) gt 0}">
					<c:forEach items="${list}" var="row">
            		<tr>
        	   			<c:if test="${row.inout eq 1 && row.del ne 0 && row.header eq '공지사항'}">
						<td>${row.no}</td>
						<td><a href="./detail?page=${page}&no=${row.no}&inout=${row.inout}">[${row.header}] ${row.title}</a></td>                    
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
			</table>
			<button name="writebtn" onclick="url('./write?write=1')">글쓰기</button>
			<c:set var="totalPage" value="${totalCount / 10 }"/>
			<fmt:parseNumber integerOnly="true" value="${totalPage }" var="totalPage" />
			<c:if test="${totalCount % 10 gt 0 }"><c:set var="totalPage" value="${totalPage +1 }"/></c:if>
			<c:set var="startPage" value="1"/>
			<c:if test="${page gt 5}"><c:set var="startPage" value="${page - 5}"/></c:if>
			<c:set var="endPage" value="${startPage+9}"/>
			<c:if test="${endPage gt totalPage}"><c:set var="endPage" value="${totalPage}"/></c:if>
			<div class="paging">
				<button onclick="paging(1)">⏮</button>
                <button <c:if test="${page -10 lt 1}">disabled="disabled"</c:if> onclick="paging(${page - 10})">◀</button>
                <c:forEach begin="${startPage }" end="${endPage }" var="p"><button <c:if test="${page eq p}">class="currentBtn"</c:if> onclick="paging(${p})">${p}</button></c:forEach>
				<button <c:if test="${page + 10 gt totalPage}">disabled="disabled"</c:if> onclick="paging(${page + 10})">▶</button>
				<button onclick="paging(${totalPage})">⏭</button>
		</div>
		<div>
			
			
		</div>
	</article>

</body>
</html>