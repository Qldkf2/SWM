<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>상세보기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/common_admin.css">
<c:import url="../common/header.jsp" />
</head>
<body>
    <table class="board_view">
        <caption class="my-box">스터디</caption>
        <colgroup>
            <col width="20%">
            <col width="35%">
            <col width="20%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
            	<th>모임 고유 번호</th>
                <td>${detailMeeting.meeting_no}</td>
                <th>모임장 회원번호</th>
                <td>${detailMeeting.meeting_leader}</td>
                <th>게시글 제목</th>
                <td><a href="#">${detailMeeting.meeting_title}</a></td>
            </tr>
            <tr>
                <th>지역</th>
                <td>${detailMeeting.meeting_address}</td>
                <th>과목</th>
                <td>${detailMeeting.meeting_subject}</td>
            </tr>
            <tr>
                <th>모집인원</th>
                <td colspan="3">${detailMeeting.meeting_limit}</td>
            </tr>
            <tr style="height:300px;">
                <th>게시글 내용</th>
                <td colspan="3">${detailMeeting.meeting_content}</td>
           </tr>
        </tbody>

    </table>
    <br/>
        <a href="/admin/adminMeetingList" id="list" class="btn" >목록</a>
    	<a href="#this" id="drop" class="btn" >삭제</a>
     
 
</body>
</html>