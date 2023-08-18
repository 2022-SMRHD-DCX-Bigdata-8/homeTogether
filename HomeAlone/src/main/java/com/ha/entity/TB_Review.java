package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TB_Review {
	
	private int prod_seq;
	private String  review_content;
	private String nick;
	private double ratings;
	private int review_seq;

	

}


