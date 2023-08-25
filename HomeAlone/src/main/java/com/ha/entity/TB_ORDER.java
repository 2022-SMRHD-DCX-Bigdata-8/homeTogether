package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TB_ORDER {

	private int order_seq;			//주문순번
	private String nick;			//주문자닉네임
	private int total_amount;		//총 결제금액
	private int pay_amount;			//결제대상금액
	private String pay_method;		//결제수단
	private int paid_amount;		//결제금액
	
	
	//아래 3개는 default값이 있음 
	private String created_at;		//주문날짜     default sysdate
	private int discount_amount;	//할인금액                0
	private String order_status;	//주문상태              주문완료
	
	
	
	
	
	
	
	
	
}
