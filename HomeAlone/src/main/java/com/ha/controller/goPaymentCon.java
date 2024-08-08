package com.ha.controller;

import com.ha.entity.TB_Basket;
import com.ha.entity.TB_Member;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class goPaymentCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
	     HttpSession session = request.getSession();
	      TB_Member user =(TB_Member)session.getAttribute("user");
	      List<TB_Basket> list = (List<TB_Basket>) session.getAttribute("basket");
	      
	      if(user !=null) {
				request.setAttribute("user_name", user.getNick());
			}else {
				request.setAttribute("user_name", "비회원");
			}
			
			if (list == null || list.isEmpty()) {
				
				request.setAttribute("list_empty", true);
				
			}else {
				request.setAttribute("list_empty", false);
			}
			request.setAttribute("user", user);
	      
		return "payment";
	}
 
}
