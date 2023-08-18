package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class TB_Basket {

	
	
	private int prod_cnt;     // 제품수량
	private int prod_seq;  // 제품 번호
	private String prod_name; // 제품명
	private int prod_price;   // 제품가격
	
	
	
}
