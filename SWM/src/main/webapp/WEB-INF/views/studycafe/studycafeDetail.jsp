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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/studycafe/studycafeDetail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/studycafe/listStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/studycafe/bookStyle.css">

</head>
<body>
<c:import url="../common/header.jsp" />


	<div data-v-cafe="" class="container" >
	
	
	<article data-v-cafe="">

	     
	     <h1 data-v-cafe="">스윗미 ${s.studycafe_name }</h1>     
		
			<section data-v-cafe="" class="tab" style="top: 0px;">
			    <div data-v-cafe="" class="wrap">
				      <a data-v-cafe="" href="" class="active"><span data-v-cafe="" class="text" >상세보기</span></a>
			    </div>
			  </section>
			<div data-v-cafe class="fixed">
				<a data-v-cafe="" class="myBtn" id="myBtn" href="">예약하기</a>
			</div>
				
				<div data-v-cafe="" class="about">	     	  
		  		<h3 data-v-cafe="">주소</h3>  <p data-v-cafe="" class="indent"> ${s.studycafe_address}  </p> 
		     	<h3 data-v-cafe="">영업시간</h3>  <p data-v-cafe="" class="indent">  ${s.studycafe_open} ~ ${s.studycafe_end} </p> 
				<h3 data-v-cafe="">룸수</h3>  <p data-v-cafe="" class="indent"> 5개 호실 & 1인용 자리</p> 
				  <hr style="background:#d6d6d6; margin-top:15px; height:1px;">
				</div>
	    			
	    			
	    			<c:forEach items="${files}" var="file" varStatus="status">
	    			 <img src="${pageContext.request.contextPath}/resources/files/studycafe/${file.stored_file_name}" style="width: 950px;">
	    			 	<p data-v-cafe="" class="text" style="height:50px;">${list2[status.index]}↑</p>
	    			</c:forEach>
					
					
				
	     	<hr style="background:#d6d6d6; height:1px;">
     	</article>
     </div>    	
     
<!-- The Modal -->
<form action="/book/studycafeBook" method="POST" onsubmit="return fn_insertBook();">
	<div id="myModal" class="modal">

<!-- Modal content -->

 <div class="modal-content">
	<div class="container2" style="display: block;" >
	
	<br>
	<div>
		<h2>예약정보를 입력해주세요.</h2>
		
		<br>
		<!-- studycafe에서 이름받아옴 -->
		<input type="hidden" id="studycafe_name" name="studycafe_name" value="스터디카페(임시)"  /> 
		<!-- studycafe테이블에서 카페번호를 받아옴 -->
		<input type="hidden" id="studycafe_no" name="studycafe_no" value="10"  /> 
		<!-- 예약자 회원 번호 -->
		<input type="hidden" id="booker_no" name="booker_no" value="${member.userNo}" />
		<h3>
		    <label for="studycafe_roomno">방 선택</label>
		    <br>
		       <select id="studycafe_roomno" name="studycafe_roomno" size="1">
		          <option value="">방 번호를 선택해주세요.</option>
		          <option value="101">101호</option>
		          <option value="102">102호</option>
		          <option value="103">103호</option>
		       </select> 
		        <br><br>
		    <label for="room_strength">인원수 선택</label>
		    <br>
		       <select id="room_strength" name="room_strength" size="1">
		          <option value="">예약하실 인원를 선택해주세요.</option>
		          <option value="1">1인</option>
		          <option value="2">2인</option>
		          <option value="3">3인</option>
		          <option value="4">4인</option>
		          <option value="5">5인</option>
		          <option value="6">6인</option>
		          
		       </select> 
		</h3>
 
        　
 <h3>예약 날짜</h3>
 <br>
 <input type="date" id="book_date" name ="book_date" style="font-size:20px;	border: 1px solid #ccc;">
 <br>
 <br>      
 
 <h3>
     <label for="start_time">시작시간</label>
     <br>
      <select id="start_time"  name="start_time" size="1">
		  <option value="">시작시간을 정해주세요</option>
		  <option value="9" >09:00</option>
		  <option value="10">10:00</option>
		  <option value="11">11:00</option>
		  <option value="12">12:00</option>
		  <option value="13">13:00</option>
	      <option value="14">14:00</option>
		  <option value="15">15:00</option>
		  <option value="16">16:00</option>
		  <option value="17">17:00</option>
		  <option value="18">18:00</option>
		  <option value="19">19:00</option>
		  <option value="20">20:00</option>
		  <option value="21">21:00</option>
		  <option value="22">22:00</option>
	 </select> 
 </h3>
 <br>
  <h3>
     <label for="end_time">종료시간</label>
     <br>
		  <select id="end_time"  name="end_time" size="1">
		  <option value="">종료시간을 정해주세요.</option>
		  <option value="9">09:00</option>
		  <option value="10">10:00</option>
		  <option value="11">11:00</option>
		  <option value="12">12:00</option>
		  <option value="13">13:00</option>
	      <option value="14">14:00</option>
		  <option value="15">15:00</option>
		  <option value="16">16:00</option>
		  <option value="17">17:00</option>
		  <option value="18">18:00</option>
		  <option value="19">19:00</option>
		  <option value="20">20:00</option>
		  <option value="21">21:00</option>
		  <option value="22">22:00</option>
	 </select> 
 </h3>

</div>
	</div>
	<button type="submit" class="button3" style="text-align:right; float: right; font-size:15px;"> 예 약
	</button>
	<button type="reset" class="button3">
	<span class="close" id="modal_close_btn" style="float: left; font-size:15px;">취 소</span>
	</button>
	</div>
</div>
</form>

	<script>
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
			modal.show();
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		document.getElementById("modal_close_btn").onclick = function() {
			document.getElementById("modal").style.display = "none";
		}
	</script>




</body>
</html>