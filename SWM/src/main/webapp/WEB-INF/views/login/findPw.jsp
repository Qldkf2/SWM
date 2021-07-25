<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
    <title>비밀번호찾기</title>
<link rel="stylesheet" type="text/css" href="../css/findId.css">
</head>
<body>
    <header>
        <div class="header_logo" style="width:15%;margin-top:50px;">
        </div>
    </header>
    <div class="form-wrap">
        <div id="register">
            <p style="font-size:35px;">비밀번호 찾기</p>
        </div>
        <div class="secondmenu">
            <div><p id="join"><font size="2px">회원가입 시 등록된 정보로 비밀번호를 찾을 수 있습니다.</font></div>
            
            <div id="menu2">
            	<p>아이디</p>
                <p>이름</p>
                <p>주민등록번호</p>
            </div>
            <div id="form2">
                <form>
                    <p><input type="text" name="id" placeholder="아이디를 입력하세요."></p>
                    <p><input type="text" name="name" placeholder="이름을 입력하세요."></p>
                    <p><input type="text" name="jumin1" />  &nbsp;-&nbsp; <input type="text" name="jumin2" /></p>
                </form>
            </div>
        </div>
        <div id="notice">
        	<p>· 비밀번호를 찾지 못했다면 고객센터(0000-0000)로 문의해주세요. </p>
        	<p>· 아이디를 모르신다면 아이디 찾기를 이용해주세요. &nbsp; <a href="link"><b><font size="0.5">아이디 찾기</font></b></a> </p>
        </div>
        <br/><br/><br/>
        	<div class="btn_wrap">
				<a href="javascript:;">확인</a> <!-- 나중에 넘어갈 로그인 화면 페이지 a태그로 연결! -->
			</div>
        <br />
        <br />
    </div>
</body>
</html>