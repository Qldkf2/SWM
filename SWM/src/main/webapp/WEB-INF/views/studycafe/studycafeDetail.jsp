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
	<script defer type="text/javascript">
	window.onload = function() {
		
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
	}
	</script>
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
				<a data-v-cafe="" class="myBtn" id="myBtn">예약하기</a>
			</div>

				<div data-v-cafe="" class="about">	     	  
		  		<h3 data-v-cafe="">주소</h3>  <p data-v-cafe="" class="indent"> ${s.studycafe_address}  </p> 
		     	<h3 data-v-cafe="">영업시간</h3>  <p data-v-cafe="" class="indent">  ${s.studycafe_open} ~ ${s.studycafe_end} </p> 
				<h3 data-v-cafe="">룸수</h3>  <p data-v-cafe="" class="indent"> 5개 호실 & 1인용 자리</p> 
				  <hr style="background:#d6d6d6; margin-top:15px; height:1px;">
				  
				</div>
	    			<p data-v-cafe="" class="text " style="font-size: 15px;
    display: contents;
    color: black;">
	    				1. 친절한 직원이 관리합니다. </br>
						2. 학습 유형에 따라 공부가 가장 잘되는 환경을 제공합니다.<br>
						3. 스스로 공부할 수 있는 분위기를 제공합니다.<br>
						4. 공부하기에 적합한 환경(온도, 서비스)을 제공합니다.<br>
						5. 입/퇴실시 문자메세지 발송 서비스를 제공합니다.<br>
						6. 잠이 들면 깨워드리는 서비스를 제공합니다.<br></p>
	    			
	    			<c:forEach items="${files}" var="file" varStatus="status">
	    			 <img src="${pageContext.request.contextPath}/resources/files/studycafe/${file.stored_file_name}" style="width: 950px;">
	    			 	<p data-v-cafe="" class="text" style="height:50px;">${list2[status.index]}↑</p>
	    			</c:forEach>
					
					
				
	     	<hr style="background:#d6d6d6; height:1px;">
     	</article>
     </div>    	
     
<!-- The Modal -->

	<div id="myModal" class="modal">

<!-- Modal content -->

 <div class="modal-content">
	<div class="container2" style="display: block;" >
	<form action="/book/studycafeBook" method="POST">
	<br>
	<div>
		<h2>예약정보를 입력해주3</h2>
		<br>
		<input type="hidden" id="studycafe_name" name="studycafe_name" value="${s.studycafe_name }"  /> 
		<input type="hidden" id="studycafe_no" name="studycafe_no" value="${s.studycafe_no}"  /> 
		<!-- 예약자 회원 번호 -->
		<input type="hidden" id="booker_no" name="booker_no" value="${member.userNo}" />
		<h3>
		    <label for="studycafe_roomno">방 선택</label>
		    
		       <select id="studycafe_room" name="studycafe_room" size="1">
		          <option value="">방을 선택해주세요 ~.~ </option>
		          <option value="1인실">1인실</option>
		          <option value="3~4인실">3~4인실</option>
		          <option value="5~6인실">5~6인실</option>
		          <option value="7~8인실">7~8인실</option>
		          <option value="세미나룸(11인실)">세미나룸(11인실)</option>
		       </select> 
		        <br>
		    <br>
		       
		         인원수 : <input type="text"  size="1" id="permit_limit" name="permit_limit" 
		       style="text-align: center; font-size:14pt; height:25px; "
		       placeholder="0">명
		</h3>
 
        　
 <h3>예약 날짜</h3>
 <input type="date" id="book_date" name="book_date" style="font-size:20px;	border: 1px solid #ccc;">
 <br>
 <br>      
 
 <h3>
     <label for="start_time">시작시간</label>
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
	 </select> 
 </h3>
 <br>
  <h3>
     <label for="end_time">종료시간</label>
		  <select id="end_time"  name="end_time" size="1">
		  <option value="">종료시간을 정해주세요.</option>
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
<button type="submit" class="button3" style="text-align:left; float: left; font-size:15px;"> 예 약
	</button>
	<button type="reset" class="button3">
	<span class="close" id="modal_close_btn" style="float: left; font-size:15px;">취 소</span>
	</button>
</div>
</form>
	</div>
	
	</div>
	
</div>






</body>
</html>