<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/studycafe/listStyle.css">

</head>
<body>

<c:import url="../common/header.jsp"/>
	


<div class="dropdown" style="float:left;">
  <button class="dropbtn">지역찾기</button>
  <div class="dropdown-content" style="left:0;">
 <a href="#" style="color: black;">종로</a>
  <a href="#"style="color: black;">종각</a>
  <a href="#"style="color: black;">람각</a>
  </div>
</div>

<div class="dropdown" style="float:left;">
  <button class="dropbtn">매장찾기</button>
  <div class="dropdown-content">
  <div style="hight:20px;">
<input placeholder="매장명 검색" style="hight:20px; width:155px;
  border-radius: 2px;border: solid black;">
  <button onclick="#" style="float:right;"><img action="#" src="../img/search.png"style=" width:60%; height:60%;">
</button>
</div>
  </div>
</div>

<a href="/studycafe/studtcafeBookDetail" class="button button2" style="vertical-align:middle;float:right; bottom: 0;">
<span>상세보기</span></a>

</body>
</html>