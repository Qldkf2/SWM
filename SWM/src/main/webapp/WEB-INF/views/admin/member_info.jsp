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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">
</head>
<body>
<c:import url="../common/header.jsp"/>
	<div class="my-box">회원관리</div>
	<div>
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
				<th>이름</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody type="infolist">
			<c:choose>
				<c:when test="${fn:length(memberList) > 0}">
					<c:forEach items="${memberList}" var="MBlist">
						<tr>
							<td class="userId">
								<a href="/admin/adminMemberDetail?userNo=${MBlist.userNo}" name="userId">${MBlist.userId}</a>
								<input type="hidden" id="userNo"  value="${MBlist.userNo}">
							</td>
							<td>${MBlist.nickName}</td>
							<td>${MBlist.userName}</td>
							<td>${MBlist.phone1} - ${MBlist.phone2} - ${MBlist.phone3}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

</body>
</html>
