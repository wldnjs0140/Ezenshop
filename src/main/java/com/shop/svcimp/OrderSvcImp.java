package com.shop.svcimp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.OrderDao;
import com.shop.dto.OrderDto;
import com.shop.svc.OrderSvc;

@Service
public class OrderSvcImp implements OrderSvc {

	@Autowired
	OrderDao orderDao;

	@Override
	public void mtdOrder(HttpServletRequest req) {
		Map<String, Object> map = new HashMap<>();
		map.put("uid", req.getParameter("uid"));
		map.put("uname", req.getParameter("uname"));
		map.put("goodsCode", req.getParameter("goodsCode"));
		map.put("goodsName", req.getParameter("goodsName"));
		map.put("goodsColor", req.getParameter("goodsColor"));
		map.put("goodsSize", req.getParameter("goodsSize"));
		map.put("goodsPrice", Integer.parseInt(req.getParameter("goodsPrice")));
		map.put("goodsCnt", Integer.parseInt(req.getParameter("goodsCnt")));
		map.put("adress", req.getParameter("adress"));
		map.put("phonenum", req.getParameter("phonenum"));
		map.put("paymentType", req.getParameter("paymentType"));
		map.put("filename", req.getParameter("filename"));
		orderDao.mtdOrder(map);
	}

	// 전체 주문수 -지원
	@Override
	public int admOrderTotalCnt() {
		return orderDao.admOrderTotalCnt();
	}

	// 전체 주문목록 조회 - 지원
	@Override
	public List<OrderDto> admOrderList() {
		return orderDao.admOrderList();
	}

	// 전체 주문목록 중 검색 - 지원
	@Override
	public List<OrderDto> admOrderListSrc(String keyField, String keyWord) {
		return orderDao.admOrderListSrc(keyField, keyWord);
	}

	// 전체 주문수 -지원
	@Override
	public int orderTotalCnt(String uid) {
		return orderDao.orderTotalCnt(uid);
	}

	// 전체 주문목록 조회 - 지원
	@Override
	public List<OrderDto> orderList(String uid) {
		return orderDao.orderList(uid);
	}

	// 전체 주문목록 중 검색 - 지원
	@Override
	public List<OrderDto> orderListSrc(String keyField, String keyWord, String uid) {
		return orderDao.orderListSrc(keyField, keyWord, uid);
	}

	// 배송상태 변경
	@Override
	public void deliStatusMod(int num, String deliStatus) {
		orderDao.deliStatusMod(num, deliStatus);

	}
}
