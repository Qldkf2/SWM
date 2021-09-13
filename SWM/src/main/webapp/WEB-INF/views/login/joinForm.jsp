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
<c:import url="../common/header.jsp"/> 
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
		<script>
		// 아이디 중복 검사
			$(function() {
				$('#userId').keyup(function () {
					$.ajax({
						type:"POST",
						url:"/idCheck",
						data:{
							"id":$('#userId').val()
						},
						success:function(data) {
							if(data=="YES") {
								$('#idCheck').text("이미 사용중인 아이디 입니다");
								$('#userId').val("");
								$('#userId').focus();
								return false;
							} else if(data=="") {
								$('#idCheck').text("아이디를 입력해주세요");
							} else if(data=="NO") {
								$('#idCheck').text("사용 가능한 아이디 입니다");
								return true;
							}
						}	
				
					})
				
				})
				
				// 닉네임 중복 확인
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
			})
			
				var code = ""; // 밑에 ajax에서 컨트롤러를 통해 반환된 인증번호 담을 변수
			
			// 이메일 전송 스크립트 (인증코드)
			$('#sendEmail').click(function() {
				if($('#email').val()=="" || $("#email").val()==null) {
					alert("이메일을 입력해주세요");
					$('#email').focus();
				}
				
				var email = $('#email').val();
				
				alert("이메일이 전송되었습니다");
				
				$.ajax({
					
					type:"POST",
					url:"/mailCheck",
					data:{ 'email' : email },
					success:function(data) {
						code = data;
					}
				});
			});
			
			// 인증코드 확인 
			$('#inputCode').blur(function(){
				
				var inputCode = $('#inputCode').val();
				
				if(inputCode == code) {
					$('#checkMessage').html('<span id="checkMessage" style="color:green"> 인증번호가 일치합니다 </span>');
					return true;
				} else if(inputCode != code) {
					$('#checkMessage').html('<span id="checkMessage" style="color:red"> 인증번호를 다시 확인해주세요 </span>');
					$('#inputCode').val("");
					return false;
				} else if(inputCode == null || inputCode == "") {
					$('#checkMessage').html('<span id="checkMessage" style="color:red"> 인증번호를 입력해주세요 </span>');
					return false;
				}
				
			});
		
		}); 
	</script>
	<script>

	function checkAll() {
		
		var reId = /^[a-zA-Z0-9]{4,15}$/;
		var rePw = /^[a-zA-Z0-9]{8,15}$/;
		var reName = /^[가-힣]{1,5}$/;
		var reNickName = /^[가-힣]{1,6}$/;
		var reEmail = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		
		// 아이디 공백 검사
		if($("#userId").val()=="" || $("#userId").val()==null) {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		
		// 아이디 정규표현식 검사
		if(!reId.test($("#userId").val())) {
			alert("아이디는 영문 대소문자와 숫자 4~15자리로 입력하세요");
			$("#userId").val("");
			$("#userId").focus();
			return false;
		}
		
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
		
		// 이름 공백 검사
		if($("#userName").val()=="" || $("#userName").val()==null) {
			alert("이름을 입력하세요");
			$("#userName").focus();
			return false;
		}
		
		// 이름 정규표현식 검사
		if(!reName.test($("#userName").val())) {
			alert("이름은 한글 1~5자로 입력하세요");
			$("#userName").val("");
			$("#userName").focus();
			return false;
		}
		
		// 닉네임 공백 검사
		if($("#nickName").val()=="" || $("#nickName").val()==null) {
			alert("닉네임을 입력하세요");
			$("#nickName").val("");
			$("#nickName").focus();
			return false;
		}
		
		// 이름 정규표현식 검사
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
		
		// 이메일 인증 공백 검사
		if($("#inputCode").val()=="" || $("#inputCode").val()==null) {
			alert("인증번호를 입력하세요");
			$("#inputCode").focus();
			return false;
		}
		
	}
</script>
</head>
<body>
 																			<!-- sumbit 버튼을 누르면 checkAll 함수 호출 -->
	<form data-v-08798b35="" class="container" action="/joinForm" method="POST" onsubmit="return checkAll();">
		<section data-v-08798b35="">
			<h1 data-v-08798b35="">회원가입</h1>
			 <p data-v-08798b35="" class="description">
        정보를 모두 입력해주세요<br data-v-08798b35="">
        <strong data-v-08798b35="">모든 정보를 입력해주셔야 회원가입이 정상적으로 완료됩니다</strong>
      </p> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label" style="float:left; margin-right:10px;">
    	 		<label data-v-08798b35="">아이디 *</label>
    	 	</div>
    	 	<div id ="idCheck" style="float:left; font-size:3px; font-family:맑은 고딕, sans-serif; color:red;"></div>
    	 		 <input id="userId" data-v-08798b35="" type="text" name="userId" maxlength="255" autocomplete="off" class="medium" >
    	 </div> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label">
    	 		<label data-v-08798b35="">비밀번호 *</label>
    	 	</div> 
    	 		<input id="password1" data-v-08798b34="" type="password" name="password" maxlength="45" autocomplete="off" class="medium"
    	 		style="">
    	 	</div> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label">
    	 		<label data-v-08798b35="">비밀번호 재확인 *</label>
    	 	</div> 
    	 		<input data-v-08798b35="" id="password2" type="password" name="re_password" maxlength="45" autocomplete="off" class="medium">
    	 	</div> 
    	 		<div data-v-08798b35="" class="input">
    	 			<div data-v-08798b35="" class="label">
    	 				<label data-v-08798b35="">이름</label>
    	 			</div> 
    	 				<input id="userName" data-v-08798b35="" type="text" name="userName" maxlength="45" autocomplete="off" class="medium">
    	 			</div>
    	 			<div data-v-08798b35="" class="input">
    	 			<div data-v-08798b35="" class="label" style="float:left; margin-right:10px;">
    	 				<label data-v-08798b35="">닉네임</label>
    	 			</div> 
    	 			<div id ="nickNameCheck" style="float:left; font-size:3px; font-family:맑은 고딕, sans-serif; color:red;"></div>
    	 				<input id="nickName" data-v-08798b35="" type="text" name="nickName" maxlength="45" autocomplete="off" class="medium">
    	 			</div>
    	 			 
    	 			<div data-v-08798b35="" class="input">
    	 				<div data-v-08798b35="" class="label">
    	 					<label data-v-08798b35="">전화번호 *</label>
    	 				</div> 
    	 					<input data-v-08798b35="" type="text" name="phone1" maxlength="4" autocomplete="off" class="small" value="010" readonly> 
    	 					<span data-v-08798b35="" class="delimiter">-</span> 
    	 					<input id="phone2" data-v-08798b35="" type="text" name="phone2" maxlength="4" autocomplete="off" class="small"> 
    	 					<span data-v-08798b35="" class="delimiter">-</span> 
    	 					<input id="phone3" data-v-08798b35="" type="text" name="phone3" maxlength="4" autocomplete="off" class="small">
    	 			</div> 
    	 			<div data-v-08798b35="" class="input">
    	 				<div data-v-08798b35="" class="label">
    	 					<label data-v-08798b35="">이메일 *</label>
    	 				</div> 
    	 					<input id="email" data-v-08798b35="" type="email" name="email" maxlength="255" autocomplete="off" class="large" style="float:left;">&nbsp; 
    	 					<button id="sendEmail">인증번호 전송</button>
    	 					<input id="inputCode" data-v-08798b35="" type="text" maxlength="45" autocomplete="off" class="medium">
    	 					<span id="checkMessage"> 인증 번호를 입력해주세요 </span>
    	 				</div> 	
    					
           <!-- <h2 data-v-08798b35="">개인정보 수집 및 이용</h2> 	
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
           		</div>  -->
           		
           			<input data-v-08798b35="" type="submit" value="다음">
           		</section>
           	</form>
</body>
</html>