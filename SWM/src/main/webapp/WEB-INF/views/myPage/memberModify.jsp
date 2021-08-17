<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login/joinForm.css"> 
<style>

	#password1 {
   	display: block;
    box-sizing: border-box;
    margin-top: 4px;
    padding: 8px;
    border: 1px solid #f2f2f2;
    border-radius: 3px;
    width: 54%;
    height: 36px;
    line-height: 20px;
    color: #292929;
    font-size: 14px;
    background-color: #f9f9f9;
    background-repeat: no-repeat;
    background-position: right 8px center;
    background-size: 24px 24px
   	}
   	
	#password2 {
   	display: block;
    box-sizing: border-box;
    margin-top: 4px;
    padding: 8px;
    border: 1px solid #f2f2f2;
    border-radius: 3px;
    width: 54%;
    height: 36px;
    line-height: 20px;
    color: #292929;
    font-size: 14px;
    background-color: #f9f9f9;
    background-repeat: no-repeat;
    background-position: right 8px center;
    background-size: 24px 24px
   	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
		// 아이디 중복 검사
			$(function() {
				$('#nickName').keyup(function () {
					$.ajax({
						type:"POST",
						url:"/nickNameCheck",
						data:{
							"nickName":$('#nickName').val()
						},
						success:function(data) {
							if(data=="YES") {
								$('#nickNameCheck').text("이미 사용중인 닉네임 입니다");
								$('#nickName').val("");
								$('#nickName').focus();
								return false;
							} else {
								$('#nickNameCheck').text("사용 가능한 닉네임 입니다");
								return true;
							}
						}

			})
			
		}); 
			});
	
	</script> 
