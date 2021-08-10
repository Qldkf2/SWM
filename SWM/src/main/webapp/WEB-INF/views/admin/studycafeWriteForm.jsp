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
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
	<div class="my-box">스터디카페글쓰기</div>

	<div class="content">
		<form method="POST"  action="/admin/studycafeWrite" enctype="multipart/form-data">
			<table class="post-table">
				<colgroup>
					<col width="20%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">카페이름</th>
						<td><input type="text" name="studycafe_name" placeholder="카페명을 입력하세요" class="input-text"> <!-- 플레이스홀더 제목 작성 코드 --></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td>
						 <input type="text" name="studycafe_address" placeholder="주소를 입력해주세요" class="input-text"> 
						</td>
					</tr>
					<tr>
						<th scope="row">매장 연락처</th>
						<td><input type="text" name="studycafe_phone" placeholder="매장 전화번호를 입력하세요." class="input-text"></td>
					</tr>
					<tr>
						<th scope="row">매장 운영시간</th>
						<td><select name="studycafe_open" class="select-box time">
								<option>= 오픈시간선택 =</option>
								<option>09 : 00</option>
								<option>16 : 00</option>
						</select> <span> ~ </span>
						<select name="studycafe_end" class="select-box time">
								<option>= 마감시간선택 =</option>
								<option>22 : 00</option>
								<option>05 : 00</option>
						</select></td>
					</tr>
					<tr>
						<th scope="row">룸 정보</th>
						<td style="padding: 10px">
							<div class="room-info">
								<ul>
									<li>
										<input type="file" id="image" name="file1" />
									</li>
									<li>	
										<input type="file" id="image" name="file2" />
									</li>
									<li>
										<input type="file" id="image" name="file3" />
									</li>
									<li>	
										<input type="file" id="image" name="file4" />
									</li>
									<li>
										<input type="file" id="image" name="file5" />
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
</body>
</html>
