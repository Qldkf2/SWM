<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="kr">
<head>

<meta charset="utf-8">
<title>스윗미</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}resources/css/meeting/meeting.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/meeting/meeting2.css">
<script defer type="text/javascript">
window.onload = function() {
	/* 신청 현황 모달 스크립트 */
	$('.modal-container').hide();
	
	$('#modal2').on("click" ,function(){
		$('.modal-container').show();
	});
	$('.bg2').on("click" ,function(){
		$('.modal-container').hide();
	});
	$('.btn-wrap').on("click" ,function(){
		$('.modal-container').hide();
	});
	
	
	function onClick() {
	    document.querySelector(".modal").classList.remove("hidden");
	  }
	  function offClick() {
	    document.querySelector(".modal").classList.add("hidden");
	  }
	
	  document.getElementById('modal').addEventListener("click", onClick);
	  document.getElementById('cancel').addEventListener("click", offClick);
	  document.querySelector(".bg").addEventListener("click", offClick);
	  
	  /* 모임 삭제 ajax */
	  var meetingDelete = document.getElementById('meetingDelete');
	  var meeting_no = $('#meeting_no').val();
	  	meetingDelete.addEventListener('click', function(){
	  		if(confirm("삭제하시겠습니까 ?.?")) {
	  			$.ajax({
	  				url :"/meeting/meetingDelete",
	  				type : "POST",
	  				data : {
	  					meeting_no : meeting_no
	  				},
	  				success :function() {
	  					alert("삭제되었습니당");
	  					location.href='/meeting';
	  				}
	  			});
	  		}
	  	});
};	


</script>

</head>
<body>

	<c:import url="../common/header.jsp" />
<c:import url="./meetingSubject.jsp"/>

	<div data-v-7c8cb348="" class="container">

		<article data-v-7c8cb348="">
		<c:choose>
			<c:when test="${totalMember == article.meeting_limit }">
			<p data-v-7c8cb348="" class="completed highlight">모집마감</p>
			</c:when>
			<c:otherwise>
			<p data-v-7c8cb348="" class="completed highlight">모집중</p>
			</c:otherwise>
		</c:choose>
			<input type="hidden" id="meeting_no" value="${article.meeting_no}">
			<h1 data-v-7c8cb348="">${article.meeting_title}</h1>
			<p data-v-7c8cb348="" class="info">
				<span data-v-7c8cb348="">${article.meeting_date}</span> <span
					data-v-7c8cb348="" class="viewcount">${article.meeting_hit }</span>
			</p>
			<c:choose>
				<c:when test="${member.userNo == article.meeting_leader }">
				<section data-v-7c8cb348="" class="tab" style="top: 0px;">
				<div data-v-7c8cb348="" class="wrap">
					<a data-v-7c8cb348=""
						href="/meeting/meetingDetail?meeting_no=${article.meeting_no}"
						class="active"><span class="text">모집 공고</span></a> 
						<a data-v-7c8cb348=""
						href="/meeting/meetingBoard?meeting_no=${article.meeting_no}"><span
						class="text">게시판</span></a>
				</div>
				</section>
				</c:when>
				<c:otherwise>
				<section data-v-7c8cb348="" class="tab" style="top: 0px;">
				<div data-v-7c8cb348="" class="wrap">
					<a data-v-7c8cb348=""
						href="/meeting/meetingDetail?meeting_no=${article.meeting_no}"
						class="active"><span class="text">모집 공고</span></a> 
						<a data-v-7c8cb348="" href="javascript:permitCheck();"><span
						class="text" >게시판</span></a>
						<input type="hidden" id="permitCheck" value="${permitCheck}">
				</div>
			</section>
				</c:otherwise>
			</c:choose>

			<div data-v-7c8cb348="" class="about">
				<h3 data-v-7c8cb348="">분야</h3>
				<p data-v-7c8cb348="" class="indent">${article.meeting_subject}

				</p>
				<h3 data-v-7c8cb348="">지역</h3>
				<p data-v-7c8cb348="" class="indent">${article.meeting_address}
				</p>
				<h3 data-v-7c8cb348="">정원</h3>
				<p data-v-7c8cb348="" class="indent">(${totalMember}/${article.meeting_limit})명</p>
				<hr style="background: #d6d6d6; margin-top: 15px; height: 1px;">

				<p data-v-7c8cb348="" data-v-7c8cb348="" class="text">
					${article.meeting_content}</p>
			</div>

		</article>

		<!-- 	      <a data-v-7c8cb348=""  href="/" class="floating comment" target='_blank'>가입하기</a>  	  -->

		<c:choose>
			<c:when test="${member.userNo == article.meeting_leader }">
				<div data-v-7c8cb348="" class="container">
					<a data-v-7c8cb348="" href="/meeting" class="floating comment">목록</a>
					<a data-v-7c8cb348="" class="floating comment" id="modal2">신청확인</a>
					<a data-v-7c8cb348=""
						href="/meeting/meetingUpdateForm?meeting_no=${article.meeting_no}"
						class="floating comment" id="modal">수정하기</a> <a data-v-7c8cb348=""
						class="floating comment" id="meetingDelete" name="meetingDelete">삭제하기</a>
				</div>
			</c:when>
			<c:otherwise>
				<div data-v-7c8cb348="" class="container">
					<a data-v-7c8cb348="" href="/meeting" class="floating comment">목록으로</a>
					<!---->
					<c:choose>
					<c:when test="${totalMember == article.meeting_limit }">
					<a data-v-7c8cb348="" class="floating comment" id="modal5" onclick="magam()">가입신청</a>
					</c:when>
					<c:otherwise>
					<a data-v-7c8cb348="" class="floating comment" id="modal">가입신청</a>
					</c:otherwise>
					</c:choose>
					<!---->
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- 가입 신청 모달 -->
	<div class="modal hidden">
		<div class="bg"></div>
		<div class="modalBox">
			<form class="join_meeting" action="/meeting/meetingPermit">
				<input type="hidden" name="meeting_no" value="${article.meeting_no}">
				<input type="hidden" name="userNo" value="${member.userNo}">
				<p class="text">
					<textarea name="aboutMe" placeholder="가입신청 글을 간단하게 써주세요! "></textarea>
				</p>
				<input type="hidden" name="permit" value="N">
				<div class="submit">
					<input type="button" id="cancel" value="취소"> <input
						type="submit" value="가입신청">
				</div>
			</form>
		</div>
	</div>
	<!-- 신청 확인 모달 -->
	<div class="modal-container" id="modal-container">
		<div class="bg2"></div>
		<div class="my_modal">
			<input type="hidden" name="meeting_no" id="meeting_no"
				value="${article.meeting_no}">
			<table class="list-table">
				<colgroup>
					<col width="30%">
					<col>
					<col width="130px">
				</colgroup>
				<thead>
					<tr>
						<th>닉네임</th>
						<th>소개</th>
						<th></th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${fn:length(mpList) > 0}">
						<c:forEach items="${mpList}" var="mpList" varStatus="status">
							<tbody>
								<tr>
									<td id="userNo${status.index}" style="display: none"
										name="userNo${status.index}">${mpList.userNo }</td>
									<td id="nickName${status.index}">${mpList.nickName}</td>
									<td class="intro-td">${mpList.aboutMe}</td>
									<td>
										<button type="button" id="permitYes" class="basic-btn add"
											onclick="meetingPermitYes(${mpList.userNo},'${mpList.nickName}')">수락</button>
										<button type="button" id="permitNo" class="basic-btn del"
											onclick="meetingPermitNo(${mpList.userNo})">거절</button>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
			<div class="btn-wrap">
				<ul>
					<li><a href="">취소</a></li>
				</ul>
			</div>
		</div>
	</div>


