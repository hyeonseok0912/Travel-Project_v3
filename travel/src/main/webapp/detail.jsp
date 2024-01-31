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
    <header><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%></header>

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

        
    </article>

</body>
</html>