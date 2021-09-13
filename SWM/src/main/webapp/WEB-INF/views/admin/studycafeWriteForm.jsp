<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>스터디카페 글쓰기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_write.css">
<script type="text/javascript">

	function fn_check(){
		if($("#studycafe_name").val() == null || $("#studycafe_name").val() == ""){
			alert("카페명을 입력해 주세요!");
			$("#studycafe_name").focus();
			return false;
		}
		
		
		
		if($("#studycafe_address").val() == null || $("#studycafe_address").val() == ""){
			alert("주소를 입력해 주세요!");
			$("#studycafe_address").focus();
			return false;
		}		
		
		if($("#studycafe_phone").val() == null || $("#studycafe_phone").val() == ""){
			alert("전화번호를 입력해 주세요!");
			$("#studycafe_phone").focus();
			return false;
		}		
		
		if($("#studycafe_open").val() == null || $("#studycafe_open").val() == ""){
			alert("카페 오픈시간을 입력해 주세요!");
			$("#studycafe_open").focus();
			return false;
		}		
		
		if($("#studycafe_close").val() == null || $("#studycafe_close").val() == ""){
			alert("카페 마감시간을 입력해 주세요!");
			$("#studycafe_close").focus();
			return false;
		}		
		
			
		if($("input[id ^= 'room_name']").val() == null || $("input[id ^= 'room_name']").val() == ""){
				alert("룸이름을 입력해 주세요!");

				return false;
			}		

			
		if($("input[id ^= 'file']").val() == null || $("input[id ^= 'file']").val() == ""){
			alert("룸사진을 입력해 주세요!");
			return false;
		}		
			
		
		
		return true;
	}
	
</script>

</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
	<div class="my-box">스터디카페글쓰기</div>

	<div class="content">
		<form method="POST"  action="/admin/studycafeWrite" enctype="multipart/form-data" onsubmit="return fn_check()";>
			<table class="post-table">
				<colgroup>
					<col width="20%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">카페이름</th>
						<td><input type="text" id="studycafe_name"name="studycafe_name" placeholder="카페명을 입력하세요" class="input-text"> <!-- 플레이스홀더 제목 작성 코드 --></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td>
						 <input type="text" id="studycafe_address" name="studycafe_address" placeholder="주소를 입력해주세요" class="input-text"> 
						</td>
					</tr>
					<tr>
						<th scope="row">매장 연락처</th>
						<td><input type="text" id="studycafe_phone" name="studycafe_phone" placeholder="매장 전화번호를 입력하세요." class="input-text"></td>
					</tr>
					<tr>
						<th scope="row">매장 운영시간</th>
						<td><select id="studycafe_open" name="studycafe_open" class="select-box time">
							  <option value="">오픈시간</option>
							  <option value="09" >09:00</option>
							  <option value="10">10:00</option>
							  <option value="11">11:00</option>
							  <option value="12">12:00</option>
							  <option value="13">13:00</option>
						      <option value="14">14:00</option>
							  <option value="15">15:00</option>
							  <option value="16">16:00</option>
							  <option value="17">17:00</option>
							  <option value="18">18:00</option>
							  <option value="19">19:00</option>
							  <option value="20">20:00</option>
							  <option value="21">21:00</option>
						</select> <span> ~ </span>
						<select id="studycafe_close" name="studycafe_end" class="select-box time">
							  <option value="">마감시간</option>
							  <option value="10">10:00</option>
							  <option value="11">11:00</option>
							  <option value="12">12:00</option>
							  <option value="13">13:00</option>
						      <option value="14">14:00</option>
							  <option value="15">15:00</option>
							  <option value="16">16:00</option>
							  <option value="17">17:00</option>
							  <option value="18">18:00</option>
							  <option value="19">19:00</option>
							  <option value="20">20:00</option>
							  <option value="21">21:00</option>
							  <option value="22">22:00</option>
						</select></td>
					</tr>
					<tr >
						<th scope="row" >룸 정보<br><br><input type="button"  id="addRoom" value="추가"	></th>
						<td style="padding: 10px">
							<div class="room-info">
								<ul id="room">
									<li>
										<input type="text" id="room_name" name="room_name" placeholder="룸이름을 입력하세요.">
										<input type="file" id="file" name="file" />
									</li>

								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" colspan="2">카페 소개</th>
					</tr>
					<tr>
						<td colspan="2"><textarea name="studycafe_content" class="textarea intro">
						1. 친절한 직원이 관리합니다.
						2. 학습 유형에 따라 공부가 가장 잘되는 환경을 제공합니다.
						3. 스스로 공부할 수 있는 분위기를 제공합니다.
						4. 공부하기에 적합한 환경(온도, 서비스)을 제공합니다.
						5. 입/퇴실시 문자메세지 발송 서비스를 제공합니다.
						6. 잠이 들면 깨워드리는 서비스를 제공합니다.
						</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btn-wrap">
				<ul>
					<li><input type="submit" value="작성하기"></li>
					<li><a href="#">돌아가기</a></li>
				</ul>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		var count=2;
		
		$(document).ready(function(){
			$("#addRoom").on("click", function(e){
				e.preventDefault();
				fn_addRoom();
				
			});
		});
		

		
		function fn_addRoom(){
			if(count==6){
				alert("룸은 5개까지 등록 가능합니다.");
			 	$("#addRoom").attr("disabled", true);
			}else{
				var str="<li> 	<input type='text' id='room_name'  name='room_name' placeholder='룸이름을 입력하세요.'> "
							+"<input type='file' id='file' name='file_"+(count)+"' /></li>";
				$("#room").append(str);
				count++;
			}

		}
		
	</script>
</body>
</html>
