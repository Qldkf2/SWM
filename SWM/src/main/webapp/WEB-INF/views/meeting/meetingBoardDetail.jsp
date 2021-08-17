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
function fn_insertComment(){
	
	if($("#parent_comment").val() == null || $("#parent_comment").val() == ""){
		alert("댓글 내용을 입력해 주세요!");
		$("#parent_comment").focus();
		return false;
	}		
	return true;
};

function fn_insertCommentChild(eventNum){
	
	if($("#child_comment_"+eventNum).val() == null || $("#child_comment_"+eventNum).val() == ""){
		alert("댓글 내용을 입력해 주세요!");
		$("#child_comment_"+eventNum).focus();
		return false;
	}		
	return true;
}; 

  </script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}resources/css/meeting/meeting.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/meeting2.css">


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
			    <span data-v-7c8cb348="">${article.meeting_date}</span> 
			      <span data-v-7c8cb348="" class="viewcount">${article.meeting_hit }</span>
			      
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
						
						
	<!-- 댓글 쓰기 -->					
	     		<form data-v-7c8cb348="" class="comment" action="/meeting/insertComment" method="post" onsubmit="return fn_insertComment()">
					

					<div data-v-7c8cb348="" class="submit">			
						<input data-v-7c8cb348="" type="submit" value="댓글쓰기">
					</div>
						<hr style="background:#d6d6d6; height:1px;">				
					<p data-v-7c8cb348="" class="text"><textarea data-v-7c8cb348="" name="meeting_board_comment_content" id="parent_comment" placeholder="댓글을 입력하세요. "></textarea></p> 
					<input data-v-7c8cb348="" type="hidden"  name="meeting_board_no"value="${partyArticle.meeting_board_no}">
					 <input data-v-7c8cb348="" type="hidden" name="meeting_no" id="meeting_no" value="${article.meeting_no}">	
					<input data-v-7c8cb348="" type="hidden" name="userno" id="userno" value="${member.userNo}">				
				</form>
	<!-- 댓글 쓰기 -->	
	
	
	     	<hr style="background:#d6d6d6; height:1px;">
     	</article>
     	
		<div data-v-7c8cb348="" class="comments">

   		<c:forEach items="${comments}" var="row"  varStatus="status">	       
		

			<c:choose>
			<c:when test="${row.meeting_board_comment_level == 1}">
				
				<!-- 부모댓글 class="comment parent" -->
					<div data-v-7c8cb348="" id="comment_parent" class="comment parent" >		
					<c:choose>
	      			 <c:when test="${row.status eq 'N'}">	
						<p data-v-7c8cb348="" class="profile" >

									<span data-v-7c8cb348="" class="writer" > ${row.nickname}</span>
									<span data-v-7c8cb348="" class="info">${row.meeting_board_comment_date}</span> 
									<span data-v-7c8cb348="" class="delete">
			
											<!-- 자식댓글추가 -->
										<a data-v-7c8cb348="" id="addComment_${status.count}"  >								
											<img src="${pageContext.request.contextPath}/resources/images/comment.png" width="15px" height="15px">
										</a>
										
										<!-- 삭제 ( 내글만 삭제버튼 보이게) -->
										<c:choose>
			          					  <c:when test="${member.userNo == row.userno }">
											<a data-v-7c8cb348="" id="delComment_${row.meeting_board_comment_no}" >
												<img src="${pageContext.request.contextPath}/resources/images/delete.png" width="13px" height="13px">
											</a>
											</c:when>
											</c:choose>
									</span>

						</p> 			
						<p data-v-208a49f8="" data-v-7c8cb348="" class="text">${row.meeting_board_comment_content}</p> 

					<form data-v-7c8cb348="" class="childForm hidden"  id="childForm_${status.count}" action="/meeting/insertComment" method="post" onsubmit="return fn_insertCommentChild(${status.count})">
					

				
							<p data-v-7c8cb348="" class="text"><textarea data-v-7c8cb348="" name="meeting_board_comment_content" id="child_comment_${status.count}"  placeholder="댓글을 입력하세요. "></textarea></p> 
							<input data-v-7c8cb348="" type="hidden"  name="meeting_board_no"value="${partyArticle.meeting_board_no}">
							 <input data-v-7c8cb348="" type="hidden" name="meeting_no" id="meeting_no" value="${article.meeting_no}">	
							<input data-v-7c8cb348="" type="hidden" name="userno" id="userno" value="${member.userNo}">				
							<input data-v-7c8cb348="" type="hidden" name="meeting_board_comment_refno" value="${row.meeting_board_comment_refno}">
							<input data-v-7c8cb348="" type="hidden" name="meeting_board_comment_leve" value="${row.meeting_board_comment_level}">
							
							<div data-v-7c8cb348="" class="submit">			
								<input data-v-7c8cb348="" type="submit" value="댓글쓰기">
							</div>
					</form>
						
					</c:when>
											
					<c:otherwise>
					<p data-v-208a49f8="" data-v-7c8cb348="" class="text">[삭제된 댓글 입니다.]</p> 
					</c:otherwise>
					</c:choose>	
					</div>
				</c:when>
				
			<c:otherwise>				
			<!-- 자식댓글 class="comment child" -->	
				<div data-v-7c8cb348="" class="comment child">		
					<c:choose>
	      			 <c:when test="${row.status eq 'N'}">		
					<p data-v-7c8cb348="" class="profile" >
						<span data-v-7c8cb348="" class="writer">${row.nickName}</span>
						<span data-v-7c8cb348="" class="info">${row.meeting_board_comment_date}</span> 
							<!-- 삭제 -->
							<c:choose>
          					  <c:when test="${member.userNo == row.userno }">
								<a data-v-7c8cb348="" id="delComment_${row.meeting_board_comment_no}" >
									<img src="${pageContext.request.contextPath}/resources/images/delete.png" width="13px" height="13px">
								</a>
								</c:when>
								</c:choose>					
					</p> 			
					<p data-v-208a49f8="" data-v-7c8cb348="" class="text">${row.meeting_board_comment_content}</p> 
					</c:when>
					
					<c:otherwise>
					<p data-v-208a49f8="" data-v-7c8cb348="" class="text">[삭제된 댓글 입니다.]</p> 
					</c:otherwise>

					</c:choose>
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

