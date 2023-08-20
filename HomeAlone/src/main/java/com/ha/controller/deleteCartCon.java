package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ha.entity.TB_Basket;

public class deleteCartCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String checkedProductsString = request.getParameter("checkedProductsString");
		String[] products = checkedProductsString.split(",");
		
		
		HttpSession session = request.getSession();
		
		List<TB_Basket> list = (List<TB_Basket>)session.getAttribute("basket"); // 장바구니 session 불러오기
		
		List<Integer> remove_idx = new ArrayList<>();  //삭제할 인덱스번호 담을 list
		
		// 장바구니에 담긴 정보와  선택삭제 정보가 같을때  장바구니 index를   삭제할인덱스 list에 담는 반복문
		for(int i=0 ; i<list.size(); i++) {
			
			for(int j=0 ; j< products.length ; j++) {
				
				int prod =Integer.parseInt(products[j]);
				if(list.get(i).getProd_seq()==prod) {
					remove_idx.add(i);
				}
			}
		}
		
		
		// 장바구니에서 삭제할 인덱스 list로  삭제하는 코드
		 for (int i : remove_idx) {
	            list.remove(i);
	        }
		 if(list==null) {
			 
			 
		 }
		 
		
		
		
		return null;
	}

}
