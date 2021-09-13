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
 
  
   <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
  
  <script type="text/javascript">
  
  window.onload = function() {		
 	 var IMP = window.IMP; // 생략 가능
  	IMP.init("imp53431050"); // 예: imp00000000
  	
  	$("input[id^=requestPay]").on("click",function(e){
  	     // IMP.request_pay(param, callback) 결제창 호출
  	     var book_no = event.target.id.substring(11);
  	     alert("결제를 진행하시겠습니까?");
  	     
  	     $.ajax({
  	    	 url:"/book/requestPay",
  	    	 type:"POST",
  	    	 data:{book_no: book_no},
  	    	 success:function(data){
  	    		
	  	           IMP.request_pay({ // param
	  	             pg: "html5_inicis",
	  	             pay_method: "card",
	  	             merchant_uid: data.meeting_no,	
					name: data.item,
					amount: data.pay,
					buyer_email: data.email,
					buyer_name: data.username,
					buyer_tel: data.phone
	  	         }, function (rsp) { // callback
	  	             if (rsp.success) {
	  	             
	  	                 // 결제 성공 시 로직, (서버에 저장되게)
	  	                 $.ajax({
	  	                	 url:"/myPage/payStatus",
	  	                	 type:"post",
	  	                	 data:{
	  	                		 book_no:book_no,
	  	                		status:"결제완료"	 
	  	                	 },
	  	                	success: function(){
	  	                		alert("결제 완료");
	  	                		window.location.reload();
	  	                	}
	  	                 });
	  	                 
	  	            
	  	             } else {
	  	            	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	  	                 // 결제 실패 시 로직,
	  	          
	  	             }
  	         });
  	    	 }
  	     
  	    	 
  	     });
  	     
  	     
  	     
  	     

  	});
  	
  	
  }
  	
  </script>
</head>
<body>

	<c:import url="../common/header.jsp"></c:import>
	<div id="container" data-id="myarticle">
		<h1 class="mypagearticlesname">예약 현황</h1>
		<c:choose>
		<c:when test="${fn:length(bookList) > 0}">
			<c:forEach items="${bookList}" var="book">
		
		<div class="articlelist" style="display :block;">
			<ol class="group">
				<li>
					<a class="community" href=""></a>
					<a class="article" >
						<p class="profile">
							<span class="nickname">${book.userName}</span> 
							<time>${book.book_date }</time>
						</p>
						<hr>
						<p class="text short">예약 지점명 : ${book.studycafe_name }</p>
						<!-- <p class="status">
							<span class ="votecount">0</span>
							<span class="commentcount">1</span>
						</p> -->
						<p class="text short">예약 날짜 : ${book.book_date}</p>
						<p class="text short">예약 룸 : ${book.studycafe_room}</p>
						<p class="text short">예약 인원 : ${book.permit_limit} 명</p>
						<p class="text short">예약 시간 : ${book.start_time} : 00 ~ ${book.end_time} : 00</p>
						<p class="text short">결제금액 : <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.pay}" />  원</b>
						<c:choose>
						<c:when test="${book.status eq '결제'}"  >
							<input type="button"  id="requestPay_${book.book_no}" style="    float: right; 	display: inline-block;
							    width: 50px;
							    height: 35px;
							    color: #fff;
							    font-size: 14px;
							    font-weight: bold;
							    text-align: center;
							    background-color: crimson;
							   	border-radius: 5px;
							   	cursor: pointer;"value="${book.status}">
							   </c:when>
							   						<c:when test="${book.status eq '결제완료'}"  >
							<input type="button"  id="requestPay_${book.book_no}" disabled="disabled" style="    float: right; 	display: inline-block;
							    width: 70px;
							    height: 35px;							   
							    color: #fff;
							    font-size: 14px;
							    font-weight: bold;
							    text-align: center;
							    background-color: dimgray;
							   	border-radius: 5px;
							   	"value="${book.status}">
							   </c:when>
						</c:choose>
						</p>
					
						<hr>
					</a> 
				</li>
			</ol>
		</div>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<a data-v-7c8cb348 class="item" style="margin:20px" >
								
									<br/><br/><br/><br/>
									<center><img src="https://www.campuspick.com/images/community.board.list.empty.png"/></center>
									<h1 data-v-7c8cb348="" style="text-align:center; margin:30px">예약한 스터디카페가 없습니다</h1>
								
					         </a>
		
		</c:otherwise>
		</c:choose>
	</div>

</body>
</html>