package com.ha.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ha.dao.TB_BasketDAO;
import com.ha.entity.TB_Basket;

public class inCartCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String nick=request.getParameter("nick");		
		int pNum=Integer.parseInt(request.getParameter("pNumber"));
		int pCnt=Integer.parseInt(request.getParameter("pCnt"));
		
		//TB_Basket basket = new TB_Basket(nick, pCnt, pNum);
		TB_BasketDAO dao =  new TB_BasketDAO();
		//int cnt =dao.insert(basket);
		
		
		return null;
	}

}
