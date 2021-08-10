<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/board.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage/ask.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	
	function fn_ask() {
		
		if($("#title").val()=="" || $("#title").val()==null) {
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;
		}
		
		if($("#content").val()=="" || $("#content").val()==null) {
			alert("문의 내용을 입력하세요");
			$("#content").focus();
			return false;
		}
		
		if($("#content").val().length > 150 ) {
			alert("문의 내용은 150글자를 초과할 수 없습니다 \n 현재 글자 수 : " + $("#content").val().length );
			return false;
		}
		
		alert("문의가 정상적으로 접수되었습니다");
	}

</script>

</head>
<body>
   <c:import url="../common/header.jsp"/> 

   <div id="container" data-id="myarticle">
	<form data-v-1bae20ac="" class="container" action="/myPage/askWrite", method="POST" onsubmit="return fn_ask()">
	<section data-v-1bae20ac="">
	<h1 data-v-1bae20ac="">1:1 문의</h1> 
	<p data-v-1bae20ac="" class="description">
        접수된 문의는 순차적으로 처리됩니다.
        <br data-v-1bae20ac="">
        문의가 급격히 증가하는 경우, 답변처리가 다소 지연될 수 있음을 양해부탁드립니다.
        <br data-v-1bae20ac=""> 
        <strong data-v-1bae20ac="">빠르고 정확한 답변</strong>
        을 위해 최선을 다하겠습니다.
      </p> 
      </p> <h2 data-v-1bae20ac="">문의 내용</h2> 
      <div data-v-1bae20ac="" class="input">
      	<div data-v-1bae20ac="" class="label">
      		<label data-v-1bae20ac="">제목 *</label>
      	</div> 
      	<input id="title" data-v-1bae20ac="" type="text" name="ask_title" maxlength="255" autocomplete="off">
      	</div> 
      	<div data-v-1bae20ac="" class="input">
      		<div data-v-1bae20ac="" class="label">
      			<label data-v-1bae20ac="">내용 *</label>
      		</div> 
      		<textarea id="content" data-v-1bae20ac="" name="ask_content" placeholder="문의 내용을 자세하게 작성해주세요."></textarea>
      	</div>
      	<input type="hidden" name="userNo" value="${member.userNo }">
      	<input data-v-1bae20ac="" type="submit" value="문의 접수하기">
      </section>
     </form>
    </div>
</body>
</html>