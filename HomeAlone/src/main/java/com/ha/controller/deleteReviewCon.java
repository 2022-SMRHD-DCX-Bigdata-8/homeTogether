package com.ha.controller;

import com.google.gson.Gson;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Review;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class deleteReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int review_seq = Integer.parseInt(request.getParameter("review_seq")); 
	
		TB_Review review = new TB_Review();
		
		review.setReview_seq(review_seq);
	
		TB_ReviewDAO dao = new TB_ReviewDAO();
	
		int num = dao.delete(review);
	
		System.out.println(num);
	
		response.setContentType("text/plain ; charset=UTF-8");
	
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		
		String jsonResult = gson.toJson(num);
		
		out.print(jsonResult);
	
		return null;
	
	}

}
