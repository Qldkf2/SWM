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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/studycafe/studycafeDetail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/studycafe/listStyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/studycafe/bookStyle.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/main.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/meeting/meeting.css">


	<script defer type="text/javascript">
		
	window.onload = function() {		
		
		var today = new Date().toISOString().substring(0, 10);
	  	document.getElementById('book_date').value = today;
	  	/* 오늘부터 선택할수있게 min값 지정 */
	  	document.getElementById('book_date').setAttribute('min',	today);
	  	
		var modal = document.getElementById('myModal');
	
		var btn = document.getElementById("myBtn");
		
	
	
		var span = document.getElementsByClassName("close")[0];
	

		
		$(document).ready(function(){


			$("span[id^='delete']").on("click",function(e){
				var review_no = event.target.parentNode.id;   
				review_no=review_no.substring(7);
				
				$.ajax({
					url:"/studycafe/reviewDelete",
					type:"post",
					data:{review_no : review_no },
					success: function(){
						alert("리뷰삭제가 완료되었습니당.");
						 location.href="/studycafe/reviewPage?studycafe_no="+${s.studycafe_no};
						 
		            		
					}
				});
				
				
				
				
			})
			
			$("#studycafe_room").on("change", function(e){
				var v= this.value;
				
				var roomImage = v.split("#");
				var roomName= $("#studycafe_room option:selected").text();
				
				if(roomImage != "main"){
					$("#image").html("<img src='${pageContext.request.contextPath}/resources/files/studycafe/"+roomImage[0]+"' style='width:450px;height: 350px; margin-top:20px;''>");
				}
				else{
					$("#image").html("<img src='${pageContext.request.contextPath}/resources/images/studycafe/sca.png' style='width:450px;height: 350px; margin-top:20px;'>");
					
				}



				$.ajax({
					url:"/studycafe/bookTime",
					type:"post",
					data:{
						studycafe_no:${s.studycafe_no},
						studycafe_room:roomName,
						book_date:$("#book_date").val(),
						studycafe_open:${s.studycafe_open},
						studycafe_end:${s.studycafe_end}						
					},
					success: function(data){
						
						var str="<h3> <label for='start_time' style='text-align: left;'> 예약시간</label>"
						      +"<select id='start_time'  name='start_time' size='1' style=' width: 100px;'>"
							  +"<option value='0'>시작시간</option>";				  
						
						for(var i in data){
							if(data[i]!='Y'){
							str += "<option value='"+i.substring(0,2)+"' >"+i+"</option>";
							}else{
								str += "<option value='"+i.substring(0,2)+"'disabled>"+i+"</option>";
							}
						}
						str+="</select> ~   ";
						
						
						str +="<select id='end_time'  name='end_time' size='1' style=' width: 100px;'>"
							  +"<option value='0'>종료시간</option>";				  
						
						for(var i in data){
							if(data[i]!='Y'){
								str += "<option value='"+i.substring(0,2)+"' >"+i+"</option>";
								}else{
									str += "<option value='"+i.substring(0,2)+"'disabled>"+i+"</option>";
								}
							
						}
						str+="</select></h3>";
						
						
						$("#bookTime").html(str);
						var start_time=$("#start_time").val();
						var end_time=$("#end_time").val();
							
						var pay;
						if(start_time=="0" || end_time=="0" ){
							pay= ($("#permit_limit").val()*1000);
							$("#pay1").html(($("#permit_limit").val()*1000));
						}else{
							pay=(Number(end_time)-Number(start_time)) * ($("#permit_limit").val()*1000);
							
						}
						
						$("#pay1").html(pay);
						$("#pay").attr('value',pay);
					},
					error : function(error) {
						console.log("error");
					}
				});
								
			});
			
			$("#book_date").on("change", function(e){
				$.ajax({
					url:"/studycafe/bookTime",
					type:"post",
					data:{
						studycafe_no:${s.studycafe_no},
						studycafe_room:$("#studycafe_room option:selected").text(),
						book_date:$("#book_date").val(),
						studycafe_open:${s.studycafe_open},
						studycafe_end:${s.studycafe_end}						
					},
					success: function(data){
						
						var str="<h3> <label for='start_time' style='text-align: left;'> 예약시간</label>"
						      +"<select id='start_time'  name='start_time' size='1' style=' width: 100px;'>"
							  +"<option value='0'>시작시간</option>";				  
						
						for(var i in data){
							if(data[i]!='Y'){
							str += "<option value='"+i.substring(0,2)+"' >"+i+"</option>";
							}else{
								str += "<option value='"+i.substring(0,2)+"'disabled>"+i+"</option>";
							}
						}
						str+="</select> ~   ";
						
						
						str +="<select id='end_time'  name='end_time' size='1' style=' width: 100px;'>"
							  +"<option value='0'>종료시간</option>";				  
						
						for(var i in data){
							if(data[i]!='Y'){
								str += "<option value='"+i.substring(0,2)+"' >"+i+"</option>";
								}else{
									str += "<option value='"+i.substring(0,2)+"'disabled>"+i+"</option>";
								}
							
						}
						str+="</select></h3>";
						
						
						$("#bookTime").html(str);
					},
					error : function(error) {
						console.log("error");
					}
				});
			});
			
			

			
			/*동적으로 생성된 태그들 이벤트  */
			$(document).on("change","#end_time",function(event){
				var start_time=$("#start_time").val();
				var end_time=this.value;
				
				$.ajax({
					url:"/studycafe/checkTime",
					type:"POST",
					data:{
						studycafe_no:${s.studycafe_no},
						studycafe_room:$("#studycafe_room option:selected").text(),
						book_date:$("#book_date").val(),
						start_time:start_time,
						end_time:end_time
					},
					success: function(data){
						if(data==false){
							alert("예약시간을 확인해 주세요!");
							$("#pay1").html(($("#permit_limit").val()*1000));
							$("#start_time").val("0").prop("selected", true);
							$("#end_time").val("0").prop("selected", true);
							
						}else{

							var pay;
							if(start_time=="0" || end_time=="0" ){
								pay= $("#pay1").text()*1;
							}else{
								pay=(Number(end_time)-Number(start_time)) *($("#permit_limit").val()*1000);
								
							}
							
							$("#pay1").html(pay);
							$("#pay").attr('value',pay);
						}
					}
				});
				
			});
			
			/*동적으로 생성된 태그들 이벤트  */
			$(document).on("change","#start_time",function(event){
				var start_time=this.value;
				var end_time=$("#end_time").val();
				
				$.ajax({
					url:"/studycafe/checkTime",
					type:"POST",
					data:{
						studycafe_no:${s.studycafe_no},
						studycafe_room:$("#studycafe_room option:selected").text(),
						book_date:$("#book_date").val(),
						start_time:start_time,
						end_time:end_time
					},
					success: function(data){
						if(data==false){
							alert("예약시간을 확인해 주세요!");
							$("#pay1").html(($("#permit_limit").val()*1000));
							$("#start_time").val("0").prop("selected", true);
							$("#end_time").val("0").prop("selected", true);
					
						}else{

							var pay;
							if(start_time=="0" || end_time=="0" ){
								pay= $("#pay1").text()*1;
							}else{
								pay=(Number(end_time)-Number(start_time)) * ($("#permit_limit").val()*1000);
								
							}
							
							$("#pay1").html(pay);
							$("#pay").attr('value',pay);
						}
					}
				});
				
			});
			
			$(document).on("change","#permit_limit",function(event){
	

				var start_time=$("#start_time").val();
				var end_time=$("#end_time").val();
				
				var pay;
				if(start_time=="0" || end_time=="0" ){
					pay= this.value*1000;
				}else{
					pay=(Number(end_time)-Number(start_time)) * (this.value*1000);
					
				}
				
				$("#pay1").html(pay);
				$("#pay").attr('value',pay);
			});
			
		});

		btn.onclick = function(){
			

				modal.style.display = 'block';	

		};
		
		span.onclick = function() {
			modal.style.display = "none";
		};

		
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		document.getElementById("modal_close_btn").onclick = function() {
			document.getElementById('myModal').style.display = "none";
		}
		
		
	}
	

	</script>
	
	<script>


	function fn_loginCheck(){
		alert("로그인 후 이용하시길 바랍니다.");
		location.href="/loginForm";
	}

	function fn_insertReview(){
		if(${member == null }){
			alert("로그인 후 이용하시길 바랍니다.");
			location.href="/loginForm";
			return false;
		}
		
		if($("#reviewComment").val() == null || $("#reviewComment").val() == ""){
			alert("리뷰 내용을 입력해 주세요!");
			$("#reviewComment").focus();
			return false;
		}		
		
		

		var formData = $("form[name=reviewForm]").serialize() ;

		$.ajax({
			url:"/studycafe/review",
			type:"post",
			data:formData,
			success: function(){
				alert("리뷰등록이 완료되었습니다.");
				 location.href="/studycafe/reviewPage?studycafe_no="+${s.studycafe_no};
				 
            		
			}
		});
		
		
		
		return true;
	};


