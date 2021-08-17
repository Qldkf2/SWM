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
<c:import url="../common/header.jsp" />
</head>
<body>
<div class="my-box">스터디관리</div>
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
	</colgroup>
	<thead>
		<tr>
			<th>스터디번호</th>
			<th>제목</th>
			<th>닉네임</th>
			<th>과목</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${meetingList}" var="MTlist">
		<tr>
			<td>${MTlist.meeting_no}</td>
			<td class="hiddenId">
				<a href="/admin/adminMeetingDetail?meeting_No=${MTlist.meeting_no}" name="meeting_Title">${MTlist.meeting_title}</a>
				<input type="hidden" id="hiddenId"  value="${MTlist.meeting_no}">
			</td>
			<td>${MTlist.meeting_age}</td>
			<td>${MTlist.meeting_subject}</td>
		</tr>
		</c:forEach>
</tbody>
</table>
</body>
</html>
