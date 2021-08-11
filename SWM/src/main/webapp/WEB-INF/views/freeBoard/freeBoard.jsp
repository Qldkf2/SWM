2<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>스윗미</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/meeting/293ea01f8752947ab0a4.css">



</head>
<body>
	<c:import url="../common/header.jsp" />



	<div data-v-7c8cb348="" class="container">


		<article data-v-7c8cb348>
			<h1 data-v-7c8cb348="">자유게시판</h1>
			<div data-v-7c8cb348 class="search">
				<form data-v-7c8cb348 class>
					<input data-v-7c8cb348 type="search" name="keyword" class="keyword"
						placeholder="검색" value="" autocomplete="off"> <input
						data-v-7c8cb348 type="submit" class="submit">

				</form>
			</div>


			<hr style="background: #d6d6d6; height: 1px;">
			<div data-v-7c8cb348 class="list">

				<!-- 리스트 -->
				<c:forEach items="${freeBoardList}" var="list">
					<a data-v-7c8cb348 href="/freeBoard/freeBoardDetail?free_no=${list.free_no}"
						class="item">

						<h2 data-v-7c8cb348="">${list.free_title}</h2>
						<p data-v-7c8cb348 class="info">
							<span data-v-7c8cb348="">${list.userNo}</span> <span data-v-7c8cb348="">${list.free_date}
							</span> <span data-v-7c8cb348="" class="viewcount">${list.free_hit}</span>
						</p>
					</a>
				</c:forEach> 


			</div>

		</article>


	</div>



	<div data-v-7c8cb348="" class="container">

		<a data-v-7c8cb348 href="/freeBoard/freeBoardWriteForm"
			class="floating write">글쓰기</a>

	</div>


	<div class="modal hidden">
		<div class="bg"></div>

		<div class="modalBox"></div>
	</div>

</body>
</html>