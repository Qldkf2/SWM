<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<title>스터디카페 글쓰기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/studycafe_write.css">
</head>
<body>
<div class="my-box">
스터디카페글쓰기
</div>

<div class="content">
        <table class="post-table">
           <colgroup>
              <col width="20%">
              <col>
           </colgroup>
           <tbody>
              <tr>
                 <th scope="row">카페이름</th>
                 <td>
                    <input type="text" placeholder="카페명을 입력하세요" class="input-text"> <!-- 플레이스홀더 제목 작성 코드 -->
                 </td>
              </tr>
              <tr>
                 <th scope="row">주소</th>
                 <td>
                    <input type="text" placeholder="매장 주소를 입력해주세요." class="input-text">
                 </td>
              </tr>
              <tr>
                 <th scope="row">매장 연락처</th>
                 <td>
                    <input type="text" placeholder="매장 전화번호를 입력하세요.(복수 번호 사용시 / 로 구분)" class="input-text">
                 </td>
              </tr>
              <tr>
                 <th scope="row">매장 운영시간</th>
                 <td>
                    <select class="select-box time">
                       <option>= 오픈시간선택 =</option>
                       <option>00 : 00</option>
                       <option>00 : 30</option>         
                    </select>
                    <span> ~ </span>
                   <select class="select-box time">
                       <option>= 마감시간선택 =</option>
                       <option>00 : 00</option>
                       <option>00 : 30</option>
                    </select>
                </td>
             </tr>
             <tr>
                <th scope="row">카페 대표 이미지</th> <!-- 파일 이미지 업로드 / 미리보기 로직 -->
                 <td>
                    <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
 					<div id="image_container" class="div-imgpx"></div>
 					
 					<script> 
 						function setThumbnail(event) { 
 							var reader = new FileReader();
 						
 							reader.onload = function(event) { 
 								var img = document.createElement("img"); 
 								img.setAttribute("src", event.target.result); 
 								var container = document.getElementById("image_container");
 								
 								while(container.hasChildNodes()){
 								    container.removeChild(container.firstChild);
 								}
 								
 								document.querySelector("div#image_container").appendChild(img); 
 							};
 								
 							reader.readAsDataURL(event.target.files[0]); 
 						}
 					</script>
                 </td>
              </tr>
              <tr>
                <th scope="row">룸 정보</th>
                 <td style="padding:10px">
                    <div style="text-align:right">
                       <button type="button" class="basic-btn add">추가</button>
                    </div>
                    <div class="room-info">
                       <ul>
                          <li>
                             <input type="text" placeholder="룸 이용가능 인원 수" class="input-text CafeRoom">
                             <input type="text" placeholder="룸 개수" class="input-text RoomStrength">
                             <button type="button" class="basic-btn del">삭제</button>
                          </li>
                          <li>
                             <input type="text" placeholder="룸 이용가능 인원 수" class="input-text CafeRoom">
                             <input type="text" placeholder="룸 개수" class="input-text RoomStrength">
                             <button type="button" class="basic-btn del">삭제</button>
                          </li>
                       </ul>
                    </div>
                 </td>
              </tr>
              <tr>
                 <th scope="row" colspan="2">카페 소개</th>
              </tr>
              <tr>
                 <td colspan="2">
                    <textarea class="textarea intro"></textarea>
                 </td>
              </tr>
           </tbody>
        </table>
        <div class="btn-wrap">
            <ul>
                <li>
                    <a href="#">작성하기</a>
                </li>
                <li>
                    <a href="#">돌아가기</a>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>