</script>

</head>
<body>
<c:import url="../common/header.jsp" />


	<div data-v-cafe="" class="container" >
	
	
	<article data-v-cafe="" >
	     <h1 data-v-cafe=""style="display: flex;">스윗미 ${s.studycafe_name } 
	     <p>&nbsp;&nbsp;</p>
	<div class="star-ratings" style="    font-style: initial;"	>
				<div    class="star-ratings-fill space-x-2 text-lg"   style=" width: calc( ${avg} * 20%)">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
				<div class="star-ratings-base space-x-2 text-lg">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
			</div>
			<p style="color: lightsalmon; margin-left:15px; margin-top:5px;font-weight: bolder;  font-family: fantasy;   font-size: 30px;   font-style: initial;">${avg} &nbsp; </p>
			<p  style="color: darkgray; margin-top:8px;   font-family: fantasy;   font-size: 25px;  font-style: initial;"> /&nbsp;5</p>
	     </h1>     
		
			<section data-v-cafe="" class="tab" style="top: 0px;">
			    <div data-v-cafe="" class="wrap">
				      <a data-v-cafe="" href="/studycafe/studycafeDetail?studycafe_no=${s.studycafe_no}"  id="detail" ><span data-v-cafe="" class="text" >상세보기</span></a>
				      <a data-v-cafe=""  href="" id="review" class="active"><span data-v-cafe="" class="text"  style="cursor: pointer;">리뷰보기</span></a>
			    </div>
			  </section>
			  
			<div data-v-cafe class="fixed"  >
			<c:choose>
			
			<c:when test="${member == null }">
				<a data-v-cafe="" class="myBtn"  style="vertical-align: -webkit-baseline-middle;" onclick="fn_loginCheck();">예약하기</a>
				</c:when>
			<c:otherwise>
				<a data-v-cafe="" class="myBtn"  style="vertical-align: -webkit-baseline-middle;" id="myBtn" >예약하기</a>
			</c:otherwise>
		</c:choose>
			</div>


	
			<form class='reviewForm' name='reviewForm' method='post' onsubmit='return fn_insertReview()'>
					 <div class='star-rating space-x-4 mx-auto'>
						<input type='radio' id='5-stars' name='review_grade' value='5' v-model='ratings'/>
							<label for='5-stars' class='star pr-4'>★</label>
						<input type='radio' id='4-stars' name='review_grade' value='4' v-model='ratings'/>
						<label for='4-stars' class='star'>★</label>
						<input type='radio' id='3-stars' name='review_grade' value='3' v-model='ratings'/>
							<label for='3-stars' class='star'>★</label>				
						<input type='radio' id='2-stars' name='review_grade' value='2' v-model='ratings'/>
						<label for='2-stars' class='star'>★</label>		
						<input type='radio' id='1-stars' name='review_grade' value='1' v-model='ratings'/>
						<label for='1-stars' class='star'>★</label>
					</div>			
					<div class='submit'>	<input type='submit'  style='margin-top: 10px ; cursor: pointer;' value='리뷰쓰기'></div>
					<p class='text'><textarea class='reviewComment' name='review_content' id='reviewComment' placeholder='리뷰를 작성해주세요.'></textarea></p>
					<input type='hidden'  name='studycafe_no' value='${s.studycafe_no}'>
					<input type='hidden' name='userno' id='userno' value='${member.userNo}'>
				</form>
				
									    			<p data-v-cafe="" class="text " style="font-size: 15px; text-align:center;      display: inline-block;    color: black;">	
	    			총 ${count} 개의 리뷰가 있습니다.
	    			</p>
				<hr style='background:#d6d6d6; height:1px;'>	

	
				      <div data-v-70332c88 class="list">
				       
	 <c:choose>
      	<c:when test="${fn:length(list) > 0}">
      	<c:forEach items="${list}" var="row">	         	       	 
      	<a data-v-70332c88  id="article" class="item"  style="border-bottom: inset;">
		
			<input type="hidden" id="idx" value="${row.review_no}">
			 <h2 data-v-70332c88>				<div class="star-ratings" style="    font-style: initial;"	>
							<div    class="star-ratings-fill space-x-2 text-lg"  style=" width: calc( ${row.review_grade} * 20%)">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
							<div class="star-ratings-base space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
						</div>
			</h2>
	         <h2 data-v-70332c88 style="    line-height: 5;    padding-inline-start: 20px;">${row.review_content}</h2>
	         <p data-v-70332c88 class="info" >
	         	 <span data-v-70332c88="">${row.nickname}</span>
	         	<span data-v-70332c88="">${row.review_date}</span>
	         	<span data-v-70332c88="" id="delete_${row.review_no}">			
	         <c:choose>			
	         	 <c:when test="${member.userNo == row.userno }">		
	         	<img id="delete_${row.review_no}" src="${pageContext.request.contextPath}/resources/images/delete.png" width="13px" height="13px" style="cursor: pointer;">		
	         	</span>
					</c:when>
								</c:choose>
          	</p>

         </a>
        </c:forEach>
      	 </c:when>
      
		<c:otherwise>

         </a>
					<a data-v-70332c88 class="item" >
      	 		        <h2 data-v-70332c88 >등록된 리뷰가 없습니다.</h2>
     			 	 </a>
		</c:otherwise>
      </c:choose>

      </div>
 
				
				
	     	<hr style="background:#d6d6d6; height:1px;">
	     	</div>
     	</article>
     </div>    	
     
