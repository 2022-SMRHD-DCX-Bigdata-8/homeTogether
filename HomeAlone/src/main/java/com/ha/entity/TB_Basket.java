package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class TB_Basket {

	
	private String nick;   // 사용자 닉네임  :데이터베이스 테이블 속성
	private int p_cnt;     //제품 수량 :데이터베이스 테이블 속성  and 장바구니 페이지 보여줄내용
	private int p_number;  // 제품 번호 : 데이터베이스 테이블 속성
	private String p_name; // 제품명 : 장바구니 페이지 보여줄내용
	private int p_price;   // 제품가격 : 장바구니 페이지 보여줄 내용
	
	
	
}
