package com.ha.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String referer = request.getHeader("Referer"); //요청이온 url주소
		System.out.println(referer);
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("basket");
		if(referer.equals("http://localhost:8081/HomeAlone/goMypage.do")) {
			
			return "redirect:/main.do";
		}else {
		
		response.sendRedirect(referer);
		return null;
		}
		
	}

}
