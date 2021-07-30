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
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css"> --%>
    
    <script type="text/javascript">

    
    </script> 
</head>
<body>
	 <c:import url="../common/header.jsp"/> 
	 
	<form data-v-08798b35="" class="container" action="/joinForm" method="POST">
		<section data-v-08798b35="">
			<h1 data-v-08798b35="">회원가입</h1>
			 <p data-v-08798b35="" class="description">
        에브리타임과 캠퍼스픽은<br data-v-08798b35="">
        전국 396개 캠퍼스, 520만 명의 가입자를 보유한<br data-v-08798b35=""> <strong data-v-08798b35="">국내 1위 대학생 서비스</strong>입니다.
      </p> <p data-v-08798b35="" class="description">
        대학생의 대학 생활에 가치를 더하고자 하는<br data-v-08798b35="">
        다양한 제휴 문의를 환영합니다.
      </p> <p data-v-08798b35="" class="rules">
        * 표시는 필수 기입 항목입니다. </p> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label">
    	 		<label data-v-08798b35="">아이디 *</label>
    	 	</div>
    	 		 <input data-v-08798b35="" type="text" name="userId" maxlength="255" autocomplete="off" class="medium">
    	 </div> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label">
    	 		<label data-v-08798b35="">비밀번호 *</label>
    	 	</div> 
    	 		<input data-v-08798b35="" type="password" name="password" maxlength="45" autocomplete="off" class="medium">
    	 	</div> 
    	 <div data-v-08798b35="" class="input">
    	 	<div data-v-08798b35="" class="label">
    	 		<label data-v-08798b35="">비밀번호 재확인 *</label>
    	 	</div> 
    	 		<input data-v-08798b35="" type="password" name="re_password" maxlength="45" autocomplete="off" class="medium">
    	 	</div> 
    	 		<div data-v-08798b35="" class="input">
    	 			<div data-v-08798b35="" class="label">
    	 				<label data-v-08798b35="">이름</label>
    	 			</div> 
    	 				<input data-v-08798b35="" type="text" name="userName" maxlength="45" autocomplete="off" class="medium">
    	 			</div>
    	 			<div data-v-08798b35="" class="input">
    	 			<div data-v-08798b35="" class="label">
    	 				<label data-v-08798b35="">닉네임</label>
    	 			</div> 
    	 				<input data-v-08798b35="" type="text" name="nickName" maxlength="45" autocomplete="off" class="medium">
    	 			</div> 
    	 			<div data-v-08798b35="" class="input">
    	 				<div data-v-08798b35="" class="label">
    	 					<label data-v-08798b35="">전화번호 *</label>
    	 				</div> 
    	 					<input data-v-08798b35="" type="text" name="phone1" maxlength="4" autocomplete="off" class="small" value="010" readonly> 
    	 					<span data-v-08798b35="" class="delimiter">-</span> 
    	 					<input data-v-08798b35="" type="text" name="phone2" maxlength="4" autocomplete="off" class="small"> 
    	 					<span data-v-08798b35="" class="delimiter">-</span> 
    	 					<input data-v-08798b35="" type="text" name="phone3" maxlength="4" autocomplete="off" class="small">
    	 			</div> 
    	 			<div data-v-08798b35="" class="input">
    	 				<div data-v-08798b35="" class="label">
    	 					<label data-v-08798b35="">이메일 *</label>
    	 				</div> 
    	 					<input data-v-08798b35="" type="email" name="email" maxlength="255" autocomplete="off" class="large">
    	 				</div> 
    	 				 
    	 					
    					
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