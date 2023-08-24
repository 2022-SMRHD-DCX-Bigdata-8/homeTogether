package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.ha.entity.TB_Basket;

public class inCartCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		

		ArrayList<TB_Basket> basket_List = new ArrayList<>();
		
				  
		int prod_seq=Integer.parseInt(request.getParameter("prod_seq")); // 상품 번호
		int prod_cnt=Integer.parseInt(request.getParameter("prod_cnt"));    // 상품 수량
		String prod_name = request.getParameter("prod_name");     // 상품 이름

		int prod_price=Integer.parseInt(request.getParameter("prod_price"));
		
		
		
		TB_Basket basket = new TB_Basket(prod_cnt, prod_seq, prod_name, prod_price);
		basket_List.add(basket);
		
		//TB_Basket basket2 = new TB_Basket(2, 1, "편안한 의자", 150000 );
		//basket_List.add(basket2);
		HttpSession session = request.getSession();
		session.setAttribute("basket", basket_List);
		
		System.out.println(basket_List.get(0).getProd_name());
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("true");
		
				
		
		return null;
	}

}
