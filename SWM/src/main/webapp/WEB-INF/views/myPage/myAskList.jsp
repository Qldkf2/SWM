<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>스윗미</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/askDetail.css">



</head>
<body>
	<c:import url="../common/header.jsp" />
  
	<div data-v-7c8cb348="" class="container" >
	
	
	<article data-v-7c8cb348>
  <h1 data-v-7c8cb348="">1:1 문의</h1>     

				      <div data-v-7c8cb348 class="search">
				         <form data-v-7c8cb348 class>
				            <input data-v-7c8cb348 type="search" name="keyword" class="keyword" placeholder="검색" value="" autocomplete="off" >
				            <input data-v-7c8cb348 type="submit" class="submit" >
				            
				         </form>
				      </div>
					
					
		<hr style="background:#d6d6d6; height:1px;">
				      <div data-v-7c8cb348 class="list">
				      
				      <!-- 리스트 -->

		
							  
							   <a data-v-7c8cb348 href="/myPage/myAskDetail" class="item">
					
					         <h2 data-v-7c8cb348="">질무니가 있어요!</h2>
					         <p data-v-7c8cb348 class="info" >
					        	 <span data-v-7c8cb348="">하잇!</span>
					         	<span data-v-7c8cb348="">오늘 09:12</span>
					         						         	<span data-v-7c8cb348="" class="commentcount">17</span>
					          </p>
					         </a>			
					         
						<a data-v-7c8cb348 href="detailAskBoard.jsp" class="item">         					
					         <h2 data-v-7c8cb348="">오늘 드럽게 느려요!!</h2>
					         <p data-v-7c8cb348 class="info" >
					        	 <span data-v-7c8cb348="">끼야야야야</span>
					         	<span data-v-7c8cb348="">오늘 09:12</span>
					         						         	<span data-v-7c8cb348="" class="commentcount">17</span>
					          </p>
					         </a>
					         
					         
					        <a data-v-7c8cb348 href="/meeting/board?id=113060" class="item">
					
					         <h2 data-v-7c8cb348="">오늘 서버 왜이러죵?</h2>
					         <p data-v-7c8cb348 class="info" >
					        	 <span data-v-7c8cb348="">하잇!</span>
					         	<span data-v-7c8cb348="">오늘 09:12</span>
					         						         	<span data-v-7c8cb348="" class="commentcount">17</span>
					          </p>
					         </a>
	
					        <a data-v-7c8cb348 href="/meeting/board?id=113060" class="item">
					
					         <h2 data-v-7c8cb348="">스터디모임은 어떻게 만들수 있죠?</h2>
					         <p data-v-7c8cb348 class="info" >
					        	 <span data-v-7c8cb348="">하잇!</span>
					         	<span data-v-7c8cb348="">오늘 09:12</span>
					         						         	<span data-v-7c8cb348="" class="commentcount">17</span>
					          </p>
					         </a>
					         
					         			         

      				</div>


	     	
	     	
     	</article>
     	
     	
     </div>
     	

 
	<div data-v-7c8cb348="" class="container">    		
		
		 <a data-v-7c8cb348 href="writeAskBoard.jsp" class="floating write" >문의하기</a>

	</div>
	

<div class="modal hidden">
  <div class="bg"></div>

  <div class="modalBox">

  

	     		<form class="join_meeting">
					<p class="text"><textarea placeholder="가입신청 글을 간단하게 써주세요! "></textarea></p> 
					<div class="submit">			
						<input type="button" id="cancel" value="취소">
				
					</div>
								
				</form>

  </div>
</div>

</body>
</html>