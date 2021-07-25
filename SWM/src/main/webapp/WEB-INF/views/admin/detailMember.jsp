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
        <caption class="my-box">회원정보</caption>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
        

  
        <tbody>
        

	            <tr>
	                <th>회원번호</th>
	            <td>-------------------</td>
	                <th>아이디</th>
	                <td>-------------------</td>
	            </tr>
	            <tr>
	                <th>이름</th>
	                <td>-------------------</td>
	                <th>닉네임</th>
	                <td>-------------------</td>
	            </tr>
	            <tr>
	                <th>주민번호</th>
	                <td>-------------------</td>
	                <th>비밀번호</th>
	                <td>-------------------</td>
	            </tr>
	            <tr>
	                <th>전화번호</th>
	       			<td>-------------------</td>
	       			<th>탈퇴여부</th>
	       			<td>-------------------</td>
	           </tr>

        </tbody>

    </table>
    <br/>
    
    
 <!--     <a href="#this" id="modify" class="btn" type="submit">회원수정</a> -->   
    
    <a href="#this" id="list" class="btn" >회원목록</a>
    <input class="submit" type="submit" value="회원수정">
    <a href="#this" id="delete" class="btn">회원삭제</a>


 
 
 
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