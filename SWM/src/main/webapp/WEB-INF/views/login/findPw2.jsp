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

<div id="container">
    <div class="menu">
      <a href="/findId"><span>아이디 찾기</span></a>
      <a class="active"><span>비밀번호 찾기</span></a>
    </div>
    <form action="/findPw" method="post">
      <input type="text" name="userId" placeholder="가입된 아이디" autocomplete="off">
      <input type="text" name="userName" placeholder="가입된 이름" autocomplete="off">
      <input type="text" name="email" placeholder="가입된 이메일" autocomplete="off">
      <input type="submit" value="비밀번호 찾기">
    </form>
  </div>
  
</body>
</html>