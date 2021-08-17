<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/myPage/out.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</head>
<body>
	<c:import url="../common/header.jsp"/>

	<form data-v-75203738="" class="container" action="/admin/adminMemberinfo" method="POST" onsubmit="return fn_out()">
		<section data-v-75203738="">
			<h1 data-v-75203738="">회원 탈퇴 처리되었습니다.</h1>
			<div data-v-75203738="" class="rules">
				<!---->
				<p data-v-75203738="">
					${userId}, ${username}<br data-v-75203738="">
				</p>
			</div>
			<input data-v-75203738="" type="submit" value="회원 목록으로 이동">
		</section>
	</form>
</body>
</html>