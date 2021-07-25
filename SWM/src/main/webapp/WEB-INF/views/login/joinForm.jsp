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
    
</head>
<body>
	 <c:import url="../common/header.jsp"/> 
   <!--  <header>
        <div class="header_logo" style="width:15%;margin-top:50px;">
        </div>
    </header> -->
    <form action="/signUpMember" method="POST"> 
    <div class="form-wrap">
        <div id="register">
            <p style="font-size:35px;">Register</p>
        </div> 
        <div class="secondmenu">
            <div><p id="join">회원가입 
            <font size="0.2" color="#818181"> &nbsp;* 모든 항목을 입력해주셔야 가입이 가능합니다</font></p></div>
            
            <div id="menu2">
                <p>아이디</p>
                <p>비밀번호</p>
                <p>비밀번호 확인</p>
                <p>이름</p>
                <p>닉네임</p>
                <p>주민등록번호</p>
                <p>휴대전화</p>
            </div>
            <div id="form2"> 
                <form> 
                    <p><input type="text" name="userId"> &nbsp; <input type="button" value="중복확인" /> &nbsp; (나중에 유효성 검사 규칙 적기)</p>
                    <p><input type="password" name="password" /> &nbsp; (유효성 검사 규칙 적기)</p>
                    <p> <input type="password" name="re_password" /></p>
                    <p><input type="text" name="userName" /> </p>
                    <p><input type="text" name="nickname" /> &nbsp; <input type="button" value="중복확인"/> </p>
                    <p><input type="text" name="jumin1" size="6" />  -  <input type="text" name="jumin2" size="6"/> </p> 
                    <p>
                    <input type="text" name="Phone1" size="2" placeholder="010">
                    - 
                    <input type="text" name="Phone2" size="3" />
                    -
                    <input type="text" name="Phone3" size="3" />
                	</p>
                </form>
            </div>
        </div>
        
        <br/><br/>
        <!-- 마케팅 동의 그냥 했다는것만 보여줄려면, 나중에 컬럼 추가해야함 -->
        <div class="checkbox_wrap mar27">
			        <input type="checkbox" id="marketing" name="marketing" class="agree_chk">
			        <label for="marketing">[선택]마케팅 목적 개인정보 수집 및 이용에 대한 동의</label>
							<ul class="explan_txt">
								<li><span class="red_txt">항목 : 성별, 생년월일</span></li>
								<li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br/>
									대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br/>
									다만 이때 회원 대상 서비스가 제한될 수 있습니다.
								</li>
							</ul>
			      </div>
        	<br/><br/><br/><br/>
        	<div class="btn_wrap">
				<button type="reset">취소</button> <!-- 나중에 넘어갈 로그인 화면 페이지 a태그로 연결! -->
				<button type="submit">다음</button> <!-- 나중에 넘어갈 로그인 화면 페이지 a태그로 연결! -->
			</div>
        <br />
        <br />
    </div>
    </form>
    <script>
		var result = '${error}';
		if(result != ''){
			alert(result);
		}
	</script>
</body>
</html>