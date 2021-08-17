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
  <h1 data-v-7c8cb348="">내가 쓴 문의 </h1>     

				      <div data-v-7c8cb348 class="search">
				         <form data-v-7c8cb348 class>
				            <input data-v-7c8cb348 type="search" name="keyword" class="keyword" placeholder="검색" value="" autocomplete="off" >
				            <input data-v-7c8cb348 type="submit" class="submit" >
				            
				         </form>
				      </div>
					
					
					
		<hr style="background:#d6d6d6; height:1px;">
					
					
					
				      <div data-v-7c8cb348 class="list">
				      		<c:choose>
							  <c:when test="${fn:length(askList) > 0}">
								 <c:forEach items="${askList}" var="ask">
				      
				      
							   	<a data-v-7c8cb348 href="/myPage/myAskDetail?ask_no=${ask.ask_no }" class="item">
					
					         	<h2 data-v-7c8cb348="">${ask.ask_title }</h2>
					         	<p data-v-7c8cb348 class="info" >
					        	 	<span data-v-7c8cb348="">${ask.nickName }</span>
					         		<span data-v-7c8cb348="">${ask.ask_date }</span>
					         		<c:choose>
					         		<c:when test="${reply == 0 }">
					         		<span data-v-7c8cb348="" class="commentcount">0</span>
					         		</c:when>
					         		<c:otherwise>
					         		<span data-v-7c8cb348="" class="commentcount">1</span>
					         		</c:otherwise>
					         		</c:choose> 
					          </p>
					         </a>
					          </c:forEach>	
					         </c:when>
					         <c:otherwise>
					         
								<a data-v-7c8cb348 class="item" style="margin:20px" >
								
									<center><img src="https://www.campuspick.com/images/community.board.list.empty.png"/></center>
									<h1 data-v-7c8cb348="" style="text-align:center; margin:20px">등록된 문의가 없습니다</h1>
								
					         </a>
		
		
			
      						</c:otherwise>
      						</c:choose>
      						</div>
 
     	</article>
     </div>
	<div data-v-7c8cb348="" class="container">    		
		
		 <a data-v-7c8cb348 href="/myPage/askWrite" class="floating write" >문의하기</a>

	</div>
	

</body>
</html>