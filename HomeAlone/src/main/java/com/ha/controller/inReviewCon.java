package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_Review;

public class inReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String review_content = request.getParameter("review_content");
		int prod_seq=Integer.parseInt(request.getParameter("prod_seq"));
		double ratings=Double.parseDouble(request.getParameter("ratings"));
		

		
		HttpSession session = request.getSession();
		TB_Member member=(TB_Member)session.getAttribute("user");
		String nick = member.getNick();
		
		
		TB_Review review = new TB_Review();
	
		//nick, review_content, ratings, prod_seq
		
		review.setNick(nick);
		review.setReview_content(review_content);
		review.setRatings(ratings);
		review.setProd_seq(prod_seq);
	
		TB_ReviewDAO dao = new TB_ReviewDAO();
		int num=dao.insert(review);
		
		System.out.println(num);
		
		
		List<TB_Review> list = dao.select(review);
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String json= gson.toJson(list);
				
		response.setContentType("text/html;charset=utf-8");
		
		out.print(json);
		
		
		
		
		return null;
	}

}
