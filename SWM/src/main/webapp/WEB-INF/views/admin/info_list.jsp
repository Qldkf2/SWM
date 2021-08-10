<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin/info_list.css">

    <script>
    $(document).ready(function(){
    	$("#spreadBtn02").click(function(){
    		if($("#hiddenList01").is(":visible")){
    			$("#hiddenList01").slideUp();
    		}else{
    			$("#hiddenList01").slideDown();
    		}
    	});
    });
    </script>
</head>
<body>
    <div>
       <div class="left-con">
          <div class="user-info">
             <span class="user-img">
               <img src="https://cf-epi.campuspick.com/0.png" class="picture" alt="" >
             </span>
             <strong class="user-info__name">관리자(임동원)</strong>
             <ul class="btn-wrap type0" style="list-style : none;">
                <li>
                   <a href="/mypage">마이페이지</a>
                </li>
                <li>
                  <a href="/logout">로그아웃</a>
                </li>
             </ul>
          </div>
          <nav class="mng-nav">
             <ul>
                <li class="gnb00">
                   <a href="?pageChange=member_info.jsp">회원관리</a>
                </li>
                <li class="gnb01">
                  <a href="?pageChange=register_info.jsp">신고회원관리</a>
                </li>
                <li class="gnb02">
                  <a href="?pageChange=meeting_info.jsp">스터디관리</a>
                </li>
                <li class="gnb03">
                  <a href="?pageChange=community_info.jsp">커뮤니티관리</a>
                </li>
                <li class="menu">
					<a href="#" id="spreadBtn02" class="a01">스터디카페관리</a>
					<ul id="hiddenList01" class="example01" style="display: none;">
	                  	<li class="gnb04">
	                  		<a href="?pageChange=/studyCafeinfo">리스트</a>
	                  	</li>
	                  	<li class="gnb05">
	                  		<a href="?pageChange=booking_info.jsp">예약현황</a>
	                  	</li>
                  	</ul>
                </li>
                <li class="gnb06">
                  <a href="?pageChange=query_info.jsp">1:1문의관리</a>
                </li>
             </ul>
          </nav>
       </div>
    </div>
</body>
</html>
