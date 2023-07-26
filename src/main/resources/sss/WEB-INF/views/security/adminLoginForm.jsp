<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자로그인</title>
<link rel="stylesheet" href="/style/style_Security.css" />
</head>
<body>

	<div id="wrap">
		<h1>관리자 로그인</h1>
		<hr>
		
		<c:if test="${param.error != null}">
			<h3>Login Error!</h3>
			<p>${err_Msg}</p>
		</c:if>

		<form id="secu" action="<c:url value="security_url_check"/>" method="post">
			<span>ID</span> <input type="text" name="sec_username"> <span>PW</span>
			<input type="text" name="sec_password">
		</form>
		<div id="btnArea">
			<button form="secu">LOGIN</button>
			<button onclick="location.href='/'">메인페이지</button>
		</div>
	</div>
	<!--	div#wrap	-->

	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>

</body>
</html>