<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_template.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/info_list.css">

</head>
<body>
 
    <%
        String select = request.getParameter("pageChange");
 
        if (select == null) {
            select = "member_info.jsp";
        }
    %>
 
 <c:import url="../common/header.jsp"></c:import>
<div class="wrap">

      <div class="content">
         <div class="left-con">
            <jsp:include page="info_list.jsp" flush="false" />
         </div>
         <div class="right-con">
            <jsp:include page="<%=select%>" flush="false" />
         </div>
      </div>
      <!-- footer -->
      <!--<jsp:include page="bottom.jsp" flush="false" />-->
   </div>
</body>
</html>
