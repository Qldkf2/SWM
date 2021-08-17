%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세보기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/studycafe/listStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/studycafe/bookStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
<style>
</style>

</head>
<body>
	<div class="row">
		<div class="col-6 col-s-4 menu" style="font-size: 10px;">
			<ul>
				<li>주소 : </li>
				<li>이용시간 : </li>
				<li>전화번호 : </li>
			</ul>
		</div>

		<div class="col-5 col-s-6" style="font-size: 20px;">
			<h1>카페이름</h1>
			<p>카페소개</p>
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
	<div id="myModal" class="modal">

<!-- Modal content -->
<div class="modal-content">
	<div class="container2" style="display: block;" >
	<br>
	<div>
		<h3>예약하시겠습니까?</h3>
		<h1>　</h1>
		<h2>방 선택</h2>
		<br>
		<div class="list-group">
			 <a href="#" name="studycafe_roomNo" class="list-group-item">No.1 / 2인실</a>
    <a href="#" name="studycafe_roomNo" class="list-group-item">No.2 / 4인실</a>
    <a href="#" name="studycafe_roomNo" class="list-group-item">No.3 / 5인실</a>
    
		</div>
        
        <h1>　</h1>
  <h2>예약 날짜</h2><br>
<h2>Day: <input name="book_date" type="date" id="datepicker" style="font-size:20px;	border: 1px solid #ccc;"></h2>
<Br>
<div style=" display: flex; border: 1px solid #ccc;">
<form class="col-6 col-s-4 menu">
  <label for="startTime">시작 시간: </label>
  <input type="time" id="startTime" name="start_time">
</form>
　　　　		
<form class="col-6 col-s-4 menu">
  <label for="startTime">끝나는 시간: </label>
  <input type="time" id="endTime" name="end_time">
</form>
</div>
<br>

</div>
	</div>
<form action="/studycafe/book">
<input type="submit" value="예 약" class="button3"style="text-align:right;float: right; font-size:15px;"></form>
	<button class="button3">
<span class="close" style="float: left; font-size:15px;">취 소</span>
</button>
	</div>
</div>

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