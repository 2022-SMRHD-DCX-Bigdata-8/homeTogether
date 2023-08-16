package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class TB_Member {

	
	private String id; 	// 아이디
	private String pw;	// 비밀번호
	private String nick;	   // 닉네임
	private String zipCode;    //우편번호
	private String addr;	   // 주소
	private String addrDetail; // 상세주소
	private String text;       // 참고항목
	private String phone;	   // 전화번호
	private String gender;	   // 성별

	
	
	
}
