<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>

  <header>

    <div class="wrap">
      <a href="/" class="logo">캠퍼스픽 - 대학생 SNS</a>
      <div class="account">

        <a href="/login" class="blue">로그인</a>
        <a href="/login" class="white">회원가입</a>

      </div>
      <nav>
        <a href="/">홈</a>
        <a href="/community">커뮤니티</a>
        <a href="/club">동아리</a>
        <a href="/activity">대외활동</a>
        <a href="/contest">공모전</a>
        <a href="/study">스터디</a>
        <a href="/job">취업정보</a>
        <a href="/event">이벤트</a>
        <a href="/manager">게시요청</a>
      </nav>

    </div>
  </header>

  <form id="container" method="post" data-redirect="">
    <div class="introduction">
      <div class="wrap">
        <h1>로그인</h1>
        <p>스윗미 계정을 통해<br><strong>스터디모임과</strong>과 <strong>친목커뮤니티</strong>을 함께 이용하세요!</p>
      </div>
    </div>
    <div class="form">
      <div class="wrap">
        <input type="text" name="userid" maxlength="20" class="text" placeholder="스윗미 아이디">
        <input type="password" name="password" maxlength="20" class="text" placeholder="비밀번호">
        <input type="submit" value="로그인" class="submit">
        <hr>
        <a href="https://everytime.kr/find" class="find">아이디/비밀번호 찾기</a>
        <hr>
        <a href="https://everytime.kr/register" class="register">
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
    cp.fn.analytics.logPageView();
  </script>

</body>
</html>