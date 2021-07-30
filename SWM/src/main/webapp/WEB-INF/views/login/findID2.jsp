<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login/findId2.css">
</head>
<body>

<div id="container" >
    <div class="menu">
      <a class="active"><span>아이디 찾기</span></a>
      <a href="/findPw"><span>비밀번호 찾기</span></a>
    </div>
    <form action="/findId" method="POST">
      <input type="text" name="userName" placeholder="가입된 이름" autocomplete="off">
      <input type="email" name="email" placeholder="가입된 이메일" autocomplete="off">
      <input type="submit" value="아이디 찾기">
      <div class="description">
        <p>※ 가입된 아이디가 있을 경우, 입력하신 이메일로 아이디를 안내해 드립니다.</p>
        <p>※ 만약 이메일이 오지 않는다면, 스팸 편지함으로 이동하지 않았는지 확인해주세요.</p>
        <p>※ 이메일 서비스 제공자 사정에 의해 즉시 도착하지 않을 수 있으니, 최대 30분 정도 기다리신 후 다시 시도해주세요.</p>
      </div>
    </form>
  </div>
  
</body>
</html>