<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/board.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/common.css">
</head>
<body>
<c:import url="../common/header.jsp"/>
	<div id="container" data-id="myarticle">
    	<h1 class="mypagearticlesname">댓글 단 글</h1>
    	<div class="articlelist" style="display: block;">
    		<ol class="group">
    			<li>
    				<!--<a class="community" href="/community?id=3">성북·대학로 지역</a>-->
    											<!-- article href에는 게시글 상세보기 페이지로 연결 -->
    				<a class="article" href="/community?id=3&amp;boardId=370126&amp;articleId=200229028">
    					<p class="profile">
    						<img class="picture" src="https://cf-epi.campuspick.com/0.png">
    						<span class="nickname">글 작성자 이름</span>
    						<time>07/18 17:05 글 작성시간</time>
    					</p>
    					<hr>
    					<p class="text short">글 내용</p>
    					<p class="status">
    					<span class="votecount">0</span> <!-- 인기커뮤니티 글 메인에서 보여줄거면 얘도 필요  -->
    					<span class="commentcount">1</span>
    					</p>
    					<p class="attach"></p>
    					<hr>
    				</a>
    			</li>
    		</ol><div class="loading" style="display: none;">
    		<img src="/images/community.loading.svg">
    	</div>
    </div>
  </div>
</body>
</html>