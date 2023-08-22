package com.ha.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.entity.TB_Member;

public class LogoutCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String referer = request.getHeader("Referer"); //요청이온 url주소
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("basket");
		response.sendRedirect(referer);
		return null;
		
	}

}
