package com.shop.svc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.shop.dto.OrderDto;

public interface OrderSvc {

	// 상품주문
	public void mtdOrder(HttpServletRequest req);

	// 전체 주문수 -지원
	public int admOrderTotalCnt();

	// 주문 목록 전체보기 - 지원
	public List<OrderDto> admOrderList();

	// 주문 목록 검색 - 지워
	public List<OrderDto> admOrderListSrc(String keyFiled, String keyWord);

	// 회원 주문수 - 지원
	public int orderTotalCnt(String uid);

	// 회원 주문목록 - 지원
	public List<OrderDto> orderList(String uid);

	// 회원 주문목록 검색 - 지원
	public List<OrderDto> orderListSrc(String keyFiled, String keyWord, String uid);

	// 배송상태 변경
	public void deliStatusMod(int num, String deliStatus);

}
