<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminOrderList</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_adminOrderList.css" />
</head>
<body>

	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>

			<div id="proArea">

				<div id="proHeader" class="dFlex jcsb">
					<span class="sub">전체주문목록</span> <span class="total">총 상품수 : (
						<b>${admOrderTotal}</b> 개 )
					</span>
				</div>

				<div id="proTblArea">

					<div class="proTblHeader proTblList dFlex">
						<span>상품이미지</span>
						<span>주문번호</span>
						<span>상품코드</span> 
						<span>구매자ID</span>
						<span>상품이름</span> 
						<span>색상 /<br> 사이즈/ <br>재고</span> 
						<span>구매수량</span> 
						<span>결제금액</span> 
						<span>처리상태</span> 
						<span>주문시간</span>

					</div>

					<c:forEach var="adminOrderList" items="${adminOrderList}"
						begin="${paging.cntPerPage*(paging.nowPage-1)}"
						end="${(paging.nowPage*paging.cntPerPage)-1}" step="1"
						varStatus="status">


						<div class="proTblList listRow dFlex">
							<span><img src="/uploadDir/${adminOrderList.filename}" alt=""></span>
							<span id="num" data-link="${adminOrderList.num}">${adminOrderList.num}</span>
							<span>${adminOrderList.goodsCode}</span>
							<span>${adminOrderList.uid}</span> 
							<span>${adminOrderList.goodsName}</span>
							<span> 
								<b>
									${adminOrderList.goodsColor}  
									/  	${adminOrderList.goodsSize}
									<c:forEach var="a" items="${allGS}">						
										<c:if test="${a.goodsCode eq adminOrderList.goodsCode}">
											<c:if test="${a.goodsColor eq adminOrderList.goodsColor}">
												<c:if test="${a.goodsSize eq adminOrderList.goodsSize}">
													/ ${a.goodsStock}
												</c:if>
											</c:if>
										</c:if>
									</c:forEach>
									
							 	</b>
							</span> 
							<span>${adminOrderList.goodsCnt}</span>
							<span>${adminOrderList.goodsPrice * adminOrderList.goodsCnt}</span>
							<span>
								<input type="hidden" id="chkDeli" value="${adminOrderList.deliStatus}">
								<span class="deliSpan">${adminOrderList.deliStatus}</span>
								<!-- form 만들기 -->
								<button type="button" class="modDeli">수정하기</button>
								
							</span>
							<span>${adminOrderList.orderTM}</span>
							
							<form action="/goodsDetailReg" id="goodsDetailRegFrm">
								<input type="hidden" id="saleRegCode" name="goodsCode"
									value="${adminOrderList.goodsCode}">
							</form>
						</div>

					</c:forEach>

					<div class="proTblList dFlex">
						 <span></span> <span></span> <span></span> <span></span> <span></span>
						<span></span>
					</div>
					<form id="delFrm" action="/goodsDelProc"></form>

					<div class="paging-div">
						<ul class="pagination" id="pagination"></ul>
					</div>

					<div id="pagingTable">

						<table id="pTable">
							<tbody>
								<tr id="listPagingArea">
									<!-- 페이징 시작 -->
									<td colspan="5" id="pagingTd"><c:if
											test="${paging.startPage != 1 }">
											<a
												href="/adminOrderList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>

										</c:if> <c:forEach begin="${paging.startPage}"
											end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<b>&nbsp;&nbsp;${p}&nbsp;&nbsp;</b>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<a
														href="/adminOrderList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">&nbsp;&nbsp;${p}&nbsp;&nbsp;</a>
												</c:when>
											</c:choose>
										</c:forEach> <c:if test="${paging.endPage != paging.lastPage}">
											<a
												href="/adminOrderList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>

										</c:if></td>
								</tr>
							</tbody>
						</table>

					</div>

					<div id="srcArea" class="dFlex jcsb">

						<div class="src">

							<select name="keyFiled" id="keyWord" form="grSrcFrm">
								<option value="goodsCode">상품코드</option>
								<option value="uid">구매자ID</option>
								<option value="goodsName">상품이름</option>
							</select> 
							<input type="text" name="keyWord" placeholder="검색어를 입력하세요."
								form="grSrcFrm" />
							<button type="submit" id="srcBtn" form="grSrcFrm">검색</button>
							<form id="grSrcFrm" action="/adminOrderList"></form>

						</div>

						

					</div>

				</div>



			</div>

		</div>

		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
	<!-- div#wrap -->

	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_adminOrderList.js"></script>

</body>
</html>