<!-- The Modal -->

	<div id="myModal" class="modal"  >

<!-- Modal content -->

 <div class="modal-content" 
   style=" text-align: center;width: 50%;">
	<div class="container2" style="display: contents;" >
	<div id="image" style="
    width:50%;
    text-align: center;
    height: 380px;
    float: right;
    margin-top: 10px;
        display: table;
    
">
  <img src="${pageContext.request.contextPath}/resources/images/studycafe/sca.png" style="width: 450px; margin-top:20px;">
 </div>
	<form action="/book/studycafeBook" method="POST" style=" margin-left: 5%;" >
	<br>
<div style="   display: table-row-group;width: 40%;text-align: right;">
		<h2 style="
    margin-top: 20px;
"><b>예약정보를 입력해주세오</b></h2>
		<br>
		<input type="hidden" id="studycafe_name" name="studycafe_name" value="${s.studycafe_name }"  /> 
		<input type="hidden" id="studycafe_no" name="studycafe_no" value="${s.studycafe_no}"  /> 
		<!-- 예약자 회원 번호 -->
		<input type="hidden" id="booker_no" name="booker_no" value="${member.userNo}" />
		<h3>
		    <label for="studycafe_roomno">Room</label>
		    
		       <select id="studycafe_room" name="studycafe_room" size="1" >
		          <option value="main">방을 선택해주세요 ~.~ </option>
		          <c:forEach items="${files}" var="room">	
			          <option value="${room.stored_file_name}#${room.room_name}">${room.room_name}</option>
		          </c:forEach>
		       </select> 
		        <br>
		    <br>
		           
		         인원수 : <input type="text"  size="1" id="permit_limit" name="permit_limit" 
		       style="text-align: center; font-size:14pt; height:25px; "  
		       placeholder="0">명
		   
		</h3>
 	
        　
 <h3>예약 날짜  <input type="date" id="book_date" name="book_date" style="font-size:20px;	border: 1px solid #ccc;" >	</h3>

 <br>
 <br>
 
       
	<div id="bookTime">
	 <h3>
	     <label for="start_time" style="text-align: left;"> 예약시간</label>	
	      <select id="start_time"  name="start_time" size="1" style=" width: 100px;">
			  <option value="">시작시간</option>
			 </select> ~
		 		  <select id="end_time"  name="end_time" size="1" style=" width: 100px;">
			  <option value="">종료시간</option>	
		 </select> 	
	 	</h3>
	 </div>
	 
 </div>
 
 <div style="width: 300px;
    height: 20px;
    margin-top: 20px;
    text-align: right;">
 <h3><b>결제금액 : <span  id="pay1" style=" height: 30px;">0</span> 원</b></h3>
 <input type="hidden" id="pay" name="pay" value="">
</div>
 <div style="    display: table;
    position: relative;
    margin: 20px;">
     
<button type="submit" class="button3" style="text-align: center;    float: left;    font-size: 15px;    width: 100px;"> 예 약</button>
<button type="reset" class="button3"style="background-color: #777; width: 100px;    text-align: center;    height: 40px;    vertical-align: -webkit-baseline-middle;">
<span class="close" id="modal_close_btn" style="vertical-align: super;     width: 80px;	    font-size: 15px;    text-align: center">취 소</span></button>
</div>
</form>
	</div>
	
	</div>
	
</div>



</body>



</html>