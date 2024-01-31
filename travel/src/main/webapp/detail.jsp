<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>
    <header><%@ include file="menu.jsp"%></header>

    <article>
        <div>
            <div class="detailTITLE">
                ${detail.title}
            </div>
            <div class="detailWRITE">
                ${detail.write}
            </div>
            <div class="detailCOUNT">
                ${detail.count}
            </div>
            <div class="detailCONTENT">
                ${detail.content}
            </div>
        </div>
        <br><br>
        <div class="ccomments">
            <c:forEach items="${commentList}" var="co">
            	<div class="comment">
            		<div class="chead">
            			<div class="cname">${co.mname }
            				<div class="cdate">${co.cdate }</div>
            			</div>
            		</div>
            		<div class="ccomment">${co.ccomment}</div>
            	</div>
            </c:forEach>
        </div>

        
    </article>

</body>
</html>