<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/mypage.css">

</head>
<body>

	 <c:import url="../common/header.jsp"/> 
	 
<div id="container" data-token="A2Gc5/hHNw8KbD/hUT90EY+SNWGgSbjYueIr8QOMfbENUfis6eoUJFlAU+Yboqwg8O/yFukL7NEZgF6gM/8protj+L+OOgqFahkJMnXWM2kxi9+fa4Wkt7PhyK5wBQUH6fJxvaesF6DDm0l/KTJnszZasH2tDr9FbxC5IihrkXQ=">
    <div class="profile">
      <img src="https://cf-epi.campuspick.com/0.png" class="picture">
      <span class="nickname">회원닉네임</span>
      <span class="userid">회원아이디</span>
    </div>
    <h2>회원 관리</h2>
    <ol class="items">  
      <li><a href="/admin/adminMemberinfo">회원 리스트</a></li>
    </ol>
    <h2>스터디 카페 관리</h2>
    <ol class="items">
      <li><a href="/admin/studycafeWriteForm">스터디 카페 등록하기</a></li>
      <li><a href="/admin/studycafeinfo">스터디카페 관리하기</a></li>
    </ol>
    <h2>스터디 모임 관리</h2>
    <ol class="items">
      <li><a href="/myPage/myJoinStudy">개설된 스터디 모임</a></li>
      <li><a href="/myPage/myCreateStudy">스터디 모임들 삭제하기</a></li>
      <li><a href="/myPage/myMeetingBoard">내가 쓴 글</a></li>
      <li><a href="/myPage/myMeetingBoardComment">내가 쓴 댓글</a></li>
    </ol>
    <h2>커뮤니티 관리</h2>
    <ol class="items">
      <li><a href="/myPage/myCommunityList">자유게시판 보기</a></li>
      <li><a href="/myPage/myCommunityCommentList">내가 쓴 댓글</a></li>
    </ol>
    <h2>1:1 문의</h2>
    <ol class="items">
      <li><a href="/admin/adminAskList">문의 확인</a></li>
    </ol>
  </div>

</body>
</html>
