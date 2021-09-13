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
<script type="text/javascript">


var first="all";
window.onload = function() {		
		$("a[id ^= loc]").on("click",function(e){
			
			 var eventLoc = event.target.parentNode.id;   
			 var returnLoc = eventLoc.substring(4);

			if(eventLoc!="" && first!=""){
				if(returnLoc=="all"){
					returnLoc="서울";
				}
				if(first=="all"){
					$("#loc_all").removeAttr("class");
					$("#"+eventLoc).attr("class","active");
					first=eventLoc;

				}
				else if(first==returnLoc){
	
				}			
				else{
					
					$("#"+first).removeAttr("class");
					$("#"+eventLoc).attr("class","active");

					first=eventLoc;
				}
			
			
			
			$.ajax({
				url:"/studycafe/search",
				type:"post",
				data:{keyword:returnLoc},
				success: function(data){
					var str="<h2>"+returnLoc+" (으)로 조회한 결과입니다.</h2>";
					
					if(data.length > 0){
						for(var i in data){
	
							str += "	 <a class='item' href='/studycafe/studycafeDetail?studycafe_no="+data[i].studycafe_no+"' style='display: inline-grid;'>"
							  +"<div  class='jb-wrap'>"		  
							  +" <div class='jb-image'>"
					          +"<img src='${pageContext.request.contextPath}/resources/images/studycafe/sca.png' style='width: 200px; height: 200px;'/>"
					          +"<span class='jb-text2'>스윗미 스터디카페</span>"
					          +"<span class='jb-text'>"+data[i].studycafe_name+"</span> </div> </div>"
					          +"<h3>"+data[i].studycafe_address+"</h3>"
					          +"<p class='info' style='margin-left:1px;'>"
					          +"<span class='dday' >오픈시간 :</span>"
					          +"<span class='dday'>["+data[i].studycafe_open+" 시 ~ "+data[i].studycafe_end+" 시]</span>"
					          + "</p> </a> ";
							
						}
						$("#cafe").html(str);
					}
					else{
						str="<h2>"+returnLoc+" (으)로 조회한 결과가 존재하지 않습니다.</h2>";
						$("#cafe").html(str);
					}
					
					
				}
				
			});
			
			 }
			
			
			
		});
		
	
}
</script>




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
  <section class="loc" style="top: 0px; cursor:pointer; transform: none;">
    <div class="wrap" >

     <a  class="active" id="loc_all">  <span class="text">전체</span>   </a>
    <a id="loc_종로"> <span class="text">종로구</span> </a>
    <a id	="loc_마포"> <span class="text">마포구</span> </a>
    <a id="loc_영등포"> <span class="text">영등포구</span> </a>
    <a id="loc_강남"> <span class="text">강남구</span> </a>    
    <a id="loc_강서"> <span class="text">강서구</span> </a>
    <a id="loc_은평"> <span class="text">은평구</span> </a>
    <a id="loc_금천"> <span class="text">금천구</span> </a>
    <a id="loc_용산"> <span class="text">용산구</span> </a>
    <a id="loc_노원"> <span class="text">노원구</span> </a>

    
    </div>
  </section>
  
  
  
  <div id="container" data-target="1" style="padding-top: 0px;">
	  <div class="horizontal" id="cafe">
	  <h2>인기급 상승!</h2>
	<c:forEach  items="${bestStudycafeList}" var="best">
	 <a class="item" href="/studycafe/studycafeDetail?studycafe_no=${best.studycafe_no}" style="display: inline-grid;">
	 <div  class="jb-wrap">
           <div class="jb-image">
           <img src="${pageContext.request.contextPath}/resources/images/studycafe/sca.png" style="width: 200px; height: 200px;"/>
           	<span class="jb-text2">스윗미 스터디카페</span>
            <span class="jb-text">${best.studycafe_name}</span>
        </div>
    </div>
           <h3>${best.studycafe_address}</h3>
           <p class="info" style="margin-left:1px;">
           <span class="dday" >오픈시간 :</span>
              <span class="dday">[${best.studycafe_open} 시 ~ ${best.studycafe_end} 시]</span>
           </p>
        </a>
	</c:forEach>
</div>
<div class="ad" style="background-color: rgb(242, 242, 242);"></div>

<div class="horizontal">
<h2>신규 오픈!</h2>
	<c:forEach  items="${newStudycafeList}" var="newList">
	 <a class="item" href="/studycafe/studycafeDetail?studycafe_no=${newList.studycafe_no}" style="display: inline-grid;">
	 <div class="jb-wrap">
           <div class="jb-image">
           <img src="${pageContext.request.contextPath}/resources/images/studycafe/sca.png" style="width: 200px; height: 200px;"/>
           	<span class="jb-text2">스윗미 스터디카페</span>
            <span class="jb-text">${newList.studycafe_name}</span>
        </div>
    </div>
           <h3>${newList.studycafe_address}</h3>
           <p class="info" style="margin-left:1px;">
           <span class="dday">오픈시간 :</span>
              <span class="dday">[${newList.studycafe_open} 시 ~ ${newList.studycafe_end} 시]</span>
           </p>
        </a>
	</c:forEach>
</div>
<div class="horizontal">
	<img src="${pageContext.request.contextPath}/resources/images/studycafe/hongbo1.PNG" style="width: 100%;">
</div>

</body>
</html>