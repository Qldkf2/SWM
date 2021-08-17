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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/askDetail.css">

</head>
<body>
<c:import url="../common/header.jsp"/>
	<div id="container" data-id="myarticle">
    	<h1 class="mypagearticlesname">내가 쓴 글</h1>
    	
    	<c:choose>
			<c:when test="${fn:length(SBList) > 0}">
				<c:forEach items="${SBList}" var="SB">
    	<div class="articlelist" style="display: block;">
    		<ol class="group">
    			<li>
    				<a class="article" href="/meeting/meetingDetail?meeting_no=${SB.meeting_no }">
    					<p class="profile">
    						<img class="picture" src="https://cf-epi.campuspick.com/0.png">
    						<span class="nickname">${SB.meeting_board_title}</span>
    						<time>${SB.meeting_board_date }</time>
    					</p>
    					<hr>
    					<p class="text short">${SB.meeting_board_content}</p>
    					<p class="status">
    					<!-- <span class="votecount">0</span> 인기커뮤니티 글 메인에서 보여줄거면 얘도 필요  -->
    					<span class="commentcount">1</span>
    					</p>
    					<p class="attach"></p>
    					<hr>
    				</a>
    			</li>
    		</ol>
    </div>
    </c:forEach>
    </c:when>
    <c:otherwise>
    <a data-v-7c8cb348 class="item" style="margin:20px" >
									<br/><br/><br/><br/>
									<center><img src="https://www.campuspick.com/images/community.board.list.empty.png"/></center>
									<h1 data-v-7c8cb348="" style="text-align:center; margin:30px">등록된 문의가 없습니다</h1>
								
					         </a>
	</c:otherwise>
	</c:choose>
  </div>
</body>
</html>