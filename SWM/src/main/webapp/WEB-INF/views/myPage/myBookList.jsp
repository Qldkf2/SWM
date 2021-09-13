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
 	 var IMP = window.IMP; // ���� ����
  	IMP.init("imp53431050"); // ��: imp00000000
  	
  	$("input[id^=requestPay]").on("click",function(e){
  	     // IMP.request_pay(param, callback) ����â ȣ��
  	     var book_no = event.target.id.substring(11);
  	     alert("������ �����Ͻðڽ��ϱ�?");
  	     
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
	  	             
	  	                 // ���� ���� �� ����, (������ ����ǰ�)
	  	                 $.ajax({
	  	                	 url:"/myPage/payStatus",
	  	                	 type:"post",
	  	                	 data:{
	  	                		 book_no:book_no,
	  	                		status:"�����Ϸ�"	 
	  	                	 },
	  	                	success: function(){
	  	                		alert("���� �Ϸ�");
	  	                		window.location.reload();
	  	                	}
	  	                 });
	  	                 
	  	            
	  	             } else {
	  	            	alert("������ �����Ͽ����ϴ�. ���� ����: " +  rsp.error_msg);
	  	                 // ���� ���� �� ����,
	  	          
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
		<h1 class="mypagearticlesname">���� ��Ȳ</h1>
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
						<p class="text short">���� ������ : ${book.studycafe_name }</p>
						<!-- <p class="status">
							<span class ="votecount">0</span>
							<span class="commentcount">1</span>
						</p> -->
						<p class="text short">���� ��¥ : ${book.book_date}</p>
						<p class="text short">���� �� : ${book.studycafe_room}</p>
						<p class="text short">���� �ο� : ${book.permit_limit} ��</p>
						<p class="text short">���� �ð� : ${book.start_time} : 00 ~ ${book.end_time} : 00</p>
						<p class="text short">�����ݾ� : <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.pay}" />  ��</b>
						<c:choose>
						<c:when test="${book.status eq '����'}"  >
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
							   						<c:when test="${book.status eq '�����Ϸ�'}"  >
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
									<h1 data-v-7c8cb348="" style="text-align:center; margin:30px">������ ���͵�ī�䰡 �����ϴ�</h1>
								
					         </a>
		
		</c:otherwise>
		</c:choose>
	</div>

</body>
</html>