<script>
	function checkAll() {
		
		var rePw = /^[a-zA-Z0-9]{8,15}$/;
		var reNickName = /^[가-힣]{1,6}$/;
		var reEmail = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		
		
		// 비밀번호 공백 검사
		if($("#password1").val()=="" || $("#password1").val()==null) {
			alert("비밀번호를 입력하세요");
			$("#password1").focus();
			return false;
		}
		
		// 비밀번호 정규표현식 검사
		if(!rePw.test($("#password1").val())) {
			alert("비밀번호는 영문 대소문자와 숫자 8~15자리로 입력하세요");
			$("#password1").val("");
			$("#password1").focus();
			return false;
		}
		
		// 비밀번호 재확인 공백 검사
		if($("#password2").val()=="" || $("#password2").val()==null) {
			alert("비밀번호 재확인을 입력하세요");
			$("#password2").focus();
			return false;
		}
		
		//비밀번호 동일한지 검사
		if($("#password1").val() != $("#password2").val()) {
			alert("비밀번호를 동일하게 입력하세요");
			$("#password2").val("");
			$("#password2").focus();
			return false;
		}
		
		//아이디 비밀번호 동일한지 검사
		if($("#userId").val()==$("#password1").val()) {
			alert("아이디와 비밀번호는 동일할 수 없습니다");
			$("#password1").val("");
			$("#password2").val("");
			$("#password1").focus();
			return false;
		}
		
		// 닉네임 공백 검사
		if($("#nickName").val()=="" || $("#nickName").val()==null) {
			alert("닉네임을 입력하세요");
			$("#nickName").focus();
			return false;
		}
		
		// 닉네임 정규표현식 검사
		if(!reNickName.test($("#nickName").val())) {
			alert("닉네임은 한글 1~6자로 입력하세요");
			$("#nickName").val("");
			$("#nickName").focus();
			return false;
		}
		
		// 전화번호2 공백 검사
		if($("#phone2").val()=="" || $("#phone2").val()==null) {
			alert("2번째 전화번호를 입력하세요");
			$("#phone2").focus();
			return false;
		}
		
		// 전화번호 수 검사
		if($("#phone2").val().length < 4 ) {
			alert("전화번호는 4자리로 입력하세요");
			$("#phone2").val("");
			$("#phone2").focus();
			return false;
		}
		
		// 전화번호3 공백 검사
		if($("#phone3").val()=="" || $("#phone3").val()==null) {
			alert("3번째 전화번호를 입력하세요");
			$("#phone3").focus();
			return false;
		}
		
		// 전화번호 수 검사
		if($("#phone3").val().length < 4 ) {
			alert("전화번호는 4자리로 입력하세요");
			$("#phone3").val("");
			$("#phone3").focus();
			return false;
		}
		
		// 이메일 공백 검사
		if($("#email").val()=="" || $("#email").val()==null) {
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		
		// 이메일 정규표현식 검사
		if(!reEmail.test($("#email").val())) {
			alert("올바른 이메일 양식을 입력하세요");
			$("#email").val("");
			$("#email").focus();
			return false;
		}
		
	alert("회원정보 수정이 완료되었습니다");
	}
</script>
</head>
<body>
	 <c:import url="../common/header.jsp"/> 
	 
	<form data-v-08798b35="" class="container" action="/myPage/memberModify" method="POST" onsubmit="return checkAll()">
		<section data-v-08798b35="">
			<h1 data-v-08798b35="">회원 정보 수정</h1>
			 <p data-v-08798b35="" class="description">
        수정하고자 하는 정보를<br data-v-08798b35="">
        입력해주세요<br data-v-08798b35=""> <p data-v-08798b35="" class="rules">
        * 표시는 수정 가능한 항목입니다. </p> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label">
    	 		<label data-v-08798b35="">아이디 </label>
    	 	</div>
    	 		 <input data-v-08798b35="" id="userId" type="text" name="userId" maxlength="255" autocomplete="off" class="medium" value="${member.userId}" onFocus="this.blur()"/>
    	 </div> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label">
    	 		<label data-v-08798b35="">비밀번호 *</label>
    	 	</div> 
    	 		<input data-v-08798b35="" id="password1" type="password" name="password" maxlength="45" autocomplete="off" class="medium" value="${member.password}">
    	 	</div> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label">
    	 		<label data-v-08798b35="">비밀번호 재확인 *</label>
    	 	</div> 
    	 		<input data-v-08798b35="" id="password2" type="password" name="re_password" maxlength="45" autocomplete="off" class="medium" value="${member.password}">
    	 	</div> 
    	 		<div data-v-08798b35="" class="input">
    	 			<div data-v-08798b35="" class="label">
    	 				<label data-v-08798b35="">이름</label>
    	 			</div> 
    	 				<input data-v-08798b35="" id="userName" type="text" name="userName" maxlength="45" autocomplete="off" class="medium" value="${member.userName}" onFocus="this.blur()">
    	 			</div>
    	 			<div data-v-08798b35="" class="input">
    	 			<div data-v-08798b35="" class="label">
    	 				<label data-v-08798b35="">닉네임 *</label>
    	 			</div> 
    	 				<input data-v-08798b35="" id="nickName" type="text" name="nickName" maxlength="45" autocomplete="off" class="medium" value="${member.nickName}">
    	 			</div> 
    	 			<div data-v-08798b35="" class="input">
    	 				<div data-v-08798b35="" class="label">
    	 					<label data-v-08798b35="">전화번호 *</label>
    	 				</div> 
    	 					<input data-v-08798b35="" type="text" name="phone1" maxlength="4" autocomplete="off" class="small" value="010" readonly> 
    	 					<span data-v-08798b35="" class="delimiter">-</span> 
    	 					<input data-v-08798b35="" id="phone2" type="text" name="phone2" maxlength="4" autocomplete="off" class="small" value="${member.phone2 }"> 
    	 					<span data-v-08798b35="" class="delimiter">-</span> 
    	 					<input data-v-08798b35="" id="phone3" type="text" name="phone3" maxlength="4" autocomplete="off" class="small" value="${member.phone3 }">
    	 			</div> 
    	 			<div data-v-08798b35="" class="input">
    	 				<div data-v-08798b35="" class="label">
    	 					<label data-v-08798b35="">이메일 *</label>
    	 				</div> 
    	 					<input data-v-08798b35="" id="email" type="email" name="email" maxlength="255" autocomplete="off" class="large" value="${member.email }">
    	 				</div> 
    	 			<input type="hidden" name="userNo" value="${member.userNo }">
    	 				 
    	 					
    					
           <h2 data-v-08798b35="">개인정보 수집 및 이용</h2> 	
           		<div data-v-08798b35="" class="agreement">
           			<label data-v-08798b35="">
           				<input data-v-08798b35="" type="checkbox"> 
           					<figure data-v-08798b35="" class="checkbox"></figure> 
           						<span data-v-08798b35="">개인정보 수집 및 이용 동의 (필수)</span>
           			</label> 
           			<div data-v-08798b35="" class="text">
           				<ul data-v-08798b35="">
           					<li data-v-08798b35="">문의하신 내용에 대한 원활한 상담을 위해, 업체 정보(이름, 홈페이지, 사업자등록증), 담당자 정보(이름, 직책, 전화번호, 이메일)를 수집합니다.</li> 
           					<li data-v-08798b35="">수집된 개인정보는 3개월간 보관되며, 이후 즉시 파기됩니다.</li> 
           					<li data-v-08798b35="">수집된 개인정보는 업무 처리를 위해, 파트너사에 전달될 수 있습니다.</li> 
           					<li data-v-08798b35="">자세한 내용은 개인정보처리방침을 참고하시기 바랍니다.</li>
           				</ul>
           			</div>
           		</div> 
           			<input data-v-08798b35="" type="submit" value="다음">
           		</section>
           	</form>
</body>
</html>