<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

			<nav>
				<ul>
					<li onclick="url('./index')">홈</li>
					<li onclick="url('./inboard')">국내게시판</li>
					<li onclick="url('./outboard')">국외게시판<c:choose><c:when test="${sessionScope.mname eq null}">
					<li onclick="url('./login')">로그인</li></c:when><c:otherwise>
					<li onclick="url('./myInfo')">${sessionScope.mname }님</li>
					<li onclick="url('./logout')">로그아웃</li></c:otherwise></c:choose>
				</ul>
			</nav>