<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_orderConfirm.css" />
</head>
<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
			<div id="orderConfirm">
				<h1>주문이 완료되었습니다.</h1>
				
				<div class="btnArea">
												<!-- param값 받아오면 1 지우기 -->
					<button id="goDetail" data-link="${param.goodsCode}">상품페이지</button>
					<button onclick="location.href='/'">메인페이지</button>
				</div>
			</div>
		</div>
		
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_orderConfirm.js"></script>
	
</body>
</html>