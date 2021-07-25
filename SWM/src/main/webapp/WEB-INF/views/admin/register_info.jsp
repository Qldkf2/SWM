<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>신고맴버 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">
<script>
	$(document).ready(function(){
		$('.mng-nav .gnb01').addClass('on');
	});
</script>
</head>
<body>
<div class="my-box">
신고관리
</div>
<div>
	<input type="text" placeholder="검색하실 단어를 입력해주세요." class="cafe_text">
	<button type="button" class="cafe_button">검색</button>

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
			<th>피의자</th>
			<th>피해자</th>
			<th>신고내용</th>
			<th>날자</th>
			<th>처리유무</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="checkbox"></td>
			<td>넘버</td>
			<td>피의자</td>
			<td>피해자</td>
			<td>신고내용</td>
			<td>날자</td>
			<td>처리유무</td>
		</tr>
</tbody>
</table>
</body>
</html>