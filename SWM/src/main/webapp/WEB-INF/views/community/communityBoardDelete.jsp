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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/9b1ec3ca087eb97f815a.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/293ea01f8752947ab0a4.css">




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
			      <a data-v-7c8cb348="" href="view.jsp" ><span class="text">모집 공고</span></a>
			      <a data-v-7c8cb348="" href="board.jsp"  class="active"><span class="text">게시판</span></a>
			    </div>
			  </section>


		<form data-v-7c8cb348="" class="container">
		   <div data-v-7c8cb348="" class="delete">
		 
	
			
			 <input data-v-7c8cb348="" type="text" class="pwd" placeholder="글의 비밀번호를 입력하세요.">

					
			
				<p data-v-7c8cb348 class="btn" >
					<input data-v-7c8cb348 type="button" id="cancel" value="취소">
					<input data-v-7c8cb348="" type="submit" class="submit" value="삭제">
				</p>
						</div>

			</form>

		
		</article>

     </div>
     	
	


</body>
</html>