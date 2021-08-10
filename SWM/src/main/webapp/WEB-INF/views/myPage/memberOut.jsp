<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/out.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	
	function fn_out() {
		
		if($("#password").val()=="" || $("#password").val()==null) {
			alert("비밀번호를 입력하세요");
			$("#password").focus();
			return false;
		}
		
		alert("회원 탈퇴 되었습니다");
	}

</script>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

	<form data-v-75203738="" class="container" action="/myPage/memberOut" method="POST" onsubmit="return fn_out()">
		<section data-v-75203738="">
		<h1 data-v-75203738="">회원 탈퇴</h1> 
			<div data-v-75203738="" class="input">
			<div data-v-75203738="" class="label">
			<label data-v-75203738="">계정 비밀번호</label>
			</div> 
			<input data-v-75203738="" id="password" name ="password" type="password" maxlength="20" placeholder="계정 비밀번호">
			</div> 
			<input type="hidden" name="userId" value="${member.userId }">
		<div data-v-75203738="" class="rules">
		<!----> 
		  <p data-v-75203738="">
          ※ 탈퇴 및 가입을 반복할 경우, 서비스 악용 방지를 위해 재가입이 제한됩니다.
           <br data-v-75203738="">
           <!---->
           </p>
           <p data-v-75203738="">
          ※ 탈퇴 후 개인 정보, 스터디 모임 정보 등의 데이터가 삭제되며, 복구할 수 없습니다.
          <br data-v-75203738="">
          ※ 다시 가입하여도, 게시판 등 이용 제한 기록은 초기화되지 않습니다.
          <br data-v-75203738="">
          ※ 자세한 내용은 개인정보처리방침을 확인해주세요.
        </p>
        </div> 
        <input data-v-75203738="" type="submit" value="회원 탈퇴">
        </section>
        </form>
</body>
</html>