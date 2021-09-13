<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login/idSave.css">
<c:import url="../common/header.jsp"></c:import>
<script>

  $(document).ready(function() { 

		// 저장된 쿠키값이 있다면 가져와 Id 칸에 넣어줌. 없으면 공백으로 들어감
		var userInput = getCookie("userInputId");
		$("#userId").val(userInput);
		
		// 저장된 아이디가 있어, 로그인 화면에서 아이디 입력창에 저장된 아이디가 있을 경우
		if($("#userId").val() != "") {
			$("#idSave").prop("checked", true);  // 속성을 추가하는 attr 함수 이용하여, id 저장하기가 checked 된 상태라고 두기
		}
		
		 // 아이디 저장하기 체크박스에 변화가 있을 때
		$("#idSave").change(function() {
			if($("#idSave").is(":checked")) { // id 저장하기 체크 했을 때 
				setCookie("userInputId", $("#userId").val(), 30); // 30일 동안 아이디를 저장하는 쿠키 생성
			} else {
				deleteCookie("userInputId"); // id 저장하기 체크 해제 했을때, 쿠키 삭제
			}
			
		}); 
		
		// 로그인 시도 시, id 저장하기 버튼 체크 여부에 따른 처리
		$("#userId").keyup(function() {
			if($("#idSave").is(":checked")) { // id 저장하기 체크 했을 때 
				setCookie("userInputId", $("#userId").val(), 30); // 30일 동안 아이디를 저장하는 쿠키 생성
			}
			
		});
	});
	
	// 쿠키를 위한 함수 -> 쿠키는 set-cookie 형태로 쿠키="쿠키속성"; 이런식으로 저장되어 전달됨
	// 쿠키 설정 
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	// 쿠키 삭제 - 즉 아이디 저장하기 x
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1); // 쿠키 유효기간을 현재 날짜보다 전날로 세팅하여, 쿠키를 소멸시킴
		document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString(); 
	}
	
	// 쿠키 가져옴  
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie; // 브라우저에 저장되어 있는 쿠키 검색
		var start = cookieData.indexOf(cookieName); // indexOf 함수는 문자열에서 특정 문자의 위치를 찾는 함수(검색된 문자열이 첫번째로 나타나는 위치 리턴)
													// 찾는 문자열이 없으면 -1 리턴
		var cookieValue = '';
		if(start != -1) { // 찾는 문자열(쿠키이름)이 있다면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start); // 쿠키 value 값을 추출 하는 단계
			
			if(end == -1) 
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue); // unescape를 통해 16진수 아스키코드를 문자열로 변환
	}
	
	 // 로그인 입력값 공백 검사
	function fn_login() {
		
		if($("#userId").val()=="" || $("#userId").val()==null) {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		
		if($("#password").val()=="" || $("#password").val()==null) {
			alert("비밀번호를 입력하세요");
			$("#password").focus();
			return false;
		}
	}

</script>
</head>
<body>
  <form action="/loginForm" id="container" method="post" data-redirect="" onsubmit="return fn_login()">
    <div class="introduction">
      <div class="wrap">
        <h1>로그인</h1>
        <p>스윗미 계정을 통해<br><strong>스터디모임과</strong>과 <strong>친목커뮤니티</strong>을 함께 이용하세요!</p>
      </div>
    </div>
    <div class="form">
      <div class="wrap">
        <input id="userId" type="text" name="userId" maxlength="20" class="text" value="${cookie.userInput.userInputId }" placeholder="스윗미 아이디">
        <input id="password" type="password" name="password" maxlength="20" class="text" placeholder="비밀번호">
        <div id="check" style="width:100%;">
        <span class="input_button checkbox mb10" style="width:140px;">
        	<input type="checkbox" id="idSave" placeholder="" style="width:150px;">
        		<label for="idSave">아이디 저장</label>
        </span>
        <span class="input_button checkbox mb10" style="width:140px;">
        	<input type="checkbox" id="autoLogin" name="autoLogin" placeholder="">
        		<label for="autoLogin">자동 로그인</label>
        </span>
        </div>
        <input id ="login" type="submit" value="로그인" class="submit">
        <hr>
        <a href="/findIdForm" class="find">아이디/비밀번호 찾기</a>
        <hr>
        <a href="/joinForm" class="register">
          <span>스윗미 계정이 없으신가요?</span>
          <strong>회원가입</strong>
        </a>
      </div>
    </div>
    <input type="hidden" name="redirect">
  </form>


  <footer>
    <a href="/" class="copyright">© 스윗미</a>
    <a href="/page/serviceagreement">이용약관</a>
    <a href="/page/privacy" class="privacy">개인정보처리방침</a>
    <a href="/page/rules">커뮤니티이용규칙</a>
    <a href="/page/faq">문의하기</a>
  </footer>

</body>
</html>