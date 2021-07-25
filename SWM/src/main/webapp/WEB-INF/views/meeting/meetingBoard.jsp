<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>스윗미</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contentType }/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contentType }/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contentType }/resources/css/meeting/meeting.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contentType }/resources/css/meeting/meeting2.css">



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
   
	<div data-v-7c8cb348="" class="container" >
	
	
	<article data-v-7c8cb348>
		 <p data-v-7c8cb348="" class="completed highlight">
	        모집중
	     </p> 
	     
	     <h1 data-v-7c8cb348="">같이 독서습관 기르기</h1>     
		     <p data-v-7c8cb348="" class="info">
			     <span data-v-7c8cb348="">07/14 10:36</span> 
			     <span data-v-7c8cb348="" class="viewcount">5</span> 
		     </p>

	
     
			<section data-v-7c8cb348="" class="tab" style="top: 0px;">
			    <div data-v-7c8cb348="" class="wrap">
			      <a data-v-7c8cb348="" href="/" ><span class="text">모집 공고</span></a>
			      <a data-v-7c8cb348="" href="/meeting/meetingBoard"  class="active"><span class="text">게시판</span></a>
			    </div>
			  </section>



				   

				      <a data-v-7c8cb348 href="/meeting/meetingBoardWrite" class="floating write" >글쓰기</a>
				      <div data-v-7c8cb348 class="search">
				         <form data-v-7c8cb348 class>
				            <input data-v-7c8cb348 type="search" name="keyword" class="keyword" placeholder="검색" value="" autocomplete="off" >
				            <input data-v-7c8cb348 type="submit" class="submit" >
				            
				         </form>
				      </div>
					
					
		<hr style="background:#d6d6d6; height:1px;">
				      <div data-v-7c8cb348 class="list">
				      
				      <!-- 리스트 -->
							  <a data-v-7c8cb348 href="/meeting/meetingBoardDetail" class="item">
					
					         <h2 data-v-7c8cb348="">모임 장소 및 시간 공지요!</h2>
					         <p data-v-7c8cb348 class="info" >
					        	 <span data-v-7c8cb348="">끼야야야야</span>
					         	<span data-v-7c8cb348="">오늘 09:12</span>
					         	<span data-v-7c8cb348="" class="viewcount">2</span>
					         	<span data-v-7c8cb348="" class="commentcount">17</span>
					          </p>
					         </a>
					         
					         
					        <a data-v-7c8cb348 href="/meeting/board?id=113060" class="item">
					
					         <h2 data-v-7c8cb348="">가입 인사 드립니당</h2>
					         <p data-v-7c8cb348 class="info" >
					        	 <span data-v-7c8cb348="">하잇!</span>
					         	<span data-v-7c8cb348="">오늘 09:12</span>
					         	<span data-v-7c8cb348="" class="viewcount">2</span>
					          </p>
					         </a>
	
					        <a data-v-7c8cb348 href="/meeting/board?id=113060" class="item">
					
					         <h2 data-v-7c8cb348="">문의 드려요!</h2>
					         <p data-v-7c8cb348 class="info" >
					        	 <span data-v-7c8cb348="">하잇!</span>
					         	<span data-v-7c8cb348="">오늘 09:12</span>
					         	<span data-v-7c8cb348="" class="viewcount">2</span>
					          </p>
					         </a>
					         
					         
					         
					        <a data-v-7c8cb348 href="/meeting/board?id=113060" class="item">
					
					         <h2 data-v-7c8cb348="">질무니가 있어요!</h2>
					         <p data-v-7c8cb348 class="info" >
					        	 <span data-v-7c8cb348="">하잇!</span>
					         	<span data-v-7c8cb348="">오늘 09:12</span>
					         	<span data-v-7c8cb348="" class="viewcount">2</span>
					          </p>
					         </a>					         
					         
					         			         

      				</div>


	     	
	     	
     	</article>
     	
     	
     </div>
     	

 
	<div data-v-7c8cb348="" class="container">    		

	      <a data-v-7c8cb348=""  class="floating comment" id="modal">가입신청</a>
	</div>
	

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