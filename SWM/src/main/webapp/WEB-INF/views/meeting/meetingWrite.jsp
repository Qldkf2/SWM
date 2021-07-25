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
		<h2 data-v-5ccf00ea >���� ���</h2>
		<p data-v-5ccf00ea class="description">���� �Ƿ��� ������� ���� �� �־�� !</p>	
	    <label data-v-5ccf00ea class="radio" name="meeting_age">
	    	<input type="radio" class="radio" id="teen" name="age" value="10��" checked>10��
	    </label>
		<label data-v-5ccf00ea class="radio" name="meeting_age">
			<input type="radio" class="radio" id="twenty" name="age" value="20��">20��
		</label>
		<label data-v-5ccf00ea class="radio" name="meeting_age">
			<input type="radio" class="radio" id="thirty" name="age" value="30��">30��
		</label>
		<label data-v-5ccf00ea class="radio" name="meeting_age">
			<input type="radio" class="radio" id="nothing" name="age" value="�������">�������
		</label>
	</div>
	
	<div data-v-5ccf00ea class="section" >
		<h2 data-v-5ccf00ea>�о�</h2>
		<p data-v-5ccf00ea class="select unselected">�о� ���� : 
		 <select id="subject" data-v-5ccf00ea class="select unselected" name="meeting_subject" > 
			<option value="���">���</option>
			<option value="�ڵ�">�ڵ�</option>
			<option value="����">����</option>
		 </select>
		</p>
	</div>
	
	<div data-v-5ccf00ea class="section">
		<h2 data-v-5ccf00ea>����</h2>
		<p data-v-5ccf00ea class="select selected">���� : 
		 <select id="location" data-v-5ccf00ea class="select unselected" name="meeting_address" > 
			<option value="������">������</option>
			<option value="������">������</option>
			<option value="������">������</option>
		 </select>
		</p>
	</div>
	
	<div data-v-5ccf00ea class="section">
		<h2 data-v-5ccf00ea>���� �ο�</h2>
		<!-- <label  data-v-5ccf00ea class="checkbox unchecked">���� ����</label> -->
		<div data-v-5ccf00ea class="number"  >
		<span data-v-5ccf00ea class="value min">2��</span>
		<%-- <canvas data-v-5ccf00ea class="slider" id="slider" width="405" height="60" style="width: 324px; height: 48px; margin: 0px -7px;"></canvas> --%>

		<input data-v-5ccf00ea type="range" class="slider" id="myRange"
				min="0" max="10" step="1" value="2" style="width : 300px;"/>

		<span data-v-5ccf00ea class="value max" id="limit" name="meeting_limit"></span>
		</div>
	</div>
	
	<p data-v-5ccf00ea class="title" >
		<input data-v-5ccf00ea type="text" id="meetingTitle" placeholder="����" name="meeting_title">
	</p>
	
	<p data-v-5ccf00ea class="text">
		<textarea data-v-5ccf00ea id="meetingContent" name="meeting_content" placeholder="������ �Է��ϼ���. (�ð�, ��� ,���� ��� ���)"></textarea>
	</p>	
	
	<div data-v-5ccf00ea class="submit">
		<input data-v-5ccf00ea type="submit" value="�۾���">
	</div>
</form>
</div>

</div>

<script>

$(document).ready(function () {
	$('#myRange').on('change', function () {
		var value = $(this).val();
		$('#limit').text(value + '��');
	});

});
</script>
</body>
</html>