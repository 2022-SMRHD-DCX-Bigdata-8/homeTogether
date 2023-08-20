package com.ha.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.entity.TB_Basket;
import com.ha.entity.TB_Member;

public class goBasketCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		TB_Member member = (TB_Member)session.getAttribute("user");
		List<TB_Basket> list = (List<TB_Basket>) session.getAttribute("basket");
		
		
		
		if(member !=null) {
			request.setAttribute("user_name", member.getNick());
		}else {
			request.setAttribute("user_name", "비회원");
		}
		
		if (list == null || list.isEmpty()) {
			
			request.setAttribute("list_empty", true);
			
		}else {
			request.setAttribute("list_empty", false);
			
			
		}
		
		
		
		
		
		return "basket";
	}

}
