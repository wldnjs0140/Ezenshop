package com.shop.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderDto {

	private int num;
	private String uid;
	private String uname;
	private String goodsCode;
	private String goodsName;
	private String goodsColor;
	private String goodsSize;
	private int goodsPrice;
	private int goodsCnt;
	private String adress;
	private String phonenum;
	private String patmentType;
	private String deliStatus;
	private String filename;
	private Timestamp orderTM;
	
}
