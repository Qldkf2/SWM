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

			
			$("#studycafe_room").on("change", function(e){
				var v= this.value;
				
				var roomImage = v.split("#");
				var roomName= $("#studycafe_room option:selected").text();
				
				if(roomImage != "main"){
					$("#image").html("<img src='${pageContext.request.contextPath}/resources/files/studycafe/"+roomImage[0]+"' style='width:400px;height: 330px; margin-top:20px;''>");
				}
				else{
					$("#image").html("<img src='${pageContext.request.contextPath}/resources/images/studycafe/sca.png' style='width:400px;height: 330px; margin-top:20px;'>");
					
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



</script>

</head>
<body>
<c:import url="../common/header.jsp" />


	<div data-v-cafe="" class="container" >
	
	
	<article data-v-cafe="" >
	     <h1 data-v-cafe=""style="display: flex;">스윗미 ${s.studycafe_name } 
	     <p>&nbsp;&nbsp;</p>
	<div class="star-ratings" style="    font-style: initial;"	>
				<div    class="star-ratings-fill space-x-2 text-lg"  style=" width: calc( ${avg} * 20%)">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
				<div class="star-ratings-base space-x-2 text-lg">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</div>
			</div>
			<p style="color: lightsalmon; margin-left:15px; margin-top:5px;font-weight: bolder;  font-family: fantasy;   font-size: 30px;   font-style: initial;">${avg}&nbsp; </p>
			<p  style="color: darkgray; margin-top:8px;   font-family: fantasy;   font-size: 25px;  font-style: initial;"> /&nbsp;5</p>
	     </h1>     
		
			<section data-v-cafe="" class="tab" style="top: 0px;">
			    <div data-v-cafe="" class="wrap">
				      <a data-v-cafe="" href=""  id="detail" class="active"><span data-v-cafe="" class="text" >상세보기</span></a>
				      <a data-v-cafe=""  href="/studycafe/reviewPage?studycafe_no=${s.studycafe_no}"  id="review"><span data-v-cafe="" class="text"  style="cursor: pointer;">리뷰보기</span></a>
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

<div id="area">
				<div data-v-cafe="" class="about">	     	  
		  		<h3 data-v-cafe="">주소</h3>  
		  		<p data-v-cafe="" class="indent"> ${s.studycafe_address}  </p> 
		  			<div id="map" style="width:80%;height:350px;     margin-left: 102px;margin-bottom: 20px; "></div>
		  		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4dc9cc42adb9e803518ca1082d9be9f6&libraries=services"></script>
		     
		     

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
//주소로 좌표를 검색합니다
var geocoder = new kakao.maps.services.Geocoder();

geocoder.addressSearch('${s.studycafe_address}' , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시합니다
       var marker = new kakao.maps.Marker({
           map: map,
           position: coords
       });

      
       // 인포윈도우로 장소에 대한 설명을 표시합니다
       var infowindow = new kakao.maps.InfoWindow({
           content: '<div data-v-cafe="" style="width:150px;text-align:center;font-size:13px;padding:6px 0; font-weight:600;">스윗미 ${s.studycafe_name }</div>'
       });
       infowindow.open(map, marker);

       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       map.setCenter(coords);
   } 
});    
	
</script>
		     
		     	<h3 data-v-cafe="">영업시간</h3>  <p data-v-cafe="" class="indent">  ${s.studycafe_open} : 00 ~ ${s.studycafe_end} : 00 </p> 
				<h3 data-v-cafe="">룸수</h3>  <p data-v-cafe="" class="indent"> 5개 호실 & 1인용 자리</p> 
				  <hr style="background:#d6d6d6; margin-top:15px; height:1px;">
				  
				</div>
	    			<p data-v-cafe="" class="text " style="font-size: 15px; text-align:center;
      display: inline-block;    color: black;">
	    				1. 친절한 직원이 관리합니다. </br>
						2. 학습 유형에 따라 공부가 가장 잘되는 환경을 제공합니다.<br>
						3. 스스로 공부할 수 있는 분위기를 제공합니다.<br>
						4. 공부하기에 적합한 환경(온도, 서비스)을 제공합니다.<br>
						5. 입/퇴실시 문자메세지 발송 서비스를 제공합니다.<br>
						6. 잠이 들면 깨워드리는 서비스를 제공합니다.<br><br><br>
						
	    			 <img src="${pageContext.request.contextPath}/resources/images/studycafe/service.jpg" style="width: 950px;margin-top:20px;">
	    			 
	    			<c:forEach items="${files}" var="file" varStatus="status">
	    			 <img src="${pageContext.request.contextPath}/resources/files/studycafe/${file.stored_file_name}" style="width: 950px;margin-top:20px;">
	    			 	<p data-v-cafe="" class="text" style="height:50px;">${file.room_name}↑</p>
	    			</c:forEach>
					
					</p>
				
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
  <img src="${pageContext.request.contextPath}/resources/images/studycafe/sca.png" style="width: 400px; height:300px; margin-top:20px;">
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