<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/communityBoard.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myPage/myPageCommunityList.js"></script>
</head>
<body>

	<c:import url="../common/header.jsp"></c:import>
	<div id="container" data-id="myarticle">
		<h1 class="mypagearticlesname">예약 현황</h1>
		<c:choose>
		<c:when test="${fn:length(bookList) > 0}">
			<c:forEach items="${bookList}" var="book">
		
		<div class="articlelist" style="display :block;">
			<ol class="group">
				<li>
					<a class="community" href=""></a>
					<a class="article" href="">
						<p class="profile">
							<span class="nickname">${book.userName}</span> 
							<time>${book.book_date }</time>
						</p>
						<hr>
						<p class="text short">${book.studycafe_name }</p>
						<!-- <p class="status">
							<span class ="votecount">0</span>
							<span class="commentcount">1</span>
						</p> -->
						<p class="text short">예약 날짜 : ${book.book_date}</p>
						<p class="text short">예약 시간 : ${book.start_time} ~ ${book.end_time}</p>
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
									<h1 data-v-7c8cb348="" style="text-align:center; margin:30px">예약한 스터디카페가 없습니다</h1>
								
					         </a>
		
		</c:otherwise>
		</c:choose>
	</div>

</body>
</html>