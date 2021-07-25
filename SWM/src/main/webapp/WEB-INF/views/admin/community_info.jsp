<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>커뮤니티 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">
<script>
	$(document).ready(function(){
		$('.mng-nav .gnb03').addClass('on');
	})
</script>
</head>
<body>
<div class="my-box">커뮤니티관리</div>
<div>
	<input type="text" placeholder="검색하실 단어를 입력해주세요." class="cafe_text">
	<button type="button" class="cafe_button">검색</button>
	<a href=".jsp" class="cafe_a">쓰기</a>
	<a href="?pageChange=detailFreeboard.jsp" class="cafe_a">수정</a>
	<a href=".jsp" class="cafe_a">삭제</a>
</div>

<table class="list-table">
	<colgroup>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
	</colgroup>
	<thead>
		<tr>
			<th>선택</th>
			<th>넘버</th>
			<th>제목</th>
			<th>닉네임</th>
			<th>날자</th>
			<th>조회수</th>
			<th>삭제여부</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="checkbox"></td>
			<td>넘버</td>
			<td>제목</td>
			<td>닉네임</td>
			<td>날자</td>
			<td>조회수</td>
			<td>삭제여부</td>
		</tr>
</tbody>
</table>
</body>
</html>