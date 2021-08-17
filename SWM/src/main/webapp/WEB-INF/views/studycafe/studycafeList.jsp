<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>스윗미</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/meeting/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/studycafe/studycafeList.css">
</head>
<body>
<c:import url="../common/header.jsp" />



  <section class="search" style="top: -56px; transform: none;">
    <div class="wrap">
      <form>
        <input type="search" name="keyword" class="keyword" placeholder="찾으시는 스터디카페가 있나요?" autocomplete="off">
        <input type="submit" class="submit">
      </form>
    </div>
  </section>
  <section class="loc" style="top: 0px; transform: none;">
    <div class="wrap">

     <a href="/studycafeList" class="active">  <span class="text">전체</span>   </a>
    <a href="/studycafeSearch?keyword=종로구" > <span class="text">종로구</span> </a>
    <a href="/studycafeSearch?keyword=마포구" > <span class="text">마포구</span> </a>
    <a href="/studycafeSearch?keyword=영등포구" > <span class="text">영등포구</span> </a>
    <a href="/studycafeSearch?keyword=강남구" > <span class="text">강남구</span> </a>    
    <a href="/studycafeSearch?keyword=강서구" > <span class="text">강서구</span> </a>
    <a href="/studycafeSearch?keyword=은평구" > <span class="text">은평구</span> </a>
    <a href="/studycafeSearch?keyword=금천구" > <span class="text">금천구</span> </a>
    <a href="/studycafeSearch?keyword=용산구" > <span class="text">용산구</span> </a>
    <a href="/studycafeSearch?keyword=노원구" > <span class="text">노원구</span> </a>

    
    </div>
  </section>
  
  
  
  <div id="container" data-target="1" data-target-name="공모전" data-target-path="contest" data-category="" data-keyword="" style="padding-top: 0px;">
	  <div class="horizontal">
	  <h2>인기급 상승!</h2>
	<c:forEach  items="${bestStudycafeList}" var="best">
	 <a class="item" href="/studycafe/studycafeDetail?studycafe_no=${best.studycafe_no}" style="display: inline-grid;">
	 <div  class="jb-wrap">
           <div class="jb-image">
           <img src="${pageContext.request.contextPath}/resources/images/studycafe/main.jpg" style="width: 170px; height: 300px;"/>
           	<span class="jb-text2">스윗미 스터디카페</span>
            <span class="jb-text">${best.studycafe_name}</span>
        </div>
    </div>
           <h3>${best.studycafe_address}</h3>
           <p class="info" style="margin-left:1px;">
           <span class="dday">오픈시간 :</span>
              <span class="dday">[${best.studycafe_open} ~ ${best.studycafe_end}]</span>
           </p>
        </a>
	</c:forEach>
</div>
<div class="ad" style="background-color: rgb(242, 242, 242);"></div>

<div class="horizontal">
<h2>신규오픈!</h2>
	<c:forEach  items="${newStudycafeList}" var="newList">
	 <a class="item" href="/studycafe/studycafeDetail?studycafe_no=${newList.studycafe_no}" style="display: inline-grid;">
	 <div class="jb-wrap">
           <div class="jb-image">
           <img src="${pageContext.request.contextPath}/resources/images/studycafe/main.jpg" style="width: 170px; height: 300px;"/>
           	<span class="jb-text2">스윗미 스터디카페</span>
            <span class="jb-text">${newList.studycafe_name}</span>
        </div>
    </div>
           <h3>${newList.studycafe_address}</h3>
           <p class="info" style="margin-left:1px;">
           <span class="dday">오픈시간 :</span>
              <span class="dday">[${newList.studycafe_open} ~ ${newList.studycafe_end}]</span>
           </p>
        </a>
	</c:forEach>
</div>
<div class="horizontal">
	<img src="${pageContext.request.contextPath}/resources/images/studycafe/hongbo1.PNG" style="width: 100%;">
</div>

</body>
</html>