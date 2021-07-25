<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>1:1문의 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">
<script>
	$(document).ready(function(){
		$('.mng-nav .gnb06').addClass('on');
	})
</script>
</head>
<body>
<div class="my-box">
1:1문의관리
</div>
<div>
	<input type="text" placeholder="검색하실 단어를 입력해주세요." class="cafe_text">
	<button type="button" class="cafe_button">검색</button>
	<a href="?pageChange=askDetail.jsp" class="cafe_a">답변</a>

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
		<col>
	</colgroup>
	<thead>
		<tr>
			<th>선택</th>
			<th>번호</th>
			<th>회원번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>닉네임</th>
			<th>등록날자</th>
			<th>답변여부</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="checkbox"></td>
			<td>번호</td>
			<td>회원번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>닉네임</td>
			<td>등록날자</td>
			<td>답변여부</td>
		</tr>
</tbody>
</table>
</body>
</html>