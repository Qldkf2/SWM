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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	
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

  <c:import url="../common/header.jsp"></c:import>

  <form action="/loginForm" id="container" method="post" data-redirect="" onsubmit="return fn_login()">
    <div class="introduction">
      <div class="wrap">
        <h1>로그인</h1>
        <p>스윗미 계정을 통해<br><strong>스터디모임과</strong>과 <strong>친목커뮤니티</strong>을 함께 이용하세요!</p>
      </div>
    </div>
    <div class="form">
      <div class="wrap">
        <input id="userId" type="text" name="userId" maxlength="20" class="text" placeholder="스윗미 아이디">
        <input id="password" type="password" name="password" maxlength="20" class="text" placeholder="비밀번호">
        <input type="submit" value="로그인" class="submit">
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

  <script type="text/javascript">
    var _isLogged = false;
    var _appName = '';
    var _appVersion = '';
    var _osName = '';
    var _pageView = '';
    var _serverTime = 1625534855790;
    var _clientTime = new Date().getTime();
    var _diffTime = _clientTime - _serverTime;
    var _apiServerUrl = "https://api.campuspick.com";
    /* cp.fn.analytics.logPageView(); */
  </script>

</body>
</html>