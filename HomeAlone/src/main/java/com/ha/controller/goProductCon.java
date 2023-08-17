package com.ha.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.dao.TB_ProductDAO;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Review;

public class goProductCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int prod_seq = Integer.parseInt(request.getParameter("prod_seq"));

		TB_Review review = new TB_Review();
		
		review.setProd_seq(prod_seq);
		
		TB_ReviewDAO dao = new TB_ReviewDAO();

		List<TB_Review> list = dao.select(review);

		request.setAttribute("review", list);
		
		return "product";
	}

}
