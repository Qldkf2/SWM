<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
		<header class="root">
			<div class="wrap">
				<a href="/" class="logo"></a>
				<div class="account">
					<a href="/loginForm" class="blue">�α���</a>
					<a href="/sign_up" class="white">ȸ������</a>
				</div>
				<nav>
					<a href="/" class="active">Ȩ</a>
					<a href="${pageContext.request.contextPath}/meeting" class="">���͵� ����</a>
					<a href="/studycafeList" class="">���͵� ī�� ����</a>
					<a href="/community" class="">Ŀ�´�Ƽ</a>
					<a href="/activity" class="">����</a>
					
				</nav>
<!-- 				<p class="description">
					���͵� �� �� ����<br>��̰� ������ ���͵� �����غ�����.
				</p> -->
				<div class="buttons"></div>
			</div>
		</header>
</body>
</html>