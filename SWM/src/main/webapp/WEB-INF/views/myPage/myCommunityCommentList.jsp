<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/communityBoard.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myPage/myPageCommunityList.js"></script>
</head>
<body>

	<c:import url="../common/header.jsp"></c:import>
	<div id="container" data-id="myarticle">
		<h1 class="mypagearticlesname">댓글 단 글</h1>
		<div class="articlelist" style="display :block;">
			<ol class="group">
				<li>
					<a class="community" href="/community?id=${communityBoardId} "></a>
					<a class="article" href="/community?id=?&boardId=?&articleId=?">
						<p class="profile">
							<span class="nickname">익명</span>
							<time>07/18 17:05</time>
						</p>
						<hr>
						<p class="text short">날씨가 왕좋당>.</p>
						<p class="status">
							<span class ="votecount">0</span>
							<span class="commentcount">1</span>
						</p>
						<hr>
					</a> 
				</li>
			</ol>
		</div>
		
	</div>

</body>
</html>