</body>
<script>

/* 모임 신청 수락 ajax */
const meeting_leader = '${article.nickname}';
const meeting_member = '${member.nickName}';
var meeting_no = ${article.meeting_no};
function meetingPermitYes(userNo,nickName){
	
	$.ajax({
		url :"/meeting/meetingPermitYes" ,
		type : "POST" ,
		data :"meeting_no="+meeting_no+"&userNo="+userNo,
		success :function() {
			if(socket) {
				//websocket에 보내기!!(apply,모임가입자, 모임장, 모임번호)
				const socketMsg ="apply,"+ nickName +"," + meeting_leader+"," +meeting_no;
				console.log("ssssssssmsg>>",socketMsg); 
				socket.send(socketMsg);
			}
			console.log("성공");
			location.reload();
			$('.modal-container').show();
			

				
		}  ,error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		});
	}
/* 모임 신청 거절 ajax */
function meetingPermitNo(userNo){
	$.ajax({
		url :"/meeting/meetingPermitNo" ,
		type : "POST" ,
		data :"meeting_no="+meeting_no+"&userNo="+userNo,
		success :function() {
			console.log("성공");
			location.reload();
			
		}  ,error:function(request,status,error){
		   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}

	});
}

/* 모임 가입 유뮤 체크 스크립트 */
function permitCheck(){
	var userNo = ${member.userNo};
	var permitCheck = $('#permitCheck').val();
			if(permitCheck == 'N'){
				alert("모임에 가입되지 않은 사용자입니다 ");
			location.href="/meeting/meetingDetail?meeting_no="+${article.meeting_no};
		} else{
			location.href="/meeting/meetingBoard?meeting_no="+${article.meeting_no};
		}
}
function magam(){
	alert("마감되었습니당 !");
}

</script>
</html>