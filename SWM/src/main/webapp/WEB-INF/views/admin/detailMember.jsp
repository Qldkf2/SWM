<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>상세보기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/common_admin.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myPage/myPageCommunityList.js"></script>
<c:import url="../common/header.jsp" />
</head>
<body>
	<form>
		<table class="board_view">
			<caption class="my-box">회원정보</caption>
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="*">
			</colgroup>

			<tbody>
					<tr>
						<th>회원번호</th>
						<td>${adminMember.userNo}</td>
						<th>아이디</th>
						<td>${adminMember.userId}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${adminMember.userName}</td>
						<th>닉네임</th>
						<td>${adminMember.nickName}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>${adminMember.password}</td>
						<th>이메일</th>
						<td>${adminMember.email}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${adminMember.phone1} - ${adminMember.phone2} - ${adminMember.phone3}</td>
						<th>탈퇴여부</th>
						<td>${adminMember.status}</td>
					</tr>
			</tbody>
		</table>
		<br/>


		

		<a href="/admin/adminMemberinfo" id="list" class="btn">회원목록</a>
		<a href="/admin/memberModify2?userNo=${adminMember.userNo}" id="modify" class="btn">회원수정</a>
		<a href="/admin/adminMemberDelete?userNo=${adminMember.userNo}" id="delete" class="btn">회원삭제</a>
	</form>
</body>
</html>