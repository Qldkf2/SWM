<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login/findId2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	
	function fn_findPw() {
		
		if($("#userId").val()=="" || $("#userId").val()==null) {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		
		if($("#userName").val()=="" || $("#userName").val()==null) {
			alert("이름을 입력하세요");
			$("#userName").focus();
			return false;
		}
		
		if($("#email").val()=="" || $("#email").val()==null) {
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
	}

</script>



</head>
<c:import url="../common/header.jsp"></c:import>
<body>

<div id="container">
    <div class="menu">
      <a href="/findIdForm"><span>아이디 찾기</span></a>
      <a class="active"><span>비밀번호 찾기</span></a>
    </div>
    <form action="/findPw" method="post" onsubmit="return fn_findPw()">
      <input id="userId" type="text" name="userId" placeholder="가입된 아이디" autocomplete="off">
      <input id="userName" type="text" name="userName" placeholder="가입된 이름" autocomplete="off">
      <input id="email" type="text" name="email" placeholder="가입된 이메일" autocomplete="off">
      <input type="submit" value="비밀번호 찾기">
      <div class="description">
        <p>※ 가입된 아이디, 이름, 이메일을 입력해주세요.</p>
        <p>※ 비밀번호를 찾지 못했다면 고객센터(0000-0000)로 문의해주세요.</p>
        <p>※ 아이디를 모르신다면 아이디 찾기를 이용해주세요. &nbsp; <a href="/findIdForm"><b><font size="1">아이디 찾기</font></b></a></p>
      </div>
    </form>
  </div>
  
</body>
</html>