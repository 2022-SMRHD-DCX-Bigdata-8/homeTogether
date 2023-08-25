package com.ha.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderComplete {
	

 private String orderer ;
 private String zip;
 private String addr1;
 private String addr2;
 private String total;
 private String hp ;
 private String date;
 private String ordernum;
	

}
