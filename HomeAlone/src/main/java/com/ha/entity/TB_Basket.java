package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class TB_Basket {

	
	
	private int p_cnt;     // 제품수량
	private int p_number;  // 제품 번호
	private String p_name; // 제품명
	private int p_price;   // 제품가격
	
	
	
}