var beforeNum=0;


$(document).ready(function(){


   $("a[id^='addComment']").on("click", function(e){ 
      //이벤트 발생 타겟 구하기
      var eventNum = event.target.parentNode.id;   
      //타겟의 id에서 번호 구하기
      var returnNum = eventNum.substring(11);
      
      fn_addComment(returnNum);
   });
   
   $("a[id^='delComment']").on("click", function(e){ 
      //이벤트 발생 타겟 구하기
      var eventNum = event.target.parentNode.id;   
      //타겟의 id에서 번호 구하기
      var returnNum = eventNum.substring(11);

      fn_delComment(returnNum);
   });
   
});


function fn_addComment(returnNum){
   
   if(beforeNum==0 ){      //처음 대상 댓글 클릭했을경우 기존 번호 부여가 안되있으므로 0 (status.count 는 1부터 시작, index는 0부터 시작)
      document.querySelector("#childForm_"+returnNum).classList.remove("hidden");
      beforeNum=returnNum;    
   }
   
   else if((beforeNum!=returnNum)){   //처음댓글버튼 클릭하고 다른 댓글버튼 누르면 처음 생긴 폼 삭제
      document.querySelector("#childForm_"+beforeNum).classList.add("hidden");
      document.querySelector("#childForm_"+returnNum).classList.remove("hidden");
      beforeNum=returnNum;
   }
   else if(beforeNum==returnNum){      //처음 댓글버튼과 같은 댓글버튼 누르면 누른 폼 삭제 후 beforeNum 리셋
      
      document.querySelector("#childForm_"+returnNum).classList.add("hidden");
      beforeNum=0;
   }
   
}

function fn_delComment(returnNum){
   var meeting_no= ${article.meeting_no};
   var meeting_board_no = ${partyArticle.meeting_board_no};

   
   
    if(confirm("삭제하시겠습니까 ?.?")) {
        $.ajax({
           url :"/meeting/commentDelete" ,
           type : "POST" ,
           data : {
              meeting_board_comment_no : returnNum
           },
           success :function() {
              alert("삭제되었습니당");
              location.href="meetingBoardDetail?meeting_no="+meeting_no+"&party_no="+meeting_board_no;

            
           }
        });
     }

}

   
</script>

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