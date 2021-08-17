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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/293ea01f8752947ab0a4.css">




</head>
<body>
<c:import url="../common/header.jsp" />
   
   
	<div data-v-7c8cb348="" class="container" >
	
	
	<article data-v-7c8cb348 style="height: 100%;">

			
							
							<div data-v-7c8cb348="">
							    <h2 data-v-7c8cb348="">${freeBoardDetail.free_title}</h2>  
							    		     <p data-v-7c8cb348="" class="info">
											     <span data-v-7c8cb348="">${freeBoardDetail.free_date}</span> 
											     <span data-v-7c8cb348="" class="viewcount">${freeBoardDetail.free_hit}</span> 
										     </p>
							    			<p data-v-7c8cb348="" class="text">
												${freeBoardDetail.free_content}<br>
											</p>
									<c:forEach items="${files}" var="files">
									<img src="${pageContext.request.contextPath}/resources/files/freeBoard/${files.stored_file_name}" style="width: 350px;"/>
									</c:forEach>
					
							</div>
			 <form data-v-7c8cb348="" class="comment" action="/community/commentWrite?free_no=${freeBoardDetail.free_no}" method="post" style="margin-top: 10px;height: 20%;">
	     		<br>
					<div data-v-7c8cb348="" class="submit">			
					
					<input type="hidden" name="free_no" value="${freeBoardDetail.free_no}">
						<input data-v-7c8cb348="" type="submit" value="댓글쓰기" style="float: right;">
					<input type="hidden" name="userNo" value="${member.userNo}">
									
					</div>
						<hr style="background:#d6d6d6; height:1px;">				
					<p data-v-7c8cb348="" class="text">
					<textarea data-v-7c8cb348="" placeholder="댓글을 입력하세요." name="free_comment_content" style="width:690px;height:50px;font-size: 16px;"></textarea></p> 	
				</form>

	     	<hr style="background:#d6d6d6; height:1px;">
						

     	</article>
     	


	
		<div data-v-7c8cb348="" class="comments">
		
		<c:forEach items="${cumList}" var="list">
		
		<!-- 부모댓글 class="comment parent" -->
			<div data-v-7c8cb348="" class="comment parent" >			
				<p data-v-7c8cb348="" class="profile" >
					 <span data-v-7c8cb348="" class="writer" >${list.nickName}</span>
					<span data-v-7c8cb348="" class="info">(${list.free_comment_date})</span> 
					<span data-v-7c8cb348="" class="delete"><img src="../../images/delete.png" width="13px" height="13px"></span>
				</p> 			
				<p data-v-208a49f8="" data-v-7c8cb348="" class="text">${list.free_comment_content}</p> 
					 <c:if test="${member.userNo == list.userNo}">  
					 <form method="post" action="/community/communityCommentDelete?free_comment_no=${list.free_comment_no}&free_no=${list.free_no}">
					<input type="hidden" name="free_comment_no" value="${free_comment_content}">
					<input type="submit" value="댓글삭제">
					</form>
					</c:if>
			</div>
				
			</c:forEach>
			
		
		
		
		</div>
     </div>
     	
	
	<div data-v-7c8cb348="" class="container">    	

		  <a data-v-7c8cb348="" href="/community"  class="floating write">목록</a> <!---->   
		  <c:if test="${member.userNo == freeBoardDetail.userNo}">   	
		  <a data-v-7c8cb348="" href="/community/communityBoardModufy"  class="floating write">수정</a> <!---->      	
		  <a data-v-7c8cb348="" href="/community/communityBoardDelete?free_no=${freeBoardDetail.free_no}"  class="floating write">삭제</a> <!---->
		  </c:if>      	
	</div>

</body>
</html>