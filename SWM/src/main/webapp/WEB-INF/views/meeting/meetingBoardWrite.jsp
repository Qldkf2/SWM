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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/meeting.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/meeting2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>		
		<script type="text/javascript">

				function fn_insertBoard(){
					if($("#party_title").val() == null || $("#party_title").val() == ""){
						alert("제목을 입력해 주세요!");
						$("#party_title").focus();
						return false;
					}
					
					if($("#party_content").val() == null || $("#party_content").val() == ""){
						alert("내용을 입력해 주세요!");
						$("#party_content").focus();
						return false;
					}		
					return true;
				}
					
				
		</script>		

</head>
<body>
<c:import url="../common/header.jsp" />
<c:import url="./meetingSubject.jsp"/>

   
	<div data-v-7c8cb348="" class="container" >
	
	
	<article data-v-7c8cb348>
		 <p data-v-7c8cb348="" class="completed highlight">
	        모집중
	     </p> 
	     
	     <h1 data-v-7c8cb348="">${article.meeting_title}</h1>     
		     <p data-v-7c8cb348="" class="info">
			     <span data-v-7c8cb348="">${article.meeting_date }</span> 
			     <span data-v-7c8cb348="" class="viewcount">5</span> 
		     </p>

	
			<section data-v-7c8cb348="" class="tab" style="top: 0px;">
			    <div data-v-7c8cb348="" class="wrap">
				      <a data-v-7c8cb348="" href="/meeting/meetingDetail?meeting_no=${article.meeting_no}" ><span class="text">모집 공고</span></a>
			      <a data-v-7c8cb348="" href="/meeting/meetingBoard?meeting_no=${article.meeting_no}"  class="active"><span class="text">게시판</span></a>
			    </div>
			  </section>

			
			
			<div data-v-7c8cb348="">
			<form data-v-7c8cb348=""class="container"  action="/meeting/meetingBoardInsert" method="post" enctype="multipart/form-data" onsubmit="return fn_insertBoard()">
			
			<input data-v-7c8cb348="" type="hidden" name="meeting_board_writer" id="party_writer" value="${member.userNo }">	
 			<input data-v-7c8cb348="" type="hidden" name="meeting_no" id="meeting_no" value="${article.meeting_no}">	
			<p data-v-7c8cb348="" class="title"><input data-v-7c8cb348="" type="text" name="meeting_board_title" id="party_title" placeholder="제목"></p> 
			<p data-v-7c8cb348="" class="text"><textarea data-v-7c8cb348="" name="meeting_board_content" id="party_content" placeholder="내용을 입력하세요. "></textarea></p> 
			<p data-v-7c8cb348="" class="file"><input data-v-7c8cb348="" type="file" name="file1" > </p>  
			
			<div data-v-7c8cb348="" class="submit">			
				<input data-v-7c8cb348="" type="submit" value="글쓰기">
			</div>
			</form>
			
			</div>
	   	</article>
     </div>

	<div data-v-7c8cb348="" class="container">    		
		  <a data-v-7c8cb348="" href="/meeting/meetingBoard=${article.meeting_no}"  class="floating write"> 목록</a> <!---->      	
	</div>
</body>
</html>