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
		
				  
		int pNum=Integer.parseInt(request.getParameter("p_number")); // 상품 번호
		int pCnt=Integer.parseInt(request.getParameter("p_cnt"));    // 상품 수량
		String pName = request.getParameter("p_name");     // 상품 이름

		int pPrice=Integer.parseInt(request.getParameter("p_price"));
		
		
		TB_Basket basket = new TB_Basket(pCnt, pNum, pName, pPrice);
		basket_List.add(basket);
		HttpSession session = request.getSession();
		session.setAttribute("basket", basket_List);
		
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("true");
		
				
		
		return null;
	}

}
