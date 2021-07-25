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
</head>
<body>
    <table class="board_view">
        <caption class="my-box">스터디</caption>
        <colgroup>
            <col width="20%">
            <col width="35%">
            <col width="20%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>모임장 회원번호</th>
                <td>회원번호</td>
                <th>게시글 제목</th>
                <td><a href="#">제목</a></td>
            </tr>
            <tr>
                <th>지역</th>
                <td>지역</td>
                <th>과목</th>
                <td>과목</td>
            </tr>
            <tr>
                <th>모집인원</th>
                <td colspan="3">인원</td>
            </tr>
            <tr style="height:300px;">
                <th>게시글 내용</th>
                <td colspan="3">내용</td>
           </tr>
        </tbody>

    </table>
    <br/>
        <a href="#this" id="list" class="btn" >목록</a>
    <a href="#this" id="drop" class="btn" >삭제</a>
     
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