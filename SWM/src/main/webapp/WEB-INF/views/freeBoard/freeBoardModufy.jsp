<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>스윗미</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/293ea01f8752947ab0a4.css">




</head>
<body>
<c:import url="../common/header.jsp" />
   
   
   
	<div data-v-7c8cb348="" class="container" >
	
	
	<article data-v-7c8cb348>
			
			
			<div data-v-7c8cb348="">
			<form data-v-7c8cb348="" class="container" method="POST" action="">
			
			              
 
			<p data-v-7c8cb348="" class="title"><input data-v-7c8cb348="" name="title" type="text" value="수정할 제목"></p> 
			<p data-v-7c8cb348="" class="text"><textarea data-v-7c8cb348="" >수정할 내용</textarea></p> 
			<p data-v-7c8cb348="" class="file"><input data-v-7c8cb348="" type="file" ><label for="file">수정 파일업로드</label> </p> 
			
			<div data-v-7c8cb348="" class="submit">			
				<input data-v-7c8cb348="" type="submit" value="수정하기">
			</div>
			</form>
						
			</div>
	

	     	
	     	
     	</article>
     	
     	
     </div>
     	

 
	<div data-v-7c8cb348="" class="container">    		

		  <a data-v-7c8cb348="" href="freeBoard.jsp"  class="floating write"> 목록</a> <!---->      	
	</div>

</body>
</html>