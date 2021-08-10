<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<%
String currentSubject =(String)session.getAttribute("currentSubject");



%>
<script type="text/javascript">


	function fn_subject(clickSubject){
		//location.href ="/meeting?subject="+clickSubject;
		location.replace("/meeting?subject="+clickSubject) ;
	}



</script>
</head>


<body>
   
	<section class="tab">
	<div class="wrap">
     <a href="javascript:;"  onclick="fn_subject(this.id);" id="all" <%if(currentSubject.equals("all")){%> class="active"<%} %>><span class="text">전체</span></a>
      <a href="javascript:;" onclick="fn_subject(this.id);" id="language" <%if(currentSubject.equals("language")){%> class="active"<%} %>><span class="text">어학</span></a>
      <a href="javascript:;" onclick="fn_subject(this.id);" id="employment" <%if(currentSubject.equals("employment")){%> class="active"<%} %>><span class="text">취업</span></a>
      <a href="javascript:;" onclick="fn_subject(this.id);" id="official" <%if(currentSubject.equals("official")){%> class="active"<%} %>><span class="text">고시/공무원</span></a>
      <a href="javascript:;" onclick="fn_subject(this.id);" id="hobby" <%if(currentSubject.equals("hobby")){%> class="active"<%} %>><span class="text">취미/교양</span></a>
      <a href="javascript:;" onclick="fn_subject(this.id);" id="programming" <%if(currentSubject.equals("programming")){%> class="active"<%} %>><span class="text">프로그래밍</span></a>
      <a href="javascript:;" onclick="fn_subject(this.id);" id="etc" <%if(currentSubject.equals("etc")){%> class="active"<%} %>><span class="text">기타</span></a>
	</div>
	</section>

</body>
</html>