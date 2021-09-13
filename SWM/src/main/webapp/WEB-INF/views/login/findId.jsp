<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login/findId2.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	
	function fn_findId() {
		
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
<body>

 <c:import url="../common/header.jsp"></c:import>
 
<div id="container" >
    <div class="menu">
      <a class="active"><span>아이디 찾기</span></a>
      <a href="/findPw"><span>비밀번호 찾기</span></a>
    </div>
    <form action="/findId" method="POST" onsubmit="return fn_findId();" >
      <input id="userName" type="text" name="userName" placeholder="가입된 이름" autocomplete="off">
      <input id="email" type="email" name="email" placeholder="가입된 이메일" autocomplete="off">
      <input type="submit" value="아이디 찾기">
      <div class="description">
        <p>※ 가입된 이름과 이메일을 입력해주세요.</p>
        <p>※ 아이디를 찾지 못했다면 고객센터(0000-0000)로 문의해주세요.</p>
        <p>※ 아직 스윗미 회원이 아니시라면 회원가입을 해주세요. &nbsp; <a href="/joinForm"><b><font size="1">바로가기</font></b></a></p>
      </div>
    </form>
  </div>
  
</body>
</html>