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
<link rel="stylesheet" href="/style/style_categoryDetail.css" />

</head>

<body>
	
	<div id = "wrap">
		
		<div id="innerWrap">
			
			<%@ include file ="/WEB-INF/views/inc/headerGNB.jsp" %>
			<%@ include file ="/WEB-INF/views/inc/sitemap.jsp" %>
			<div id="bestArea">
				<div id="title">
					<h3>BEST STYLE</h3>
				</div>
				
				<div class="bestItemArea dFlex slid_div2">
					<c:forEach var="i" items="${gsList}">
					<c:set var="disRate" value="${i.goodsDiscount/100}" />
				<fmt:formatNumber var="discountRate" value="${disRate}" type="percent" pattern="0%" />
					<div class="item-list">
						<div class="bestImg">
							<a href="#"><img src="uploadDir/${i.filename}" alt="topBest1"></a>
						</div>
						<!-- bestImg -->
						<div class="itemInfo">
							<div class="colorOption">
								<!-- 색상 옵션 이미지 -->
								<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
							</div>
							<!-- colorOption -->
							<div class="reviewCnt">
								리뷰 : <span>505</span>
							</div>
							<!-- div.reviewCnt -->
							<div class="goodsInfo">
								<a href="#" class="goodsName">${i.goodsName }</a> <br>
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
										<b>${goodsPrice}원</b>
										</p>
									</c:if>
							</div>
							<!-- div.goodsInfo -->
							<div id="delStatusArea">
								<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
							</div>
							<!-- delStatusArea -->
						</div>
						<!-- itemInfo -->
					</div>
					<!-- item-list -->
					</c:forEach>
				</div>
				<!-- bestItemArea -->
			</div>
			<!-- div#bestArea -->
		</div>
		<!-- innerWrap -->
		<div id="wrapper">
		<!-- categoryNameArea -->
		<div id="categoryNameArea">
					
				<div id="title" class="dFlex">
					<span id="categoryName">${param.goodsCategory}</span>
				</div>
				<!-- div#title -->
					<div class="item-info dFlex">
						<div class="item-total">
							TOTAL
							<span>${gsCnt}</span>
							PRODUCT
						</div>
						<!-- item-total -->
						
					</div>
					<!-- item-info -->
				<div class="categoryItemArea">
				<c:forEach var="i" items="${gsList}"> 
					<c:set var="disRate" value="${i.goodsDiscount/100}" />
				<fmt:formatNumber var="discountRate" value="${disRate}" type="percent" pattern="0%" />
					<div class="item-list">
						<div class="categoryImg">
							<a href="#"><img src="uploadDir/${i.filename}" alt="topBest1"></a>
						</div>
						<!-- categoryImg -->
						<div class="itemInfo">
							<div class="colorOption">
								<!-- 색상 옵션 이미지 -->
								<img src="images/index/ColorOption2png.png" alt="색상 이미지 첨부">
							</div>
							<!-- colorOption -->
							<div class="reviewCnt">
								리뷰 : <span>505</span>
							</div>
							<!-- div.reviewCnt -->
							<div class="goodsInfo">
								<a href="#" class="goodsName">${i.goodsName}</a> <br>
								<a href="#" class="goodsSize">M~2XL(95~115)</a>

								<p class="goodsDescript">
								[세가지 타입의 기장 선택] 
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
										<b>${goodsPrice}원</b>
										</p>
									</c:if>
							</div>
							<!-- div.goodsInfo -->
							<div id="delStatusArea">
								<span id="rushOrder">주문폭주</span> <span id="fastDeliver">당일배송</span>
							</div>
						</div>
						<!-- itemInfo -->
					</div>
					<!-- item-list -->
					
		</c:forEach>
				</div>
				<!-- categoryItemArea -->
				
				
			</div>
			<!-- div#bestArea -->
			<div id="pagingTable">

						<table id="pTable">
							<tbody>
								<tr id="listPagingArea">
									<!-- 페이징 시작 -->
									<td colspan="5" id="pagingTd"><c:if
											test="${paging.startPage != 1 }">
											<a href="/categoryDetail?goodsCategory=${gsList.goodsCategory}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&uid=${uidSession}">&lt;</a>

										</c:if> <c:forEach begin="${paging.startPage}"
											end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<b>&nbsp;&nbsp;${p}&nbsp;&nbsp;</b>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<a href="/categoryDetail?goodsCategory=${gsList.goodsCategory}&cntPerPage=${paging.cntPerPage}&uid=${uidSession}">&nbsp;&nbsp;${p}&nbsp;&nbsp;</a>
												</c:when>
											</c:choose>
										</c:forEach> <c:if test="${paging.endPage != paging.lastPage}">
											<a href="/categoryDetail?goodsCategory=${gsList.goodsCategory}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&uid=${uidSession}">&gt;</a>

										</c:if></td>
								</tr>
							</tbody>
						</table>

					</div>
		</div>
		<!-- wrapper -->
		
			
		<%@ include file ="/WEB-INF/views/inc/footer.jsp" %>
	</div>
	<!-- div#wrap -->
	
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_categoryDetail.js"></script>
	
</body>
</html>