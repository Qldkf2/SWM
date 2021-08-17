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
    	<h1 class="mypagearticlesname">내가 참여한 스터디</h1>
    	<c:choose>
			<c:when test="${fn:length(myJoinStudy) > 0}">
    			<c:forEach items="${myJoinStudy}" var="list">
    	<div class="articlelist" style="display: block;">
    		<ol class="group">
    			<li>
    				<!--<a class="community" href="/community?id=3">성북·대학로 지역</a>-->
    						 						<!-- article href에는 게시글 상세보기 페이지로 연결 -->
    				<div data-v-70332c88>
   				
  					<div data-v-70332c88 class="container" style >
      					<hr data-v-70332c88>
      					<div data-v-70332c88 class="list">
      					<input type="hidden" name="meeting_no" value="${list.meeting_no }"/>
         					<a data-v-70332c88 href="view.jsp" class="item">
         						<p data-v-70332c88 class="completed highlight">
	         						<span data-v-70332c88="">모집중</span>
	         					</p>
	         					<p data-v-70332c88 class="badges">
	         						<span data-v-70332c88="">${list.meeting_subject }</span>
	         						<span data-v-70332c88="">${list.meeting_address }</span>
	        					</p>
	         						<h2 data-v-70332c88>${list.meeting_title }</h2>
	         					<p data-v-70332c88 class="info" >
	         						<span data-v-70332c88="">${list.meeting_date }</span>
	         						<span data-v-70332c88="" class="viewcount">${list.meeting_hit }</span>
          						</p>
         					</a>
      					</div>
   					</div>
   					
  				 </div>
    			</li>
    		</ol>
    	</div>
    	</c:forEach>
    	</c:when>
    	<c:otherwise>
    	
    	<a data-v-7c8cb348 class="item" style="margin:20px" >
									<br/><br/><br/><br/>
									<center><img src="https://www.campuspick.com/images/community.board.list.empty.png"/></center>
									<h1 data-v-7c8cb348="" style="text-align:center; margin:30px">참여한 스터디가 없습니다</h1>
								
					         </a>
					         </c:otherwise>
    	</c:choose>
    </div>
  </div>
</body>
</html>