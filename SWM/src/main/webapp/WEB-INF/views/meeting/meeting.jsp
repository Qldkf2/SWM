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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/meeting.css">



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





   <div data-v-70332c88>
   
   <div data-v-70332c88 class="container" style >
      <a data-v-70332c88 href="/meeting/meetingWrite" class="floating write" >스터디모임 만들기</a>
      <div data-v-70332c88 class="search">
         <div data-v-70332c88 class="local">
            <span data-v-70332c88>지역</span>
         </div>
         <form data-v-70332c88 class>
            <input data-v-70332c88 type="search" name="keyword" class="keyword" placeholder="찾으시는 스터디가 있나요?" value="" autocomplete="off" >
            <input data-v-70332c88 type="submit" class="submit" >
            
         </form>
      </div>
      <hr data-v-70332c88>
      <div data-v-70332c88 class="list">
	 <c:choose>
      	<c:when test="${fn:length(list) > 0}">
      	      	<c:forEach items="${list}" var="row">	         	       	 
      	<a data-v-70332c88 href="<c:url value='/meeting/meetingDetail'/>?meeting_no=${row.meeting_no}"  id="article" class="item" >
		
			<input type="hidden" id="idx" value="${row.meeting_no}">
	         <p data-v-70332c88 class="completed highlight">
	         	<span data-v-70332c88="">모집중</span>
	         </p>
	         <p data-v-70332c88 class="badges">
	         	<span data-v-70332c88="">${row.meeting_subject}</span>
	         	 <span data-v-70332c88="">${row.meeting_address}</span>

	         </p>
	         <h2 data-v-70332c88>${row.meeting_title}</h2>
	         <p data-v-70332c88 class="info" >
	         	 <span data-v-70332c88="">${row.nickname}</span>
	         	<span data-v-70332c88="">${row.meeting_date}</span>

          	</p>

         </a>
                  </c:forEach>
      	 </c:when>
      
		<c:otherwise>
					<a data-v-70332c88 class="item" >
      	 		        <h2 data-v-70332c88 >조회된 결과가 없습니다.</h2>
     			 	 </a>
		</c:otherwise>
      </c:choose>
      </div>
   </div>
   </div>



<script id="__INITIAL_STATE__" type="application/json">
   {"apiServerUrl":"https://api.campuspick.com","appInfo":
   {"appName":"","appVersion":"","osName":"","osVersion":""},
   "isLogged":false,"pageName":"pages/study/index"}   
   
</script>
		</div>
	</div>


</body>
</html>