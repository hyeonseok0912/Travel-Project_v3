<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
	//게시글 삭제하기
	function writedel() {
		var ch = confirm("글을 삭제하시겠습니까?");
		if(ch){
			location.href="./writedel?no=${detail.no}";
		}
	}
	function writeedit() {
		var ch = confirm("글을 수정하시겠습니까?");
		if(ch){
			location.href="./writeedit?no=${detail.no}";
		}
	}
	function selectBoard() {
		if(${detail.inout} == 0){
			location.href="./inboard";
		} else {
			location.href="./outboard";
		}
	}
    
	// 댓글 삭제하기
    $(document).ready(function(){
	    $(".commentDelete").click(function(){
	         if(confirm("댓글을 삭제할까요?")) {
	            let cno = $(this).prev().val();
	            let point = $(this).closest(".comment"); // 상위에서 .comment를 찾아 전부지움
	            
	            $.ajax({
	                url : './commentDel',
	                type : 'post',
	                dataType : 'text',
	                data : {no : cno},
	                success:function(result){
	                    if(result == 1) {
	                        point.remove();
                            alert("삭제되었습니다.")
	                    } else {
	                        alert("삭제할 수 없습니다.")
	                    }
	                },
	                error:function(request, status, error){
	                    alert("문제가 발생했습니다.");
	                }
	                
	            }); // end ajax
	        } 
	    });
    
        // 댓글 작성하기를 눌렀을 때 실행될 꺼
        $("#comment-btn").click(function(){
            let commentcontent = $("#commentcontent").val();
            let bno = ${detail.no };
            if(commentcontent.length < 1) {
                alert("내용을 입력해주세요.");
                $("#commentcontent").focus();
            } else {
                $.ajax({
                    url : './comment',
                    type : 'post',
                    dataType : 'text',
                    data : {commentcontent : commentcontent, bno : bno},
                    success:function(result){
                        if(result == 1) {
                            alert("댓글이 등록되었습니다.");
                            location.href = "./detail?no="+ bno;
                        } else {
                            alert("로그인 후 이용해주세요.");
                            location.href="./login";
                        }
                    },
                    error:function(request, status, error){
                        alert("댓글 작성에 문제가 발생했습니다.");
                    }
                });
            }
        });
    });

</script>
</head>
<body>
    <header><%@ include file="menu.jsp"%></header>
	<button onclick="writeedit()">수정</button>
	<button onclick="writedel()">삭제</button>
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
            <button onclick="selectBoard()" value="${detail.inout}">목록</button>
        </div>

        <!-- 댓글쓰기 -->
        <div class="comment-write">
            <div class="comment-form">
                <textarea id="commentcontent" name="commentcontent"></textarea>
                <button id="comment-btn">댓글쓰기</button>
            </div>
        </div>

        <br><br>
        <!-- 댓글보여주기  -->
        <div class="ccomments">
            <c:forEach items="${commentList}" var="co">
            	<div class="comment">
            		<div class="chead">
            			<div class="cname">${co.mname } 
                            <c:if test="${sessionScope.mname ne null && co.mid eq sessionScope.mid }">
                                <input type="hidden" class="cno" value="${co.cno }">
                                <img class="commentDelete" alt="delete" src="./img/comment_del.png">
            				    <div class="cdate">${co.cdate }</div>
                        	</c:if>
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