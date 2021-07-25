<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/bccbe8508a4ff8396565.css" as="style">

<link data-vue-meta="ssr" rel="preload" href="${pageContext.request.contextPath}/resources/js/meeting/348d9764bf4bb1ed9da9.js" as="script">
</head>
<body>

<c:import url="../common/header.jsp" />

<div id="app">


<div data-v-5ccf00ea>


<form data-v-5ccf00ea class="container" name="container" action="/meeting/meetingWrite">
	<input type="hidden" name="meeting_leader" value="${userNo}"/>
	<div data-v-5ccf00ea class="section" name="section">
		<h2 data-v-5ccf00ea >모집 대상</h2>
		<p data-v-5ccf00ea class="description">같은 또래의 사람들을 모을 수 있어욤 !</p>	
	    <label data-v-5ccf00ea class="radio" name="meeting_age">
	    	<input type="radio" class="radio" id="teen" name="age" value="10대" checked>10대
	    </label>
		<label data-v-5ccf00ea class="radio" name="meeting_age">
			<input type="radio" class="radio" id="twenty" name="age" value="20대">20대
		</label>
		<label data-v-5ccf00ea class="radio" name="meeting_age">
			<input type="radio" class="radio" id="thirty" name="age" value="30대">30대
		</label>
		<label data-v-5ccf00ea class="radio" name="meeting_age">
			<input type="radio" class="radio" id="nothing" name="age" value="상관없음">상관없음
		</label>
	</div>
	
	<div data-v-5ccf00ea class="section" >
		<h2 data-v-5ccf00ea>분야</h2>
		<p data-v-5ccf00ea class="select unselected">분야 선택 : 
		 <select id="subject" data-v-5ccf00ea class="select unselected" name="meeting_subject" > 
			<option value="취업">취업</option>
			<option value="코딩">코딩</option>
			<option value="토익">토익</option>
		 </select>
		</p>
	</div>
	
	<div data-v-5ccf00ea class="section">
		<h2 data-v-5ccf00ea>지역</h2>
		<p data-v-5ccf00ea class="select selected">서울 : 
		 <select id="location" data-v-5ccf00ea class="select unselected" name="meeting_address" > 
			<option value="강남구">강남구</option>
			<option value="강서구">강서구</option>
			<option value="강동구">강동구</option>
		 </select>
		</p>
	</div>
	
	<div data-v-5ccf00ea class="section">
		<h2 data-v-5ccf00ea>모집 인원</h2>
		<!-- <label  data-v-5ccf00ea class="checkbox unchecked">제한 없음</label> -->
		<div data-v-5ccf00ea class="number"  >
		<span data-v-5ccf00ea class="value min">2명</span>
		<%-- <canvas data-v-5ccf00ea class="slider" id="slider" width="405" height="60" style="width: 324px; height: 48px; margin: 0px -7px;"></canvas> --%>

		<input data-v-5ccf00ea type="range" class="slider" id="myRange"
				min="0" max="10" step="1" value="2" style="width : 300px;"/>

		<span data-v-5ccf00ea class="value max" id="limit" name="meeting_limit"></span>
		</div>
	</div>
	
	<p data-v-5ccf00ea class="title" >
		<input data-v-5ccf00ea type="text" id="meetingTitle" placeholder="제목" name="meeting_title">
	</p>
	
	<p data-v-5ccf00ea class="text">
		<textarea data-v-5ccf00ea id="meetingContent" name="meeting_content" placeholder="내용을 입력하세용. (시간, 장소 ,진행 방식 등등)"></textarea>
	</p>	
	
	<div data-v-5ccf00ea class="submit">
		<input data-v-5ccf00ea type="submit" value="글쓰기">
	</div>
</form>
</div>

</div>

<script>

$(document).ready(function () {
	$('#myRange').on('change', function () {
		var value = $(this).val();
		$('#limit').text(value + '명');
	});

});
</script>
</body>
</html>