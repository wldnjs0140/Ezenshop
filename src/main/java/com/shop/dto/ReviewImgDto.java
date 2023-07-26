package com.shop.dto;

import lombok.Data;

@Data
public class ReviewImgDto {

	private int num;
	private String goodsCode;
	private String uname;
	private String filename;
	private String oriFilename;
	private String filesize;
	private int ref;
}
