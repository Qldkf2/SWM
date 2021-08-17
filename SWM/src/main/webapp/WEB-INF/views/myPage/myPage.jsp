<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
    <title>회원-마이페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/mypage.css">
</head>
<body>

	 <c:import url="../common/header.jsp"/> 
	 
<div id="container" data-token="A2Gc5/hHNw8KbD/hUT90EY+SNWGgSbjYueIr8QOMfbENUfis6eoUJFlAU+Yboqwg8O/yFukL7NEZgF6gM/8protj+L+OOgqFahkJMnXWM2kxi9+fa4Wkt7PhyK5wBQUH6fJxvaesF6DDm0l/KTJnszZasH2tDr9FbxC5IihrkXQ=">
    <div class="profile">
      <img src="https://cf-epi.campuspick.com/0.png" class="picture">
      <span class="nickname">${member.nickName }</span>
      <span class="userid">${member.userId }</span>
    </div>
    <h2>내 정보</h2>
    <ol class="items">
      <li><a href="/myPage/memberModify">회원정보 수정</a></li>
      <li><a href="/myPage/memberOut">회원 탈퇴</a></li>
    </ol>
    <h2>스터디 모임 정보</h2>
    <ol class="items">
      <li><a href="/myPage/myCreateStudy">내가 개설한 스터디</a></li>
      <li><a href="/myPage/myJoinStudy">내가 참여한 스터디</a></li>
      <li><a href="/myPage/myMeetingBoard?userNo=${member.userNo }">내가 쓴 글</a></li>
    </ol>
    <h2>커뮤니티 정보</h2>
    <ol class="items">
      <li><a href="/myPage/myCommunityList">내가 쓴 글</a></li>
    </ol>
    <h2>스터디 카페 정보</h2>
    <ol class="items">
      <li><a href="/myPage/myBookList?userNo=${member.userNo }">예약 현황</a></li>
      <li><a href="/myPage/articles?id=mycommentarticle">예약 취소</a></li>
    </ol>
    <h2>1:1 문의</h2>
    <ol class="items">
      <li><a href="/myPage/askWrite">문의 작성</a></li>
      <li><a href="/myPage/myAskList?id=${member.userNo }">문의 답변 확인</a></li>
    </ol>
  </div>

</body>
</html>