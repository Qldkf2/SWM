<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>스터디 카페 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">
<script>
	$(document).ready(function(){
		$('.mng-nav .gnb04').addClass('on');
		$('.example01').css('display', 'block');
	})
</script>
</head>
<body>
<div class="my-box">스터디카페관리</div>
<div class="cf">
	<input type="text" placeholder="검색하실 단어를 입력해주세요." class="cafe_text">
	<button type="button" class="cafe_button">검색</button>
	<ul class="btn-wrap right">
		<li>
			<a href="?pageChange=studycafe_write.jsp" class="cafe_a">쓰기</a>
		</li>
	</ul>
</div>

<table class="list-table">
	<colgroup>
		<col width="">
		<col width="">
		<col width="">
		<col width="">
		<col width="">
		<col width="">
	</colgroup>
	<thead>
		<tr>
			<th>선택</th>
			<th>대표이미지</th>
			<th>카페명</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>영업시간</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="checkbox"></td>
			<td>대표이미지</td>
			<td>카페명</td>
			<td>주소</td>
			<td>전화번호</td>
			<td>영업시간</td>
		</tr>
</tbody>
</table>
</body>
</html>