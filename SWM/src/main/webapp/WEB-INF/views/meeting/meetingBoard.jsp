<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>스윗미</title>
<script type="text/javascript">
function fn_searchCheck(){
	if($("#keyword").val() == null || $("#keyword").val() == ""){
		alert("검색어를 입력해 주세요!");
		$("#keyword").focus();
		return false;
	}		
	return true;
	
}

function fn_changePage(movigPage){
	
	 var keyword = "${keyword}";
	 var meeting_no = "${article.meeting_no}";
	
	location.replace("/meeting/meetingBoard/search?keyword="+keyword+"&meeting_no="+meeting_no+movigPage) ;

	
}

</script>




<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}resources/css/meeting/meeting.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/meeting2.css">

</head>
<body>
<c:import url="../common/header.jsp" />
<c:import url="./meetingSubject.jsp" />
   

   
	<div data-v-7c8cb348="" class="container" >
	
	
	<article data-v-7c8cb348>
		 <p data-v-7c8cb348="" class="completed highlight">
	        모집중
	     </p> 
	     
	     <h1 data-v-7c8cb348="">${article.meeting_title}</h1>     
		     <p data-v-7c8cb348="" class="info">
			     <span data-v-7c8cb348="">${article.meeting_date }</span> 
			     <span data-v-7c8cb348="" class="viewcount">${article.meeting_hit }</span> 
		     </p>

	
     
			<section data-v-7c8cb348="" class="tab" style="top: 0px;">
			    <div data-v-7c8cb348="" class="wrap">
				      <a data-v-7c8cb348="" href="/meeting/meetingDetail?meeting_no=${article.meeting_no}" ><span class="text">모집 공고</span></a>
			      <a data-v-7c8cb348="" href="/meeting/meetingBoard?meeting_no=${article.meeting_no}"  class="active"><span class="text">게시판</span></a>
			    </div>
			  </section>

				      <a data-v-7c8cb348 href="/meeting/meetingBoardWrite?meeting_no=${article.meeting_no}" class="floating write"  >글쓰기</a>
				      <div data-v-7c8cb348 class="search">
				         <form data-v-7c8cb348 action="/meeting/meetingBoard/search"onsubmit="return fn_searchCheck();">
				            <input data-v-7c8cb348 type="search"  id="keyword"  name="keyword" class="keyword" placeholder="검색" value="" autocomplete="off" >
				            <input data-v-7c8cb348 type="hidden" name="meeting_no" value="${article.meeting_no}">
				            <input data-v-7c8cb348 type="submit" class="submit" >
				            
				         </form>
				      </div>
					
					
		<hr style="background:#d6d6d6; height:1px;">
				      <div data-v-7c8cb348 class="list">
				      
				           <c:choose>

    				  		<c:when test="${fn:length(list) > 0}">
	      						<c:set var="index" value="0" />
	      	      				<c:forEach items="${list}" var="row" >	       
					      <!-- 리스트 -->
								  <a data-v-7c8cb348 href="/meeting/meetingBoardDetail?meeting_no=${article.meeting_no}&party_no=${row.meeting_board_no}" class="item">
						
						         <h2 data-v-7c8cb348="">${row.meeting_board_title }</h2>
						         <p data-v-7c8cb348 class="info" >
						        	 <span data-v-7c8cb348="">${row.nickname}</span>
						         	<span data-v-7c8cb348="">${row.meeting_board_date}</span>
						         	<span data-v-7c8cb348="" class="viewcount">${row.meeting_board_hit}</span>
									<c:choose>
          							  <c:when test="${row.meeting_board_no== count[index].meeting_board_no}">				         	
						         			<span data-v-7c8cb348="" class="commentcount">${count[index].comment_count}</span>
						 					<c:set var="index" value="${index+1 }" />
						         	</c:when>
						         	</c:choose>
						          </p>
						         </a>
						         
					
						        </c:forEach>
					        </c:when>
							<c:otherwise>
						<a data-v-7c8cb348 class="item" >
      	 		        <h2 data-v-7c8cb348 >조회된 결과가 없습니다.</h2>
     			 	 </a>

					</c:otherwise>
      </c:choose> 			         
      	</div>
      	
      	 
   
     	</article>

       
       <div data-v-7c8cb348 class="page" style>
        <c:if test="${paging.startPage != 1 }">		
			<a data-v-7c8cb348  class="page move"   id="&nowPage=${paging.startPage - 1 }"  onclick="fn_changePage(this.id)">&lt;&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
				<%-- 	<a data-v-7c8cb348    class="page select"   href="/meeting?nowPage=${paging.nowPage }">${paging.nowPage }</a> --%>
				 	<a data-v-7c8cb348    class="page select"  id="&nowPage=${p}" onclick="fn_changePage(this.id)">${p }</a> 
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a data-v-7c8cb348    class="page move"   id="&nowPage=${p }"  onclick="fn_changePage(this.id)">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a data-v-7c8cb348  class="page move "  id="&nowPage=${paging.endPage+1 }" onclick="fn_changePage(this.id)">&gt;&gt;</a>
		</c:if>
      </div>
      

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