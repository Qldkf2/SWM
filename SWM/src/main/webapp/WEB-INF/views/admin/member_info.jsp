<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">

<script>
	$(document).ready(function() {
		$('.mng-nav .gnb00').addClass('on');
	})
</script>
</head>
<body>
	<div class="my-box">회원관리</div>
	<div>
	<form method="POST" name="memberinfo" action="/memberinfo/Memberinfo">
		<input type="text" placeholder="검색하실 단어를 입력해주세요." class="member_text">
		<button type="button" class="cafe_button">검색</button>

	</div>

	<table class="list-table">
		<colgroup>
			<col>
			<col>
			<col>
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>전화번호</th>
				<th>회원유무</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>아이디</td>
				<td>닉네임</td>
				<td>전화번호</td>
				<td>회원유무</td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>
