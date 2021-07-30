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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}resources/css/meeting/meeting.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/meeting2.css">


</head>
<body>
<c:import url="../common/header.jsp" />

	<section class="tab">
	<div class="wrap">
     <a href="/subject/list" class="active"><span class="text">전체</span></a>
      <a href="/subject/language"><span class="text">어학</span></a>
      <a href="/subject/employment"><span class="text">취업</span></a>
      <a href="/subject/official"><span class="text">고시/공무원</span></a>
      <a href="/subject/hobby"><span class="text">취미/교양</span></a>
      <a href="/subject/programming"><span class="text">프로그래밍</span></a>
      <a href="/subject/etc"><span class="text">기타</span></a>
	</div>
	</section>
   
	<div data-v-7c8cb348="" class="container">
	
	<article data-v-7c8cb348="">
		 <p data-v-7c8cb348="" class="completed highlight">
	        모집중
	     </p> 
	     
	     <h1 data-v-7c8cb348="">${article.meeting_title}</h1>     
		     <p data-v-7c8cb348="" class="info">
			     <span data-v-7c8cb348="">${article.meeting_date}</span> 
			     <span data-v-7c8cb348="" class="viewcount">5</span> 
		     </p>
			<section data-v-7c8cb348="" class="tab" style="top: 0px;">
				 <div data-v-7c8cb348="" class="wrap">
				    <a data-v-7c8cb348="" href="/meeting/meetingDetail?meeting_no=${article.meeting_no}" class="active"><span class="text">모집 공고</span></a>
				    <a data-v-7c8cb348="" href="/meeting/meetingBoard?meeting_no=${article.meeting_no}" ><span class="text">게시판</span></a>
			     </div>
				  </section>
				  
			<div data-v-7c8cb348="" class="about">	     	  
		  		<h3 data-v-7c8cb348="">분야</h3>  <p data-v-7c8cb348="" class="indent"> ${article.meeting_subject}  </p> 
		     	<h3 data-v-7c8cb348="">지역</h3>  <p data-v-7c8cb348="" class="indent"> ${article.meeting_address}  </p> 
				<h3 data-v-7c8cb348="">정원</h3>  <p data-v-7c8cb348="" class="indent"> ${article.meeting_limit}명  </p> 
				  <hr style="background:#d6d6d6; margin-top:15px; height:1px;">
				  
				  <p data-v-7c8cb348="" data-v-7c8cb348="" class="text">
			${article.meeting_content}
					</p>
	     	</div>
	     	
			
			
		
     	</article>
     </div>
     
     
    <!-- 	      <a data-v-7c8cb348=""  href="/" class="floating comment" target='_blank'>가입하기</a>  	  --> 	
 	
 	<c:choose>
				<c:when test="${member.userNo == article.meeting_leader }">
					<div data-v-7c8cb348="" class="container">    		
		 				 <a data-v-7c8cb348="" href="/meeting"  class="floating comment">목록</a> <!---->      	
					     <a data-v-7c8cb348=""  class="floating comment" id="modal">신청확인</a> <!---->
					     <a data-v-7c8cb348="" href="/meeting/meetingUpdateForm?meeting_no=${article.meeting_no}"  class="floating comment" id="modal">수정하기</a>
					     <a data-v-7c8cb348=""  class="floating comment" id="modal">삭제하기</a>
	                </div >
				</c:when>
				<c:otherwise>
				<div data-v-7c8cb348="" class="container">    		
		 			 <a data-v-7c8cb348="" href="/meeting"  class="floating comment">목록</a> <!---->      	
	     			 <a data-v-7c8cb348=""  class="floating comment" id="modal">가입신청</a> <!---->
				</div >
				</c:otherwise>
				</c:choose>
<div class="modal hidden">
  <div class="bg"></div>

  <div class="modalBox">
	     		<form class="join_meeting">
					<p class="text"><textarea placeholder="가입신청 글을 간단하게 써주세요! "></textarea></p> 
					<div class="submit">			
						<input type="button" id="cancel" value="취소">
						<input type="submit" value="가입신청">
					</div>
								
				</form>

  </div>
</div>

<script>
window.onload = function() {
	
	function onClick() {
	    document.querySelector(".modal").classList.remove("hidden");
	  }
	
	  function offClick() {
	    document.querySelector(".modal").classList.add("hidden");
	  }
	
	  document.getElementById('modal').addEventListener("click", onClick);
	  document.getElementById('cancel').addEventListener("click", offClick);

	  document.querySelector(".bg").addEventListener("click", offClick);
  };
</script>
	




</body>
</html>