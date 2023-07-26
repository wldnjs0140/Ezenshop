<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderList</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_orderList.css" />
</head>
<body>

	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>

			<div id="proArea">

				<div id="proHeader" class="dFlex jcsb">
					<span class="sub">전체주문목록</span> <span class="total">총 상품수 : (
						<b>${orderTotal}</b> 개 )
					</span>
				</div>

				<div id="proTblArea">

					<div class="proTblHeader proTblList dFlex">
						<span>상품이미지</span>
						<span>주문번호</span>
						<span>상품코드</span> 
						
						<span>상품이름</span> 
						<span>색상 / 사이즈</span> 
						<span>구매수량</span> 
						<span>결제금액</span> 
						<span>처리상태</span> 
						<span>주문시간</span>

					</div>

					<c:forEach var="orderList" items="${orderList}"
						begin="${paging.cntPerPage*(paging.nowPage-1)}"
						end="${(paging.nowPage*paging.cntPerPage)-1}" step="1"
						varStatus="status">


						<div class="proTblList listRow dFlex" data-link="${orderList.goodsCode}">
							<span><img src="/uploadDir/${orderList.filename}" alt=""></span>
							<span>${orderList.num}</span>
							<span>${orderList.goodsCode}</span>
							<span>${orderList.goodsName}</span>
							<span> 
								<b>
									${orderList.goodsColor}  
									/  ${orderList.goodsSize}
							 	</b>
							</span> 
							<span>${orderList.goodsCnt}</span>
							<span>${orderList.goodsPrice * orderList.goodsCnt}</span>
							<span>${orderList.deliStatus}</span>
							<span>${orderList.orderTM}</span>
							
							<form action="/goodsDetailReg" id="goodsDetailRegFrm">
								<input type="hidden" id="saleRegCode" name="goodsCode"
									value="${orderList.goodsCode}">
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
											<a href="/orderList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&uid=${uidSession}">&lt;</a>

										</c:if> <c:forEach begin="${paging.startPage}"
											end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<b>&nbsp;&nbsp;${p}&nbsp;&nbsp;</b>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<a href="/orderList?nowPage=${p}&cntPerPage=${paging.cntPerPage}&uid=${uidSession}">&nbsp;&nbsp;${p}&nbsp;&nbsp;</a>
												</c:when>
											</c:choose>
										</c:forEach> <c:if test="${paging.endPage != paging.lastPage}">
											<a href="/orderList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&uid=${uidSession}">&gt;</a>

										</c:if></td>
								</tr>
							</tbody>
						</table>

					</div>

					<div id="srcArea" class="dFlex jcsb">

						<div class="src">

							<select name="keyFiled" id="keyWord" form="grSrcFrm">
								<option value="goodsCode">상품코드</option>
								<option value="goodsName">상품이름</option>
							</select> 
							<input type="text" name="keyWord" placeholder="검색어를 입력하세요."
								form="grSrcFrm" />
							<button type="submit" id="srcBtn" form="grSrcFrm">검색</button>
							<form id="grSrcFrm" action="/orderList"></form>
							
						</div>

						

					</div>

				</div>



			</div>

		</div>
		
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
	<!-- div#wrap -->
	<input type="hidden" name="uid" value="${uidSession}" form="grSrcFrm">
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script_orderList.js"></script>

</body>
</html>