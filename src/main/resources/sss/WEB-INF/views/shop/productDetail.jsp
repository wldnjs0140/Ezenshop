<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/style/style.css">
<link rel="stylesheet" href="/style/style_detail.css">

</head>
<body>

	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>
			<main id="main">

				<div class="goods-thumb-area">
					
					<div id="goods-thumb" class="dFlex">
						<c:set var="goodsCode" value="${productDetail.goodsCode}"/>
						<c:set var="uname" value="${uname}"/>
						<div id="goods-img">
							<img src="/uploadDir/${productDetail.filename}" alt="이미지0"> <span class="msg"></span>
						</div>
						<!-- goods_img -->
						<input type="hidden" id="chkGC" value="${goodsCode}">
						
						<div id="goodsOrder">
				
						<h3 class="title">${productDetail.goodsName}
							<br>
							<font class="size" style="font-size: 11px;color: #595959;">M~2XL(95~115)</font>
						</h3>
						<pre class="preFirst">
${productDetail.goodsTXT}
						</pre>
					<div id="result">
					
					</div>
							<div id="orderArea">
								<table>
									<tr>
										<td>소비자가</td>
										<fmt:formatNumber var="oriPrice" value="${productDetail.goodsPrice}" pattern="#,###" />
										<td>${oriPrice}원</td>
									</tr>
									<tr>
										<td>판매가격</td>
										<c:set var="sellPrice" value="${productDetail.goodsPrice * (100-productDetail.goodsDiscount) * 0.01}"/>
										<fmt:formatNumber var="sellPriceFmt" value="${sellPrice}" pattern="#,###" />
										<td>${sellPriceFmt}원 
											<c:if test="${productDetail.goodsDiscount >0}">
												<span>(할인율 : ${productDetail.goodsDiscount} % )</span>
											</c:if>
										</td>
									</tr>
									<tr>
										<td>색상</td>
										<td><select id="colorSel" name="goodsColor"	form="goodsFrm">
											<option>옵션 선택</option>
											<c:forEach var="goodsC" items="${goodsC}">
												<c:choose>
													<c:when test="${param.goodsColor eq goodsC.goodsColor}">
														<option selected>${goodsC.goodsColor}</option>
													</c:when>
													<c:otherwise>
														<option>${goodsC.goodsColor}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select></td>
									</tr>
									<tr>
										<td>사이즈</td>
										<td>
											<div class="sizeBtn">
												<c:forEach var="goodsS" items="${goodsS}">
													<label>
														<button class="chkSizeBtn">${goodsS.goodsSize}</button>
														<input type="radio" name="goodsSize" value="${goodsS.goodsSize}" form="goodsFrm">
													</label>
												</c:forEach>
											</div>
										</td>
									</tr>
									<tr>
										<td>개수</td>
										<td>
											<input type="text" name="goodsCnt" form="goodsFrm" value="1"> <span>개</span>
										</td>
									</tr>
								</table>
								<hr>
								<div id="btnArea">
									<span>총 상품 금액</span> 
									<span>원</span> <br>
	
									<button class="fBtn">구매하기</button>
									<button class="scBtn">장바구니</button>
								</div>
								<!-- btnArea -->
	
							</div>
							<!-- orderArea -->
						</div>
						<!-- goodsOrder -->
					</div>
					<!-- .goods-thumb -->
				</div>
				<!-- goods-thumb-info -->

				<div id="mGnbMenu">
					<span><a href="#">코디상품</a></span> <span><a href="#">상세정보</a></span>
					<span><a href="#">가이드</a></span> <span><a href="#">상품리뷰</a></span> <span><a
					href="#">Q&amp;A</a></span>
				</div>

			</main>
			<!-- main#main -->

			<!-- 리뷰사진 출력 시작 - 지원 -->
			<c:forEach var="goodsDetailImg" items="${goodsDetailImg}">
				<p class="goodsDetailImg"><img src="/uploadDir/${goodsDetailImg.imgName}" alt=""></p>
			</c:forEach>
			<!-- 리뷰사진 출력 끝 - 지원 -->
			<fmt:parseNumber var="sp" value="${productDetail.goodsPrice}" integerOnly="true"/>
			<form id="goodsFrm">
				<input type="hidden" name="uname" value="${uname}">
				<input type="hidden" name="goodsCode" value="${goodsCode}">
				<input type="hidden" name="goodsName" value="${productDetail.goodsName}">
				<input type="hidden" name="filename" value="${productDetail.filename}">
				<input type="hidden" name="goodsPrice" value="${productDetail.goodsPrice}"/>
				<input type="hidden" name="goodsDiscount" value="${productDetail.goodsDiscount}" />
			</form>

			

		</div>
		
			<%@ include file="/WEB-INF/views/shop/productReview.jsp" %>

	

			<div id="qnaArea">
				<span>Q&amp;A</span>
			</div>

		</div>
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>


	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_Detail.js"></script>
</body>
</html>