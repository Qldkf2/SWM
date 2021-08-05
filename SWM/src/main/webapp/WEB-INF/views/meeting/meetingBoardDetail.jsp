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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}resources/css/meeting/meeting.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/meeting2.css">


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
	     
	     <h1 data-v-7c8cb348="">${article.meeting_title}</h1>     
		     <p data-v-7c8cb348="" class="info">
			     <span data-v-7c8cb348="">07/14 10:36</span> 
			     <span data-v-7c8cb348="" class="viewcount">5</span> 
		     </p>

	
     
			<section data-v-7c8cb348="" class="tab" style="top: 0px;">
			    <div data-v-7c8cb348="" class="wrap">
				      <a data-v-7c8cb348="" href="/meeting/meetingDetail?meeting_no=${article.meeting_no}" ><span class="text">모집 공고</span></a>
			      <a data-v-7c8cb348="" href="/meeting/meetingBoard?meeting_no=${article.meeting_no}"  class="active"><span class="text">게시판</span></a>
			    </div>
			  </section>
			
					<article data-v-7c8cb348>			
							<div data-v-7c8cb348="">
							    <h2 data-v-7c8cb348="">${partyArticle.meeting_board_title}</h2>  
							    		     <p data-v-7c8cb348="" class="info">
												<span data-v-7c8cb348="">${partyArticle.nickname}</span> 
											     <span data-v-7c8cb348="">${partyArticle.meeting_board_date}</span> 
											     <span data-v-7c8cb348="" class="viewcount">${partyArticle.meeting_board_hit}</span> 
										     </p>
							     		      <p data-v-7c8cb348="" class="file">
												<c:forEach items="${fileList}" var="file">	 
	     											<a data-v-7c8cb348=""  name="file" href="/meeting/downloadFile?idx=${file.idx}">[file] : ${file.original_file_name} (${file.file_size} kb)</a></br>	     		
												</c:forEach>
											</p>		
							    			<p data-v-7c8cb348="" class="text">
												${partyArticle.meeting_board_content}<br>
											</p>
							</div>
						</article>
	     		<form data-v-7c8cb348="" class="comment">
					

					<div data-v-7c8cb348="" class="submit">			
						<input data-v-7c8cb348="" type="submit" value="댓글쓰기">
					</div>
						<hr style="background:#d6d6d6; height:1px;">				
					<p data-v-7c8cb348="" class="text"><textarea data-v-7c8cb348="" placeholder="댓글을 입력하세요. "></textarea></p> 
					<input data-v-7c8cb348="" type="hidden" class="meeting_board_no" name="meeting_board_no"value="${partyArticle.meeting_board_no}">
								
				</form>
			<input type="hidden" class="meeting_no" value="${article.meeting_no}">
			
	     	<hr style="background:#d6d6d6; height:1px;">
     	</article>
     	
		<div data-v-7c8cb348="" class="comments">

   		<c:forEach items="${comment}" var="row">	       
		
			<c:choose>
			<c:when test="${row.party_comment_level == 1}">
				
				<!-- 부모댓글 class="comment parent" -->
					<div data-v-7c8cb348="" class="comment parent" >			
						<p data-v-7c8cb348="" class="profile" >
							<span data-v-7c8cb348="" class="writer" > ${row.nickname}</span>
							<span data-v-7c8cb348="" class="info">${row.party_comment_date}</span> 
							<span data-v-7c8cb348="" class="delete">
							<img src="${pageContext.request.contextPath}/resources/images/delete.png" width="13px" height="13px">
							<img src="${pageContext.request.contextPath}/resources/images/comment.png" width="15px" height="15px">
							</span>
						</p> 			
						<p data-v-208a49f8="" data-v-7c8cb348="" class="text">${row.party_comment_content}</p> 
		
					</div>
				</c:when>
			<c:otherwise>				
			<!-- 자식댓글 class="comment child" -->	
				<div data-v-7c8cb348="" class="comment child">			
					<p data-v-7c8cb348="" class="profile" >
						<span data-v-7c8cb348="" class="writer">${row.nickname}</span>
						<span data-v-7c8cb348="" class="info">${row.party_comment_date}</span> 
								<img src="${pageContext.request.contextPath}/resources/images/delete.png" width="13px" height="13px">
					</p> 			
					<p data-v-208a49f8="" data-v-7c8cb348="" class="text">${row.party_comment_content}</p> 
	
				</div>
			</c:otherwise>
			</c:choose>

		</c:forEach>

		</div>
		
     </div>
     	<c:choose>
			<c:when test="${member.userNo == partyArticle.meeting_board_writer}">
			<div data-v-7c8cb348="" class="container">    	
				  <a data-v-7c8cb348="" href="/meeting/meetingBoard?meeting_no=${article.meeting_no}"  class="floating write">목록</a> <!---->      	
				  <a data-v-7c8cb348="" href="/meeting/meetingBoardModifyForm?meeting_board_no=${partyArticle.meeting_board_no}&meeting_no=${article.meeting_no}"  class="floating write">수정하기</a> <!---->      	
				  <a data-v-7c8cb348="" id="meetingBoardDelete"  class="floating write">삭제하기</a> <!---->      	
		    </div>
			</c:when>
			<c:otherwise>
			
			<div data-v-7c8cb348="" class="container">    	
				  <a data-v-7c8cb348="" href="/meeting/meetingBoard?meeting_no=${article.meeting_no}"  class="floating write">목록</a> <!---->
			</div>
			</c:otherwise>
			</c:choose>
			

<script>
window.onload = function() {
	var meeting_no = ${article.meeting_no};
	var meeting_board_no = ${partyArticle.meeting_board_no};
	var meetingDelete = document.getElementById('meetingBoardDelete');
		meetingDelete.addEventListener('click', function(){
			if(confirm("삭제하시겠습니까 ?.?")) {
				$.ajax({
					url :"/meeting/meetingBoardDelete" ,
					type : "POST" ,
					data : {					
						meeting_board_no : meeting_board_no
					},
					success :function() {
						alert("삭제되었습니당");
						location.href="/meeting/meetingBoardDetail?meeting_no="+meeting_no;
					}
				})
			}
		});
};	

</script>

</body>
</html>