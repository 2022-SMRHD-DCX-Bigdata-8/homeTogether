package com.ha.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.dao.TB_AnswerDAO;
import com.ha.dao.TB_ProductDAO;
import com.ha.dao.TB_QNADAO;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Answer;
import com.ha.entity.TB_QNA;
import com.ha.entity.TB_Review;

public class goProductCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		

		int prod_seq = Integer.parseInt(request.getParameter("prod_seq"));
		

	


		TB_Review review = new TB_Review();
		review.setProd_seq(prod_seq);

		TB_QNA qna = new TB_QNA();
		qna.setProd_seq(prod_seq);
		
		TB_Answer answer = new TB_Answer();
		
		
		TB_ReviewDAO reviewdao = new TB_ReviewDAO();
		TB_QNADAO qnadao = new TB_QNADAO();
		TB_AnswerDAO answerdao = new TB_AnswerDAO();
		
		
		
		
		
		List<TB_Review> list = reviewdao.select(review);
		List<TB_QNA>qnalist = qnadao.selectQNA(qna);
				
		request.setAttribute("review", list);
		request.setAttribute("qna", qnalist);
		
		
		
		return "product";
	}

}
