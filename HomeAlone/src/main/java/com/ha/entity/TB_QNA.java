package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class TB_QNA {

	private int prod_seq;
	private String q_content;
	private String nick;	
	private int q_seq;
	private String created_at;
	

}
