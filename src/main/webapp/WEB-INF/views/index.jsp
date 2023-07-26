<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_index.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
</head>

<body>
	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>
			<div id="mainPage">
				<main id="main">
					<div id="sildeArea">
						<div id="slideImgs" class="slide_div">
							<div>
								<img id="SlideImg1" src="/images/index/SlideImg1.jpg" alt="SlideImg1">
							</div>
							<div>
								<img id="SlideImg2" src="/images/index/SlideImg2.jpg" alt="SlideImg2">
							</div> 
							<div>
								<img id="SlideImg3" src="/images/index/SlideImg3.jpg" alt="SlideImg3">
							</div>
							<div>
								<img id="SlideImg4" src="/images/index/SlideImg4.jpg" alt="SlideImg4">
							</div>
							<div>
								<img id="SlideImg5" src="/images/index/SlideImg5.jpg" alt="SlideImg5">
							</div>
							<div>
								<img id="SlideImg6" src="/images/index/SlideImg6.jpg" alt="SlideImg6">
							</div>
							<div>
								<img id="SlideImg7" src="/images/index/SlideImg7.jpg" alt="SlideImg7">
							</div>
							<div>
								<img id="SlideImg8" src="/images/index/SlideImg8.jpg" alt="SlideImg8">
							</div>
						</div>
						<!-- div#slideImgs -->
					</div>
					<div id="dailyBestArea">
						<h1>TODAY BEST</h1>
			
						<form action="/productDetail">
						<div id="TodayBestArea" class="slide_div2">

								<c:forEach begin="0" end="5" step="1"  var="i" items="${goodsInfo}" >
								<c:set var="disRate" value="${i.goodsDiscount/100}" />
								<fmt:formatNumber var="discountRate" value="${disRate}" type="percent" pattern="0%" />

								<div class="TodayBestImgArea">
									<div class="TodayBestImg dFlex">
										<!-- num 값으로 데이터 전송  -->
										<a href="/productDetail?goodsCode=${i.goodsCode}"><img src="/uploadDir/${i.filename}" alt=""></a>
									</div>
									
									<!-- div.TodayBestImg -->
									<div class="TodayBestStatus dFlex">
										<div class="colorOption">
											<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
										</div>
										<!-- div.colorStatus -->
										<div class="reviewCnt">
											리뷰 : <span>50</span>
										</div>
										<!-- div.reviewCnt -->
									</div>
									
									<!-- div.TodayBestStatus -->
									<div class="goods-Thumb-Info">
										<a href="#" class="goodsName">${i.goodsName}</a> <br>
										<a href="#" class="goodsSize">M~2XL(95~115)</a>

										<p class="goodsDescript">
											<!-- [세가지 타입의 기장 선택] -->
										</p>
										
									<c:if test="${discountRate != '0%'}">
										<p class="goodsPrice-thumb">
									<fmt:formatNumber var="goodsPrice" value="${i.goodsPrice}" pattern="#,###" />
										<del>${goodsPrice}</del>원 <br>
										<fmt:formatNumber var="disPrice" value="${i.goodsPrice - (i.goodsPrice * disRate)}" pattern="#,###" />
										${disPrice} 원
										<span data-link="${i.goodsDiscount}">
												${discountRate}
										</span>
										
										</p>
									</c:if>
									<c:if test="${discountRate == '0%'}"> 
										<p class="goodsPrice-thumb">
									<fmt:formatNumber var="goodsPrice" value="${i.goodsPrice}" pattern="#,###" />
										${goodsPrice}원
										</p>
									</c:if>

									</div>
									<!-- div.goodsInfo -->
									<div id="delStatusArea">
										<span id="rushOrder">${i.goodsStatus}</span> <span id="fastDeliver">당일배송</span>
									</div>
								</div>

								<!-- div.TodayBestImgArea -->

								</c:forEach>
						</div>
						<!-- div#TodayBestArea -->
					</form>

					</div>
					<!-- div#dailyBestArea -->

					<hr>

					<div id="categoryBestArea">
						<h1>CATEGORY BEST</h1>
						<div id="cateroryGnbArea">
							<nav id="gnb">
								<!-- ul#mainMenu>li.mainLi*3>a[href=#]{메인메뉴$}+ul.subMenu>li.subLi*4>a[href=#]{서브메뉴$} -->
								<ul id="mainMenu" class="dFlex">
									<li class="mainLi"><a href="#">All</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="">TOP</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">SHIRTS</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">PANTS</a></li>
									<li class="divider">|</li>
									<li class="mainLi"><a href="#">OUTER</a></li>
								</ul>
								<!-- ul#mainMenu -->
							</nav>
						
							<!-- nav#gnb -->
						</div>
						<!-- div#cateroryGnbArea -->


						<div class="categoryBestImgDiv">

						<c:forEach var="i" begin="0" end="16" step="1" items="${goodsInfo}">
								<c:set var="disRate" value="${i.goodsDiscount/100}" />
								<fmt:formatNumber var="discountRate" value="${disRate}" type="percent" pattern="0%" />
								<div class="categoryBestImgArea">
									<!-- div.categoryBestImg 시작 -->
									<div class="categoryBestImg">
										<a href="/productDetail?goodsCode=${i.goodsCode}"><img class="cate-Thumb" src="/uploadDir/${i.filename}" alt=""></a>
									</div>
									<!-- <!-- div.categoryBestImg 끝 -->
									<div class="TodayBestStatus dFlex">
										<div class="colorOption">
											<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
										</div>
										<!-- div.colorStatus -->
										<div class="reviewCnt">
											리뷰 : <span>50</span>
										</div>
										<!-- div.reviewCnt -->
									</div>
									<!-- div.TodayBestStatus -->
									<div class="goodsInfo">
										<a href="#" class="goodsName">${i.goodsName}</a> <br>
										
										<a href="#" class="goodsSize">M~2XL(95~115)</a>
										<p class="goodsDescript">
											<!-- [세가지 타입의 기장 선택] -->
										</p>
										<c:if test="${discountRate != '0%'}">
										<p class="goodsPrice">
									<fmt:formatNumber var="goodsPrice" value="${i.goodsPrice}" pattern="#,###" />
										<del>${goodsPrice}</del>원 <br>
										<fmt:formatNumber var="disPrice" value="${i.goodsPrice - (i.goodsPrice * disRate)}" pattern="#,###" />
										${disPrice} 원
										<span data-link="${i.goodsDiscount}">
												${discountRate}
										</span>
										
										</p>
									</c:if>
									<c:if test="${discountRate == '0%'}"> 
										<p class="goodsPrice-thumb">
									<fmt:formatNumber var="goodsPrice" value="${i.goodsPrice}" pattern="#,###" />
										${goodsPrice}원
										</p>
									</c:if>
									</div>
									<!-- div.goodsInfo -->
									<div id="delStatusArea">
										<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
									</div>
									<!-- div#delStatusArea -->
								</div>
								<!-- div.categoryBestImgArea -->

						</c:forEach>

						</div>
						<!-- div.categoryBestImgDiv -->


					</div>
					<!-- div#categotyBestArea -->

				</main>
				<!-- main#main -->


			</div>
			<!-- div#mainPage -->
		</div>

		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
	<!-- div#wrap -->

	<script src="../script/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="../script/script.js"></script>
</body>
</html>

