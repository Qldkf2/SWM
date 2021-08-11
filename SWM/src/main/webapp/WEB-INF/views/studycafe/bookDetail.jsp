<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상세보기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/studycafe/listStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/studycafe/bookStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
<style>

select {
width: 200px;
padding: .8em .5em;
border: 1px solid #999;
font-family: inherit;
background: url(../images/arrow.jpg) no-repeat 95% 50%;
border-radius: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
}

</style>


<script type="text/javascript">

function fn_insertBook(){
	
	
	
	if($("#studycafe_roomno").val() == "" || $("#studycafe_roomno").val() == null ){
		alert("카폐방 번호를 선택해 주세요.");
		
		return false;
	}
	
	if($("#booker_no").val() == ''){
		alert("로그인 후 다시 시도해주세요.");
		location.href = '/loginForm';
		return false;
	} 
	
	if($("#room_strength").val() == "" || $("#room_strength").val() == null){
		alert("인원수를 선택해 주세요");
		 
		return false;
	}	
	
	
	if($("#book_date").val() == "" || $("#book_date").val() == null){
		alert("날짜를 선택해 주세요");
		
		return false;
	}	
	
	if($("#start_time").val() == "" || $("#start_time").val() == null){
		alert("시작시간을 선택해 주세요");
		
		return false;
	}	
	
	if($("#end_time").val() == "" || $("#end_time").val() == null){
		alert("종료시간을 선택해 주세요");
		
		return false;
	}	
	return true;
};
      
</script>

</head>
<body>

	<c:import url="../common/header.jsp" />

	<div class="row">
		<div class="col-6 col-s-4 menu" style="font-size: 10px;">
			<ul>
				<li>주소 :</li>
				<li>이용시간 :</li>
				<li>전화번호 :</li>
			</ul>
		</div>

		<div class="col-5 col-s-6" style="font-size: 20px;">
			<h1>이젠스터디</h1>
			<p>이젠 나의 눈물과 바꿔야하나 숨겨온 너의 진심을 알게 됐으니 사랑보다 먼 우정보다는 가까운</p>
		</div>

	</div>
	<div class="footer">

		<div class="gallery">
			<img src="${pageContext.request.contextPath }/resources/images/studycafe/search.pstatic.net.jpg">

			<div class="desc">로비</div>
		</div>

		<div class="gallery">
			<img src="${pageContext.request.contextPath }/resources/images/studycafe/search.pstatic.net.jpg">

			<div class="desc">1번방 / 2인</div>
		</div>

		<div class="gallery">
			<img src="${pageContext.request.contextPath }/resources/images/studycafe/search.pstatic.net.jpg" alt="Northern Lights"
				width="600" height="400">

			<div class="desc">2번방 / 3인</div>
		</div>
	</div>

	<button class="button button2" id="myBtn"
		style="float: right; bottom: 15px;">
		<span>예약하기</span>
	</button>

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
<button type="submit" class="button3" style="text-align:right; float: right; font-size:15px;"> 예 약
	</button>
	<button type="reset" class="button3">
	<span class="close" style="float: left; font-size:15px;">취 소</span>
	</button>
</div>
	</div>
	
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
			modal.style.display = "block";
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

<script>
	$(function() {
	    $("#time1").timepicker({
	        timeFormat: 'h:mm p',
	        interval: 60,
	        minTime: '10',
	        maxTime: '6:00pm',
	        defaultTime: '11',
	        startTime: '10:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
	});
</script>
</body>
</html>