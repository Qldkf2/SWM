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
        <caption >스터디룸 예약정보</caption>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>스터디룸</th>
                <td>스터디룸 이름</td>
                <th>아이디</th>
                <td>아이디</td>
            </tr>
            <tr>
                <th>주소</th>
                <td>주소</td>
                <th>상세주소</th>
                <td>상세주소</td>
            </tr>
            <tr>
                <th>예약인원</th>
                <td>3인 </td>
                <th>전화번호</th>
                <td>전화번호</td>
           </tr>
            <tr>
                <th>이름</th>
                 <td>이름</td>
                 <th>닉네임</th>
                 <td>닉네임</td>
                 
                <td></td>
            </tr>
            <tr>
                <th>예약일자</th>
                <td>21/08/02</td>
                <th>예약시간</th>
                <td>11:00 ~ 15:00</td>
            </tr>
        </tbody>

    </table>
    <br/>
    <a href="#this" id="list" class="btn" >목록으로</a>
    <a href="#this" id="drop" class="btn">예약취소</a>
     
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