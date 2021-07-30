<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
		<header class="root">
			<div class="wrap">
				<a href="/" class="logo"></a>
				<c:choose>
				<c:when test="${member==null }">
				<div class="account">
					<a href="/loginForm" class="blue">로그인</a>
					<a href="/joinForm" class="white">회원가입</a>
				</div>
				</c:when>
				<c:otherwise>
				<div class="account">
					<a href="/myPage" class="blue">마이페이지</a>
					<a href="/logout" class="white">로그아웃</a>
				</div>
				</c:otherwise>
				</c:choose>
				<nav>
					<a href="/" class="active">홈</a>
					<a href="${pageContext.request.contextPath}/meeting" class="">스터디 모집</a>
					<a href="/studycafeList" class="">스터디 카페 예약</a>
					<a href="/community" class="">커뮤니티</a>
					<a href="/activity" class="">보류</a>
					
				</nav>
<!-- 				<p class="description">
					스터디 윗 미 에서<br>즐겁고 유용한 스터디를 진행해보세요.
				</p> -->
				<div class="buttons"></div>
			</div>
		</header>
</body>
</html>