package com.ha.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.entity.TB_Member;

public class goPaymentCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
	     HttpSession session = request.getSession();
	      TB_Member user =(TB_Member)session.getAttribute("user");
	       
		request.setAttribute("user", user);
	      
		return "payment";
	}

}
