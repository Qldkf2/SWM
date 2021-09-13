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


<script type="text/javascript">

	
	function meetingDetail(meeting_no){
		$.ajax({
			url :"/meeting/meetingHit",
			type : "POST" ,
			data :{ meeting_no : meeting_no},
			success : function(data){
				location.href="/meeting/meetingDetail?meeting_no="+meeting_no
			},error:function(request,status,error){
			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		});
	};

function fn_searchCheck(){
	if($("#keyword").val() == null || $("#keyword").val() == ""){
		alert("검색어를 입력해 주세요!");
		$("#keyword").focus();
		return false;
	}		
	return true;
	
}

</script>

</head>
<body>
<c:import url="../common/header.jsp" />

<c:import url="./meetingSubject.jsp" />


   <div data-v-70332c88>
   
   <div data-v-70332c88 class="container" style >
      <a data-v-70332c88 href="/meeting/meetingWrite" class="floating write" >스터디모임 만들기</a>
      <div data-v-70332c88 class="search">
<%--          <div data-v-70332c88 class="local">
         	<p data-v-70332c88 class="select unselected">
			 <select id="location" data-v-70332c88 class="select unselected" name="meeting_address" > 
							<option value="지역">지역</option>
						 <c:forEach items="${location}" var="loc">
							<option value=" ${loc.gu}">${loc.gu}</option>
						
						 </c:forEach>
		 	</select>
		</p>

			</div> --%>
         
         <form data-v-70332c88 action="/meeting/search"onsubmit="return fn_searchCheck();">
            <input data-v-70332c88 type="search"   id="keyword"  name="keyword" class="keyword" placeholder="찾으시는 스터디가 있나요?" autocomplete="off" >
            
            <input data-v-70332c88 type="submit" class="submit" >
            
         </form>
      </div>
      <hr data-v-70332c88>
      <div data-v-70332c88 class="list">
	 <c:choose>
      	<c:when test="${fn:length(list) > 0}">
      	      	<c:forEach items="${list}" var="row" varStatus="status">	         	       	 
      	<a data-v-70332c88  id="article" class="item" onclick="meetingDetail(${row.meeting_no})">
			
			<input type="hidden"  class="idx" value="${row.meeting_no}">
			<c:if test="${row.totalMember == row.meeting_limit }">
	         <p data-v-70332c88 class="completed highlight">  
	         	<span data-v-70332c88="">모집마감</span>
	         	  </p>
	         </c:if>
	      	  <c:if test="${row.totalMember < row.meeting_limit }">
	         <p data-v-70332c88 class="completed highlight">  
	         	<span data-v-70332c88="">모집중</span>
	         	  </p>
	         </c:if>
	         
	       
	         <p data-v-70332c88 class="badges">
	         	<span data-v-70332c88="">${row.meeting_subject}</span>
	         	 <span data-v-70332c88="">${row.meeting_address}</span>

	         </p>
	         <h2 data-v-70332c88>${row.meeting_title}</h2>
	         <p data-v-70332c88 class="info" >
	         	 <span data-v-70332c88="">${row.nickname}</span>
	         	<span data-v-70332c88="">${row.meeting_date}</span>
	         	<span data-v-70332c88="" class="viewcount">${row.meeting_hit }</span>

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
      
      
         <div data-v-70332c88 class="page" style>
        <c:if test="${paging.startPage != 1 }">		
			<a data-v-70332c88  class="page move"   id="&nowPage=${paging.startPage - 1 }"  onclick="fn_changePage(this.id)">&lt;&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
				<%-- 	<a data-v-70332c88    class="page select"   href="/meeting?nowPage=${paging.nowPage }">${paging.nowPage }</a> --%>
				 	<a data-v-70332c88    class="page select"  id="&nowPage=${p}" onclick="fn_changePage(this.id)">${p }</a> 
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a data-v-70332c88    class="page move"   id="&nowPage=${p }"  onclick="fn_changePage(this.id)">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a data-v-70332c88  class="page move "  id="&nowPage=${paging.endPage+1 }" onclick="fn_changePage(this.id)">&gt;&gt;</a>
		</c:if>
      </div>
      
   </div>
   
   </div>
	<script type="text/javascript">
		function fn_changePage(movigPage){
			var url = window.location.href;
			<%-- var currentSubject = "<%=session.getAttribute("currentSubject")%>"; --%>
			 var currentSubject = "${currentSubject}";
			 var keyword = "${keyword}";
			
		
			if(url.indexOf("subject")!=-1){
				
				location.replace("/meeting?subject="+currentSubject+movigPage) ;
				
			}
			else if(url.indexOf("search")!=-1){
				
				location.replace("/meeting/search?keyword="+keyword+movigPage) ;
			}
			
			else{
				location.replace("/meeting?"+movigPage) ;
			}
			
	}


	
	</script>




</body>
</html>