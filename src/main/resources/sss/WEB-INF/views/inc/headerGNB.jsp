<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="/style/style_GNB.css" />
<body>
	
	<div id="headerGNBPage">
		
		<div id="topGNB"  class="dFlex gnbs">
			<nav class="topGnb">
				<ul id="topUl" class="dFlex">
					<c:if test="${unameSession==null }">
						<c:if test="${empty	pageContext.request.userPrincipal}">
							<li><a href="loginPage">LOGIN</a></li>
							<li class="devide">|</li>
							<li><a href="joinAgreement">JOIN</a></li>
						</c:if>
					</c:if>
					<c:if test="${unameSession != null}">
						
						<li><a href="mypage">MYPAGE</a></li>
						<li class="devide">|</li>
						<li><a href="/cart">CART</a></li>
						<li class="devide">|</li>
						<li><a href="/orderList?uid=${uidSession}">ORDER</a></li>
						<li class="devide">|</li>
						<li><a href="logout">LOGOUT</a></li>
					</c:if>
					
					<c:if test="${not empty	pageContext.request.userPrincipal}">
					
					<li><a href="userList">회원관리</a></li>
					<li class="devide">|</li>
					<li><a href="goodsRegList">상품재고</a></li>
					<li class="devide">|</li>
					<li><a href="adminOrderList">주문관리</a></li>
					<li class="devide">|</li>
					<li><a href="adminlogout">LOGOUT</a></li>
					</c:if>
					
					<li class="devide">|</li>
					<li class="slideCommu">
						COMMUNITY
						<ul class="commuUl">
							<li><a href="/qna">Q&amp;A</a></li>
							<li>FAQ</li>
							<li>공지사항</li>
							<li>포토리뷰</li>
						</ul>
					</li>
					<li class="devide">|</li>
					<li class="goSite">사이트맵</li>
					
					<c:if test="${not empty	pageContext.request.userPrincipal}">
					<li>
						${pageContext.request.userPrincipal.name} 접속중
					</li>
					</c:if>
				</ul>
			</nav>
		</div>
		
		<div id="bottomGNB"  class="dFlex gnbs">

			<div id="logoArea">
				<img id="mainLogo" onclick="location.href='/'" src="<spring:url value='images/MainLogo.png'/>" alt="메인로고" />
			</div>

			<div id="gnbArea">
				<nav id="headerGNB">
					<form>
					</form>
					<ul id="headerUl" class="dFlex">
						<li class="headerLi"><a href="categoryDetail?goodsCategory=BEST">BEST</a></li>
						<li class="headerLi"><a href="categoryDetail?goodsCategory=NEW">NEW</a></li>
						<li class="headerLi">
							<a href="categoryDetail?goodsCategory=TOP">TOP</a>
							<ul class="downGnb">
								<li><a href="categoryDetail?goodsCategory=맨투맨">맨투맨</a></li>
								<li><a href="categoryDetail?goodsCategory=후드티">후드티</a></li>
								<li> <a href="categoryDetail?goodsCategory=니트">니트</a></li>
								<li> <a href="categoryDetail?goodsCategory=긴팔티">긴팔티</a></li>
								<li><a href="categoryDetail?goodsCategory=반팔티">반팔티</a></li>
							</ul>
						</li>
						<li class="headerLi">
							<!--  -->
							 <a href="categoryDetail?goodsCategory=SHIRTS" >SHIRTS</a>
							<ul class="downGnb">
								<li><a href="categoryDetail?goodsCategory=베이직">베이직</a></li>
								<li><a href="categoryDetail?goodsCategory=청남방">청남방</a></li>
								<li><a href="categoryDetail?goodsCategory=체크/패턴">체크/패턴</a></li>
								<li><a href="categoryDetail?goodsCategory=헨리넥">헨리넥</a></li>
							</ul>
						</li>
						<li class="headerLi">
							<a href="categoryDetail?goodsCategory=PANTS">PANTS</a>
							<ul class="downGnb">
								<li><a href="categoryDetail?goodsCategory=청바지">청바지</a></li>
								<li><a href="categoryDetail?goodsCategory=면바지">면바지</a></li>
								<li><a href="categoryDetail?goodsCategory=반바지">반바지</a></li>
								<li><a href="categoryDetail?goodsCategory=슬랙스">슬랙스</a></li>
							</ul>
						</li>
						<li class="headerLi">
							<a href="categoryDetail?goodsCategory=OUTER">OUTER</a>
							<ul class="downGnb">
								<li><a href="categoryDetail?goodsCategory=패딩">패딩</a></li>
								<li><a href="categoryDetail?goodsCategory=코트">코트</a></li>
								<li><a href="categoryDetail?goodsCategory=자켓">자켓</a></li>
								<li><a href="categoryDetail?goodsCategory=가디건">가디건</a></li>
								<li><a href="categoryDetail?goodsCategory=조끼">조끼</a></li>
							</ul>
						</li>
						<li class="headerLi">
							<a href="categoryDetail?goodsCategory=ETC">ETC</a>
							<ul class="downGnb">
								<li><a href="categoryDetail?goodsCategory=신발">신발</a></li>
								<li><a href="categoryDetail?goodsCategory=가방">가방</a></li>
							</ul>
						</li>
						<li class="headerLi">
							<a href="categoryDetail?goodsCategory=ACC">ACC</a>
							<ul class="downGnb">
								<li><a href="categoryDetail?goodsCategory=양말">양말</a></li>
								<li><a href="categoryDetail?goodsCategory=모자">모자</a></li>
								<li><a href="categoryDetail?goodsCategory=장갑">장갑</a></li>
								<li><a href="categoryDetail?goodsCategory=안결">안경</a></li>
							</ul>
						</li>
						<li class="headerLi"><a href="categoryDetail?goodsCategory=SALE">SALE</a></li>
					</ul>

				</nav>

			</div>

			<div id="gnbSearchArea" class="dFlex">
				<input type="text">
				<img src="<spring:url value='images/srcIcon.png'/>" alt="돋보기" />
			</div>

		</div>
		
		
	</div>
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_GNB.js"></script>
	
</body> 