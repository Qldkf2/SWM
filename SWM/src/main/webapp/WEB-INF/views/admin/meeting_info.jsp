<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>스터디 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">
<script>
	$(document).ready(function(){
		$('.mng-nav .gnb02').addClass('on');
	})
</script>
</head>
<body>
<div class="my-box">스터디관리</div>
<div>
	<input type="text" placeholder="검색하실 단어를 입력해주세요." class="cafe_text">
	<button type="button" class="cafe_button">검색</button>
	<a href=".jsp" class="cafe_a">쓰기</a>

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
		<col>
		<col>
	</colgroup>
	<thead>
		<tr>
			<th>선택</th>
			<th>스터디번호</th>
			<th>회원번호</th>
			<th>닉네임</th>
			<th>제목</th>
			<th>내용</th>
			<th>주소</th>
			<th>과목</th>
			<th>모집인원</th>
			<th>삭제여부</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="checkbox"></td>
			<td>스터디번호</td>
			<td>회원번호</td>
			<td>닉네임</td>
			<td>제목</td>
			<td>내용</td>
			<td>주소</td>
			<td>과목</td>
			<td>모집인원</td>
			<td>삭제여부</td>
		</tr>
</tbody>
</table>
</body>
</html>
