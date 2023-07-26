<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZENSHOP</title>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/style_cart.css" />
</head>
<body>

	<div id="wrap">

		<div id="innerWrap">

			<%@ include file="/WEB-INF/views/inc/headerGNB.jsp"%>
			<%@ include file="/WEB-INF/views/inc/sitemap.jsp"%>

			<div id="contentWrap">
				<div id="content">
					<div id="cartWrap">
						<h2 class="cart_title">CART</h2>
						<div class="page-body">
							<div class="table-cart table-fill-prd">
								<table summary="번호, 사진, 제품명, 수량, 가격, 배송비, 취소">

									<colgroup>
										<col width="350" />
										<col width="115" />
										<col width="95" />
										<col width="105" />
										<col width="95" />
										<col width="95" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col"><div class="tb-center">제품</div></th>
											<th scope="col"><div class="tb-center">수량</div></th>
											<th scope="col"><div class="tb-center"></div></th>
											<th scope="col"><div class="tb-center">배송비</div></th>
											<th scope="col"><div class="tb-center">가격</div></th>
											<th scope="col"><div class="tb-center">취소</div></th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<td colspan="6">
												<div class="tb-right">
													총 구매금액 : 19,800원 = <strong>19,800원</strong>

												</div>
											</td>
										</tr>
									</tfoot>
		 
									<tbody>

										<tr class="nbg">
											<td>
												<div class="tb-left dFlex">
													<div class="thumb">
														<a href="#"> <img src="/uploadDir/${productDetail.filename}"
															alt="상품 섬네일" title="상품 섬네일" /></a>
													</div>
													<div class="info ">
														<a href="#" class="tb-bold">${productDetail.goodsName}
														
															<br>
															<font style="font-size: 11px; color: #595959">${goodsS}</font><br></a>

														<div id="28935_1" class="tb-opt">
															<span class="tb-dl"><span class="opt_dd">[
																	 <span
																	class='MK_option_amount28935_1'></span>개]
															</span></span>

														</div>



														<!-- 	<div class="editbtn">
															<a href="javascript:modify_option('28935', '1','');" class="CSSbuttonWhite btn_option">옵션변경</a>
														</div>  옵션변경 -->


													</div>
												</div>
											</td>
											<td>
												<div class="tb-center">
													<div class="opt-spin">
														<a href="javascript:count_change(1, 0)">-</a> <input
															type="text" name="amount" value="1" class="txt-spin" />
														<a href="javascript:count_change(0, 0)">+</a>
													</div>
													<a href="javascript:send_basket(0, 'upd')"
														class="CSSbuttonWhite btn_option">수량변경</a>
												</div>
											</td>

											<!-- 공백 -->
											<td></td>
											<!-- 공백 -->

											<td>

												<div class="tb-center tb-delivery">

													<span class="MS_deli_title MS_deli_block">[기본배송]</span>

													<div id="deliverycase0" class="MS_layer_delivery">
														<!-- <dl>
																<dt>배송조건 : 기본배송(조건)</dt>
																<dd> -->
														<!-- 주문금액이 <span class='MS_highlight'>70,000원</span> 미만시 <br />
																	<br style='line-height: 3px' />배송비 -->
														<span class='MS_highlight'>무료</span>
														<!-- 이 청구됩니다. -->
														<!-- 		</dd>
															</dl> -->
													</div>
												</div>
											</td>
											<td><div class="tb-center tb-price">
													<span></span>원
												</div></td>
											<td>
												<div class="tb-center">
													<span class="d-block"> <a href="/deleteCart"
														class="CSSbuttonWhite btn_select">삭제하기</a></span>
												</div>
											</td>
										</tr>
					
									</tbody>
							
								</table>
							</div>
							<!-- .table-fill-prd -->

							<div class="btn-order-ctrl">

								<a href="#" class="CSSbuttonWhite">장바구니 비우기</a> <a href="#"
									class="CSSbuttonWhite">계속 쇼핑하기</a> <a href="#"
									class="CSSbuttonBlack">주문하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
	<!-- div#wrap -->

	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>

</body>
</html>