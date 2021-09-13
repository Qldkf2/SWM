<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>스윗미</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">


</head>
<body>
<c:import url="common/header.jsp" />


	<div>
		<div class="container">

			<section class="center">
			<!--모집글최근 -->
				<div class="recent">
					<div class="title">
						<h2>
							<a href="/meeting">Study With Me!</a>
						</h2>
						<p class="description">공부는 해야겠는데 혼자는 힘드시다고요? 근처 신규 스터디를 찾아보세요.</p>
					</div>
					<ol class="items">
					
				<c:choose>
     		 	<c:when test="${fn:length(meetingList) > 0}">
							<c:forEach items="${meetingList}" var="meeting">

						<li><a href="/meeting/meetingDetail?meeting_no=${meeting.meeting_no}" class="item">
								<span class="dday active">[NEW]</span>
								<div class="profile">									
									<span class="name" style="font-size:18px;"> ${meeting.meeting_title }</span>									
								</div>
								<hr>
					<span class="viewcount">${meeting.meeting_hit}</span>
								<h3 class="light">${meeting.nickname}</h3>
											
							</a>
						</li>		
						</c:forEach>				
						</c:when>
						
						<c:otherwise>
						
							<li><a>
								<span class="dday active"></span>
								<div class="profile">									
									<span class="name" style="font-size:18px; text-align:center;"> 조회된 결과가 없습니다.</span>									
								</div>
								<hr>
								<span class="viewcount"></span>
								<h3 class="light"></h3>
							</a>
						</li>		
						</c:otherwise>
						
						</c:choose>
					</ol>
					
	
				</div>
				
				
				
				<div class="cards">
				
				<c:choose>
     		 	<c:when test="${fn:length(studycafeList) > 0}">
		 		<c:forEach items="${studycafeList}" var="cafe">
					
					<div class="card" style="width:235px;">
						<p class="profile">
							<span class="nickname">스윗미 스터디카페  ${cafe.studycafe_name}</span>
						</p>
						<figure class="thumbnail">
							<img src="${pageContext.request.contextPath}/resources/images/studycafe/sca.png" style="width: 200px; height: 250px;"/>
					
						</figure>
						<div class="content">
							<h3>스윗미 스터디카페</h3>
							<p class="text"> ${cafe.studycafe_name}</p>
							<a href="/studycafe/studycafeDetail?studycafe_no=${cafe.studycafe_no}" class="button" style="margin-left: 7px;margin-right: 15px;">
							자세히 보기</a>
						</div>
					</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<a  class="item" >
      	 		        <h2  >조회된 결과가 없습니다.</h2>
     			 	 </a>
					</c:otherwise>
					</c:choose>
					
				</div>
		



				<div class="recent">
					<div class="title">
						<h2>
							<a href="/community"> 커뮤니티 </a>
						</h2>
						<p class="description">스터디 윗미의 커뮤니티를 둘러 보세요.</p>
					</div>
					<ol class="items">
						<c:choose>
     		 	<c:when test="${fn:length(communityList) > 0}">
		 		<c:forEach items="${communityList}" var="community">
						<li><a href="/freeBoard/freeBoardDetail?free_no=${community.free_no}" class="item">
								<span class="dday active">[NEW]</span>
								<h3 class="bold">${community.free_title}</h3>
								<hr>
								<span class="viewcount">${community.hit}</span> <span class="detail">[ ${community.nickname} ] </span>
							</a></li>
							</c:forEach>
							
						</c:when>
						<c:otherwise>
								<li><a class="item">
								<span class="dday active"></span>
								<h3 class="bold">게시글이 존재하지 않습니다.</h3>
								<hr>
								<span class="viewcount"></span> <span class="detail"></span>
							</a></li>
						</c:otherwise>
						</c:choose>
						

					</ol>
				</div>
			</section>
			<section class="leftside">
				<c:choose>
				<c:when test="${ member.userId eq 'kimbbial' && member.password eq '11223344' }">
					<div data-v-f077870a="" class="logged"><img data-v-f077870a="" src="https://cf-epi.campuspick.com/0.png" class="picture">
					 	<span data-v-f077870a="" class="nickname">${member.nickName}</span> 
					 		<a data-v-f077870a="" href="/admin" class="button"> 관리자 페이지 </a> 
					 		<a data-v-f077870a="" href="/logout" class="button"> 로그아웃 </a> 
					 	<hr data-v-f077870a="">
					 </div>
			</c:when>
			<c:when test="${member != null }">
				<div data-v-f077870a="" class="logged"><img data-v-f077870a="" src="https://cf-epi.campuspick.com/0.png" class="picture">
					 	<span data-v-f077870a="" class="nickname">${member.nickName}</span> 
					 		<a data-v-f077870a="" href="/myPage" class="button"> 마이페이지 </a> 
					 		<a data-v-f077870a="" href="/logout" class="button"> 로그아웃 </a> 
					 	<hr data-v-f077870a="">
					 </div>
			</c:when>
			<c:otherwise>
				<div class="loggedout">
					<p class="introduction">
						관심있는 스터디를 pick 하고<br> 다른 학생들과 교류해보세요!
					</p>
					<a href="/loginForm" class="button login"> 로그인 </a>
					<a href="/joinForm" class="button register"> 회원가입 </a>
					<hr>
				</div>
			</c:otherwise>
			</c:choose>
		
			
				<%-- <c:choose>
				<c:when test="${member == null}">
				<div class="loggedout">
					<p class="introduction">
						관심있는 스터디를 pick 하고<br> 다른 학생들과 교류해보세요!
					</p>
					<a href="/loginForm" class="button login"> 로그인 </a>
					<a href="/joinForm" class="button register"> 회원가입 </a>
					<hr>
				</div>
				</c:when>
				<c:otherwise>
					<div data-v-f077870a="" class="logged"><img data-v-f077870a="" src="https://cf-epi.campuspick.com/0.png" class="picture">
					 	<span data-v-f077870a="" class="nickname">${member.nickName}</span> 
					 		<a data-v-f077870a="" href="/myPage" class="button"> 마이페이지 </a> 
					 		<a data-v-f077870a="" href="/logout" class="button"> 로그아웃 </a> 
					 	<hr data-v-f077870a="">
					 </div>
				</c:otherwise>
				</c:choose> --%>
				<!---->


				<ol class="communities" style="height: auto;">
					<c:choose>
					<c:when test="${member != null }">
									<h2>내가 가입한 모임</h2>
					<c:choose>
						<c:when test="${fn:length(myMeetingList) > 0}">
		 					<c:forEach items="${myMeetingList}" var="myMeeting">
							<li>
								<a href="/meeting/meetingDetail?meeting_no=${myMeeting.meeting_no}" class="community">
										<!-- 프로필사진 -->
										<figure style="background-image: url(&quot;${pageContext.request.contextPath}/resources/images/s_image.JPG"><</figure>
										<p class="name">${myMeeting.meeting_title }</p>
										<hr>
										<p class="details" style=" text-align: right;">
											<span class="category" >  ${myMeeting.nickname } </span>
										</p>
										
									</a>
								</li>
							</c:forEach>
						<li style="text-align: center;">
						<img alt="" src="/resources/images/b2.png" style=" margin-top: 20px;  width: 280px;">
						</li>
							</c:when>
		
							<c:otherwise>
								<li >
								<a class="community">
										<!-- 프로필사진 -->
										<figure style="background-image: url(&quot;${pageContext.request.contextPath}/resources/images/s_image.JPG"><</figure>
										<p class="name">가입한 모임이 없습니다.</p>
										<hr>
										<p class="details" style=" text-align: right;">
											<span class="category" > </br> </span>
										</p>
										
									</a>
								</li>
														<li style="text-align: center;">
						<img alt="" src="/resources/images/b2.png" style=" margin-top: 20px;  width: 280px;">
						</li>
							</c:otherwise>
						</c:choose>
						</c:when>
						
						<c:otherwise>
						<li style="text-align: center;">
						<img alt="" src="/resources/images/b2.png" style=" margin-top: 20px;  width: 280px;">
						</li>
						</c:otherwise>
						</c:choose>
				
				</ol>
			</section>
		</div>
	</div>

</body>
</html>