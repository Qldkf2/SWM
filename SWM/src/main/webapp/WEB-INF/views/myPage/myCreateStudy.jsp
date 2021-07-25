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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/9b1ec3ca087eb97f815a.css">
</head>
<body>
<c:import url="../common/header.jsp"/>
	<div id="container" data-id="myarticle">
    	<h1 class="mypagearticlesname">내가 개설한 스터디</h1>
    	<div class="articlelist" style="display: block;">
    		<ol class="group">
    			<li>
    				<!--<a class="community" href="/community?id=3">성북·대학로 지역</a>-->
    											<!-- article href에는 게시글 상세보기 페이지로 연결 -->
    				<div data-v-70332c88>
   
  					<div data-v-70332c88 class="container" style >
      					<hr data-v-70332c88>
      					<div data-v-70332c88 class="list">
         					<a data-v-70332c88 href="view.jsp" class="item">
         						<p data-v-70332c88 class="completed highlight">
	         						<span data-v-70332c88="">모집중</span>
	         					</p>
	         					<p data-v-70332c88 class="badges">
	         						<span data-v-70332c88="">과목</span>
	         						<span data-v-70332c88="">지역</span>
	        					</p>
	         						<h2 data-v-70332c88>부평, 부부평평 스터디</h2>
	         					<p data-v-70332c88 class="info" >
	         						<span data-v-70332c88="">오늘 09:12</span>
	         						<span data-v-70332c88="" class="viewcount">2</span>
          						</p>
         					</a>
      					</div>
   					</div>
  				 </div>
    			</li>
    		</ol><div class="loading" style="display: none;">
    		<img src="/images/community.loading.svg">
    	</div>
    </div>
  </div>
</body>
</html>