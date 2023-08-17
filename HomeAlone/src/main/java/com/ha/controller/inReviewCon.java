package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_Review;

public class inReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content=request.getParameter("content");
		int p_number=Integer.parseInt(request.getParameter("p_number"));
		double ratings=Double.parseDouble(request.getParameter("ratings"));
		
		System.out.println(content);
		
		
		HttpSession session = request.getSession();
		TB_Member member=(TB_Member)session.getAttribute("user");
		String nick = member.getNick();
		
		System.out.println(ratings);
		
		TB_Review review = new TB_Review(nick, p_number, content, ratings);
		TB_ReviewDAO dao = new TB_ReviewDAO();
		int num=dao.insert(review);
		System.out.println(num);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("true");
		
		
		
		
		return null;
	}

}
