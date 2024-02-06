<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국내 게시판</title>

<!-- 부트스트랩 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>
	<header>
	<%@ include file="menu.jsp" %>
	</header>
   <article>
      <div class="title">
      <h1>국내 여행 게시판</h1>
         <button name="writebtn" onclick="url('./write?write=0')">글쓰기</button>
        <div>
			<a href="./inboard?write=0"> | 전체 |</a>
			<a href="./inboard?write=0&category=공지사항">공지사항 |</a>			
			<a href="./inboard?write=0&category=여행정보">여행정보 |</a>
			<a href="./inboard?write=0&category=잡담">잡담 |</a>
		</div>
         <div>
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
					<c:when test="${param.category eq '공지사항'}">
					<c:forEach items="${list}" var="row">
            		<tr>
        	   			<c:if test="${row.inout eq 0 && row.del ne 0 && row.header eq '공지사항'}">
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
        	   			<c:if test="${row.inout eq 0 && row.del ne 0 && row.header eq '여행정보'}">
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
        	   			<c:if test="${row.inout eq 0 && row.del ne 0 && row.header eq '잡담'}">
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
        	   			<c:if test="${row.inout eq 0 && row.del ne 0}">
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
                    전체 글 수 : ${totalCount }개 글이 있습니다 /<c:set var="totalPage" value="${totalCount/10 }"/>
					<fmt:parseNumber integerOnly="true" value="${totalPage }" var="totalPage"/>
					<c:if test="${totalCount % 10 gt 0}">
						<c:set var="totalPage" value="${totalPage +1 }"/>
					</c:if>
					전체 페이지 수:<c:out value="${totalPage }"/>
					<c:set var ="startPage" value="1"/>
					<c:if test="${page gt 5}">
						<c:set var="startPage" value="${page-5 }"/>
					</c:if>
					<c:set var = "endPage" value="${startPage +9 }"/>
					<c:if test="${endPage gt totalPage }">
						<c:set var="startPage" value="${totalPage - 9 }"/>
						<c:set var="endPage" value="${totalPage }"/>
					</c:if>
							<nav aria-label="Page navigation example">
  								<ul class="pagination">
									<li class="page-item"><button class="page-link" onclick="paging(${page-10})" <c:if test="${page - 10 lt 1 }">disabled="disabled"</c:if> >이전</button></li>
   									<c:forEach begin="${startPage }" end="${endPage }" var="p">
   									<li class="page-item"><a class="page-link" onclick="paging(${p})">${p }</a></li>
									</c:forEach>
									<li class="page-item"><button class="page-link" onclick="paging(${page+10})" <c:if test="${page + 10 gt totalPage }">disabled="disabled"</c:if>>다음</button></li>
 								 </ul>
							</nav>
						</div>
            		</div>
         		</div>
      		<div>
			<button name="writebtn" onclick="url('./write?write=0')">글쓰기</button>
	 		</div>
<script type="text/javascript">
	function paging(no){
		location.href="inboard?page="+no;
}
</script>
</article>
</body>
</html>