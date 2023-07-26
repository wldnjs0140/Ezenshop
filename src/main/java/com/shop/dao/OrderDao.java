package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shop.dto.OrderDto;

@Mapper
public interface OrderDao {

	// 상품주문
	@Insert("insert into orderProc(uid,uname,goodsCode,goodsName,goodsSize,goodsColor,goodsPrice,goodsCnt,adress,phonenum,paymentType,filename)"
			+ " values (#{uid}, #{uname}, #{goodsCode}, #{goodsName}, #{goodsSize}, #{goodsColor}, #{goodsPrice},#{goodsCnt}, #{adress}, #{phonenum}, #{paymentType}, #{filename})")
	public void mtdOrder(Map<String, Object> map);

	// 전체 주문수
	@Select("select count(*) from orderProc")
	public int admOrderTotalCnt();

	// 전체 주문목록
	@Select("select * from orderProc order by num desc")
	public List<OrderDto> admOrderList();

	// 전체 주문목록 검색
	@Select("select * from orderProc where ${param1} like CONCAT('%',#{param2},'%') order by num desc")
	public List<OrderDto> admOrderListSrc(String keyField, String keyWord);

	// 회원 전체 주문수
	@Select("select count(*) from orderProc where uid = #{param1} order by num desc")
	public int orderTotalCnt(String uid);

	// 회원 주문 목록
	@Select("select * from orderProc where uid = #{param1} order by num desc")
	public List<OrderDto> orderList(String uid);

	// 회원주문 검색
	@Select("select * from orderProc where ${param1} like CONCAT('%',#{param2},'%') and uid = #{param3}")
	public List<OrderDto> orderListSrc(String keyField, String keyWord, String uid);

	// 배송상태 변경
	@Update("update orderProc set deliStatus = #{param2} where num = #{param1}")
	public void deliStatusMod(int num, String deliStatus);

}
