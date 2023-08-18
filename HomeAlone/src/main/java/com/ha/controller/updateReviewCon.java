package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_Review;

public class updateReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("001실행");
		request.setCharacterEncoding("UTF-8");
		//System.out.println("002실행");
		String review_content = request.getParameter("review_content");
		int review_seq = Integer.parseInt(request.getParameter("review_seq"));
		double ratings = Double.parseDouble(request.getParameter("ratings"));
		//System.out.println("003실행");
		System.out.println(review_content);
		System.out.println(review_seq);
		System.out.println(ratings);
		
		HttpSession session = request.getSession();
		TB_Member member = (TB_Member) session.getAttribute("user");
		String nick = member.getNick();
		System.out.println(nick);

		TB_Review review = new TB_Review();

		review.setReview_content(review_content);
		review.setReview_seq(review_seq);
		review.setRatings(ratings);
		//System.out.println("004실행");
		
		TB_ReviewDAO dao = new TB_ReviewDAO();
		
		System.out.println("005실행");
		
		int num = dao.update(review);

		System.out.println(num);

		response.setContentType("text/plain ; charset=UTF-8");
		
		// 프린트 라이터보다 위에서 인코딩을 해줘야 합니다!!

		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		
		String jsonResult = gson.toJson(num);
		
		out.print(jsonResult);

		
		
		
		return null;
	}

}
