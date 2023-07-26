<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/style/style_review.css" />
</head>
<body>

	<div id="reViewArea">
		<div class="topReview dFlex">

			<c:set var="reFocusChk" value="${regReview}" />
			<input type="hidden" id="reFocusChk" value="${reFocusChk}">

			<div id="topLeft">
				<span id="review_Sub">REVIEW</span> <input type="hidden"
					id="hidgoodsCode" value="${goodsCode}"> <input
					type="hidden" id="hidnum" value="${num}">
			</div>

			<div id="topRight" class="dFlex">
				<c:if test="${sessionScope.unameSession != null}">
					<span class="goReview">상품 리뷰 작성하기</span>
				</c:if>
				<span>|</span> <span class="goAllReview">전체 상품 리뷰 보기</span>
			</div>

		</div>

		<div id="picListArea">
			<hr>
			<span>사진</span>
			<div id="reivewImgArea" class="dFlex">
				<c:forEach var="reviewImg" items="${imgList}" begin="0" end="4"
					step="1">
					<img src="/reviewDir/${reviewImg.filename}" alt="사진" />
				</c:forEach>
			</div>

		</div>

		<div id="reViews">
			<hr>
			<h2>리뷰목록 (총 개수 : ${goodsTotal})</h2>
			<div id="review_Tbl_Area">

				<c:forEach var="a" items="${reviewList}" varStatus="i"
				begin="${paging.cntPerPage*(paging.nowPage-1)}"
						end="${(paging.nowPage*paging.cntPerPage)-1}" step="1">
					<c:set var="b" value="${a.uname}" />
					<div class="reviewTblList dFlex">

						<div class="reviewLeft">
							<div class="review_Star_List">
								<c:set var="star" value="${a.reStar}" />
								<fieldset>
									<span class="starName"></span>
									<c:forEach var="chkStar" begin="1" end="${5-star}" step="1">
										<label class="notFilled">★</label>
									</c:forEach>
									<c:forEach var="chkStar" begin="1" end="${star}" step="1">
										<label class="filled">★</label>
									</c:forEach>

								</fieldset>
							</div>

							<c:forEach var="rListImg" items="${imgList}" varStatus="i">
								<c:if test="${a.ref eq rListImg.ref}">
									<img class="reviewList" src="/reviewDir/${rListImg.filename}"
										alt="리스트사진" />
								</c:if>
							</c:forEach>

							<pre>
${a.reContent}
</pre>

						</div>

						<div class="reviewRight">
							<span>${a.uname}님의 리뷰입니다</span> <span>키 : ${a.height}</span> <span>몸무게
								: ${a.weight}</span> <span>색상 : ${a.goodsColor}</span> <span>사이즈
								: ${a.goodsSize}</span>
						</div>

					</div>
					<div class="review_Tbl_Footer">
						<c:if test="${b eq sessionScope.unameSession}">
							<button type="button" id="reviewModBtn">수정</button>
							<button type="button" id="reviewDelBtn">삭제</button>
						</c:if>
						<input type="hidden" class="refchk" value="${a.ref}"> <input
							type="hidden" class="gcchk" value="${a.goodsCode}">
					</div>
				</c:forEach>

			</div>
			<!-- div#review_Tbl_Area -->
			<div id="pagingTable">

				<table id="pTable">
					<tbody>
						<tr id="listPagingArea">
							<!-- 페이징 시작 -->
							<td colspan="5" id="pagingTd"><c:if
									test="${paging.startPage != 1 }">
									<a
										href="/productDetail?goodsCode=${goodsCode}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>

								</c:if> <c:forEach begin="${paging.startPage }"
									end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>&nbsp;&nbsp;${p}&nbsp;&nbsp;</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a
												href="/productDetail?goodsCode=${goodsCode}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">&nbsp;&nbsp;${p}&nbsp;&nbsp;</a>
										</c:when>
									</c:choose>
								</c:forEach> <c:if test="${paging.endPage != paging.lastPage}">
									<a
										href="/productDetail?goodsCode=${goodsCode}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>

								</c:if></td>
						</tr>
					</tbody>
				</table>

			</div>
			<!-- div#pagingTable -->
			
		</div>
		<!-- div#reViews -->
	</div>

	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_Review.js"></script>

</body>
</html>