<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>스터디 카페 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_info.css">
<c:import url="../common/header.jsp" />
<script>
	$(document).ready(function(){
		$('.mng-nav .gnb04').addClass('on');
		$('.example01').css('display', 'block');
	})
	
	$(document).ready(function(){ 
		$("#list").on("click", function(e){ //목록으로 버튼 
			e.preventDefault(); fn_openBoardList(); }); 
		
		$("#write").on("click", function(e){ //작성하기 버튼 
			e.preventDefault(); fn_insertBoard(); }); }); 
	
		function fn_openBoardList(){ var comSubmit = new ComSubmit(); 
				comSubmit.setUrl("<c:url value='/studyCafeinfo' />"); 
				comSubmit.submit(); } 
		
		function fn_insertBoard(){ var comSubmit = new ComSubmit("Cafeinfo"); 
				comSubmit.setUrl("<c:url value='/studyCafeinfo' />"); 
				comSubmit.submit(); }
	}


</script>
</head>
<body>
	<div class="my-box">스터디카페관리</div>
	<div class="cf">
		<form method="POST" name="Cafeinfo" action="/studyCafe/Cafeinfo">
			<input type="text" placeholder="검색하실 단어를 입력해주세요." class="cafe_text">
			<button type="button" class="cafe_button">검색</button>
			<ul class="btn-wrap right">
				<li><a href="?pageChange=/studyCafe/write" class="cafe_a">쓰기</a></li>
			</ul>
	</div>

	<table class="list-table">
		<colgroup>
			<col width="">
			<col width="">
			<col width="">
			<col width="">
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>카페명</th>
				<th>전화번호</th>
				<th>영업시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${studycafeList}" var="sdclist">
			<c:url var="viewURL" value="">
				<c:param name="studycafe_no" value="${sdclist.studycafe_no}" />
			</c:url>
			<tr>
				<td>${sdclist.studycafe_no}</td>
				<td><a href="/admin/studycafedetail?studycafe_no=${sdclist.studycafe_no}"
				id="BIG_CATEGORY" class="">${sdclist.studycafe_name}</a></td>
				<td>${sdclist.studycafe_phone}</td>
				<td>
				${sdclist.studycafe_open}
				~
				${sdclist.studycafe_end}
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
</body>
</html>