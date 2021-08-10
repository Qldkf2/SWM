<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
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

					<article data-v-7c8cb348>			
							<div data-v-7c8cb348="">
							    <h2 data-v-7c8cb348="">${detail.ask_title}</h2> 
							    		     <p data-v-7c8cb348="" class="info">
							    		     	작성자 : <span data-v-7c8cb348="">${detail.ask_date}</span> 
											    <span data-v-7c8cb348="">${detail.ask_date}</span> 
										     </p>
							    			<p data-v-7c8cb348="" class="text">
												${detail.ask_content }
											</p>
							</div>
						</article>

	     		<form data-v-7c8cb348="" class="comment" action="/myPage/askReplyByAdmin" method="POST">

					
						<hr style="background:#d6d6d6; height:1px;">				
					<p data-v-7c8cb348="" class="text"><textarea name="ask_comment_content" data-v-7c8cb348="" placeholder="답변을 작성하세요. "></textarea></p> 
					<div data-v-7c8cb348="" class="submit">			
						<input data-v-7c8cb348="" type="submit" value="댓글쓰기">
					</div>
					<input type="hidden" name="ask_no" value="${detail.ask_no }">
					
				</form>

	     	
     	</article>
     	
     	<c:choose>
     	<c:when test="${reply == 1 }">
		<div data-v-7c8cb348="" class="comments">
		
		<!-- 부모댓글 class="comment parent" -->
			<div data-v-7c8cb348="" class="comment parent" >			
				<p data-v-7c8cb348="" class="profile" >
					<span data-v-7c8cb348="" class="writer" >관리자</span>
					<span data-v-7c8cb348="" class="info">${adminReply.ask_comment_date }</span> 
					<span data-v-7c8cb348="" class="delete"><img src="../../images/delete.png" width="13px" height="13px"></span>
				</p> 			
				<p data-v-7c8cb348="" class="text">${adminReply.ask_comment_content }</p> 
					
			</div>
	
		
		</div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
     </div>
   
	  	
	<div data-v-7c8cb348="" class="container">    	

		  <a data-v-7c8cb348="" href="/myPage/myAskList"  class="floating write">목록</a> <!---->      	
		  <a data-v-7c8cb348="" href="deleteBoard.jsp"  class="floating write">삭제</a> <!---->      	
	</div>

</body>
</html>