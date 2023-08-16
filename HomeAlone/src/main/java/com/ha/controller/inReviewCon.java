package com.ha.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class inReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content=request.getParameter("content");
		int pNum=Integer.parseInt(request.getParameter("p_number"));
		
		
		
		
		return null;
	}

}
