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
        <!-- 글 내용 -->
        <div class="detailDIV">
            <div class="detailTITLE">
                ${detail.title}
            </div>
            <div class="detailWRITECOUNT">
                <div class="detailWRITE">
                    ${detail.write}
                </div>
                <div class="detailCOUNT">
                    ${detail.count}
                </div>
            </div>
            <div class="detailCONTENT">
                ${detail.content}
            </div>
            <button onclick="url('./inboard')">목록</button>
        </div>

        <!-- 댓글쓰기 -->
        <div class="comment-write">
            <div class="comment-form">
                <textarea id="commentcontent" name="commentcontent"></textarea>
                <button id="comment-btn">댓글쓰기</button>
            </div>
        </div>

        <br><br>
        <!-- 댓글보여주기 -->
        <div class="ccomments">
            <c:forEach items="${commentList}" var="co">
            	<div class="comment">
            		<div class="chead">
            			<div class="cname">${co.mname }
            				<div class="cdate">${co.cdate }</div>
                            <img class="commentDelete" src="./img/comment_del.png">
            			</div>
            		</div>
            		<div class="ccomment">${co.ccomment}</div>
                    <button id="reply">답글</button>
                    </div>
            </c:forEach>
        </div>
     

        
    </article>

</body>
</html>