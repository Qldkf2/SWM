<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/header.css">
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<%
String menu =(String)session.getAttribute("menu");



%>
<script>
//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;
$(document).ready(function (){
	   connectWs();
});


function connectWs(){
    sock = new SockJS( "<c:url value="/echo"/>" );
	
	socket = sock;

	sock.onopen = function() {
        console.log('info: connection opened.');
  };

 sock.onmessage = function(evt) {
	 	var data = evt.data;
	   	console.log("ReceiveMessage : " + data + "\n");
	
	   	$.ajax({
			url : '/mentor/member/countAlarm',
			type : 'POST',
			dataType: 'text',
			success : function(data) {
				if(data == '0'){
				}else{
					$('#alarmCountSpan').addClass('bell-badge-danger bell-badge')
					$('#alarmCountSpan').text(data);
				}
			},
			error : function(err){
				alert('err');
			}
	   	});

	   	// 모달 알림
	   	var toastTop = app.toast.create({
         text: "알림 : " + data + "\n",
         position: 'top',
         closeButton: true,
       });
       toastTop.open();
 };

 sock.onclose = function() {
   	console.log('connect close');
   	/* setTimeout(function(){conntectWs();} , 1000); */
 };

 sock.onerror = function (err) {console.log('Errors : ' , err);};

}
</script>
</head>
<body>
		<header class="root">
			<div class="wrap">
				<a href="/" class="logo"></a>
				<c:choose>
				<c:when test="${member==null }">
				<div class="account">
					<a href="/loginForm" class="blue">로그인</a>
					<a href="/joinForm" class="white">회원가입</a>
				</div>
				</c:when>
				<c:when test="${member.userNo == 44}">
				<div class="account">
					<a href="/admin" class="blue">관리자페이지</a>
					<a href="/logout" class="white">로그아웃</a>
				</div>
				</c:when>
				<c:otherwise>
				<div class="account">
					<a href="/myPage" class="blue">마이페이지</a>
					<a href="/logout" class="white">로그아웃</a>
					<div id ="alarm-icon" style= "background-image : url('${pageContext.request.contextPath}/resources/images/jong.png');
					 height 30px; width: 30px; float: right; background-size: cover; margin-left: 3px;
   					 border-radius: 20px;">
   					 	<div style="height: 20px; width: 20px; float: right;">
   					 	<p style="border-radius: 20px; color: white;font-weight: 600;margin-left: 7px;
   								   background-color: red;font-size: x-small;text-align: center;">
   						0</p>
   					 	
   					 	</div>
   					 </div>
				</div>
				</c:otherwise>
				</c:choose>
				<nav>
			
					 <a href="/" <%if(menu.equals("main")){%> class="active"<%} %>>홈</a>
					<a href="${pageContext.request.contextPath}/meeting"  <%if(menu.equals("meeting")){%> class="active"<%} %>>스터디 모집</a>
					<a href="/studycafeList" <%if(menu.equals("studycafe")){%> class="active"<%} %>>스터디 카페</a>
					<a href="/freeBoard" <%if(menu.equals("freeBoard")){%> class="active"<%} %>>커뮤니티</a>
					
				</nav>
<!-- 				<p class="description">
					스터디 윗 미 에서<br>즐겁고 유용한 스터디를 진행해보세요.
				</p> -->
				<div class="buttons"></div>
			</div>
			

			

		</header>
</body>
</html>