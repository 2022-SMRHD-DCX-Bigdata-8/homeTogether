package com.ha.controller;

import java.io.IOException;
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
		
		ArrayList<TB_Basket> basket_List = new ArrayList<>();
		request.setCharacterEncoding("UTF-8");
		
		
		
		String nick=request.getParameter("nick");		
		int pNum=Integer.parseInt(request.getParameter("p_number"));
		int pCnt=Integer.parseInt(request.getParameter("p_cnt"));
		String pName = request.getParameter("p_name");
		int pPrice=Integer.parseInt(request.getParameter("p_price"));
	
		
		TB_Basket basket = new TB_Basket(nick, pCnt, pNum, pName, pPrice);
		basket_List.add(basket);
		HttpSession session = request.getSession();
		session.setAttribute("basket", basket_List);
		
				
		
		return null;
	}

}
