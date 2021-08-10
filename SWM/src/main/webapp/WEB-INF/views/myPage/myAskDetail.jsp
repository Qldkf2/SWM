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
							    <h2 data-v-7c8cb348="">${detail.ask_title }</h2>  
							    		     <p data-v-7c8cb348="" class="info">
											     <span data-v-7c8cb348="">${detail.ask_date }</span> 
										     </p>
							    			<p data-v-7c8cb348="" class="text">
												${detail.ask_content }
											</p>
							</div>
					</article>
     </article>
     	
				<c:choose>
		     	<c:when test="${adminReply != null}">

				<div data-v-7c8cb348="" class="comments">
	
			<div data-v-7c8cb348="" class="comment parent" >			
				<p data-v-7c8cb348="" class="profile" >
					<span data-v-7c8cb348="" class="writer" >관리자</span>
					<span data-v-7c8cb348="" class="info">${adminReply.ask_comment_date }</span> 
					<span data-v-7c8cb348="" class="delete"><img src="../../images/delete.png" width="13px" height="13px"></span>
				</p> 			
				<p data-v-208a49f8="" data-v-7c8cb348="" class="text">${adminReply.ask_comment_content }</p> 
					
			</div>		
		</div>
</c:when>	
					<c:otherwise>
					<div data-v-7c8cb348="" class="comments">
					<div data-v-7c8cb348="" class="comment parent" >			
				<p data-v-7c8cb348="" class="profile" >
					<span data-v-7c8cb348="" class="writer">아직 답변이 완료되지 않았습니다</span>
				</p> 	
			</div>
			</div>
		</c:otherwise>
		</c:choose>

		
     </div>
     	
	
	  	
	<div data-v-7c8cb348="" class="container">    	

		  <a data-v-7c8cb348="" href="/myPage/myAskList?id=${member.userNo }"  class="floating write">목록</a> <!---->      	
		  <a data-v-7c8cb348="" href="deleteBoard.jsp"  class="floating write">삭제</a> <!---->      	
	</div>

</body>
</html>