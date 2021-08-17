<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>예약현황관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">
<c:import url="../common/header.jsp" />
<script>
	$(document).ready(function(){
		$('.mng-nav .gnb05').addClass('on');
		$('.example01').css('display', 'block');
	})
</script>
</head>
<body>
<div class="my-box">예약현황</div>
<div class="cf">
	<input type="text" placeholder="검색하실 단어를 입력해주세요." class="cafe_text">
	<button type="button" class="cafe_button">검색</button>
	<ul class="btn-wrap right">
		<li>
			<a href=".jsp" class="cafe_a">쓰기</a>
		</li>
		<li>
			<a href="?pageChange=bookStudyView.jsp" class="cafe_a">수정</a>
		</li>
		<li>
			<a href=".jsp" class="cafe_a">삭제</a>
		</li>
	</ul>
</div>

<table class="list-table">
	<colgroup>
		<col width="">
		<col width="">
		<col width="">
		<col width="">
	</colgroup>
	<thead>
		<tr>
			<th>예약번호</th>
			<th>예약자</th>
			<th>카페명</th>
			<th>룸정보</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>예약번호</td>
			<td>예약자</td>
			<td>카페명</td>
			<td>룸정보</td>
		</tr>
</tbody>
</table>
</body>
</html>