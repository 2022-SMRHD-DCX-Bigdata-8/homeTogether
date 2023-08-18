package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TB_Product {

	// 제품 번호
	private int prod_seq;

	// 제품 이름
	private String prod_name;

	// 제품 타입
	private String prod_type;

	// 제품 상세타입
	private String prod_detail;

	// 제품 이미지
	private String prod_img;

	// 제품 가격
	private int prod_price;

	
}
