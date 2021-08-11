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
</head>
<body>

 <c:import url="../common/header.jsp"></c:import>
 
<div id="container" >
    <div class="menu">
      <a class="active"><span>비밀번호 찾기 결과</span></a>
    </div>
    <form>
    <p style="text-align:center"><b> ${findPw.userName} </b>의 비밀번호는 <b><font color="#c62917"> ${findPw.password} </font></b> 입니다.</p>
    <br/><br/>
      <input type="button" onclick="location.href='/loginForm';" value="로그인 하기">
    </form>
  </div>
  
</body>
</html>