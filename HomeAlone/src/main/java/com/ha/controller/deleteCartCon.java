package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
		System.out.println(checkedProductsString);
		String[] products = checkedProductsString.split(",");
		
		
		HttpSession session = request.getSession();
		
		List<TB_Basket> list = (List<TB_Basket>)session.getAttribute("basket"); // 장바구니 session 불러오기
		
		List<Integer> remove_idx = new ArrayList<>();  //삭제할 인덱스번호 담을 list
		
		// 장바구니에 담긴 정보와  선택삭제 정보가 같을때  장바구니 index를   삭제할인덱스 list에 담는 반복문
		for(int i=0 ; i<list.size(); i++) {
			
			for(int j=0 ; j< products.length ; j++) {
				
				int prod =Integer.parseInt(products[j]);
				if(list.get(i).getProd_seq()==prod) {
					remove_idx.add(prod);
				}
			}
		}
		
		
		Iterator<TB_Basket> iterator = list.iterator();
		
		while (iterator.hasNext()) {
		    TB_Basket basket = iterator.next();
		   for(int i=0;i<remove_idx.size() ; i++) {
		    if (basket.getProd_seq() == remove_idx.get(i)) {
		        iterator.remove(); // prod_seq가 일치하는 객체 삭제
		        
		    }
		   }
		}
		if(list.size()!=0) {
			System.out.println("장바구니안에 상품이있어");
		}else {
			System.out.println("장바구니가 비어있어!");
		}
		 
		 if(list.size()==0) {
		 
			 response.setContentType("text/plain ; charset=UTF-8");// 프린트 라이터보다 위에서 인코딩을 해줘야 합니다!!
		     PrintWriter out = response.getWriter();
		     out.print("true");
		     out.close();
		     
		     
		 }else {
			 
		 }
		 
		 
		
		
		
		return null;
	}

}
