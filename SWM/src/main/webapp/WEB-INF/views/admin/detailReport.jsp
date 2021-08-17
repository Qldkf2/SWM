<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>상세보기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/common_admin.css">
<c:import url="../common/header.jsp" />
</head>
<body>
    <table class="board_view">
        <caption class="my-box" >신고회원정보</caption>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>회원번호</th>
                <td>회원번호</td>
                <th>신고자</th>
                <td>신고자</td>
            </tr>
            <tr>
                <th>이름</th>
                <td>이름</td>
                <th>닉네임</th>
                <td>닉네임</td>
            </tr>
            <tr>
                <th>신고날짜</th>
                <td colspan="3">신고날짜</td>
            </tr>
            <tr style="height:300px;">
                <th>신고사유</th>
                <td colspan="3">신고사유</td>
           </tr>
        </tbody>

    </table>
    <br/>
    <a href="#this" id="status" class="btn" >회원탈퇴</a>
    <a href="#this" id="back" class="btn">봐주기</a>
     
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click",function(e){
                e.preventDefault();
                fn_openBoardList();
            })
            $("#modify").on("click",function(e){
                e.preventDefault();
                fn_openBoardModify();
            })
        })
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
            comSubmit.submit();
        }
        function fn_openBoardModify(){
            var idx = "${map.IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardModify.do'/>");
            comSubmit.addParam("IDX",idx);
            comSubmit.submit();
        }
    </script> 
</body>
</html>