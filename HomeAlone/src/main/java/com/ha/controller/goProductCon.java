package com.ha.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ha.dao.TB_ProductDAO;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Review;

public class goProductCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
<<<<<<< HEAD
		int p_number=Integer.parseInt(request.getParameter("p_number"));
				
=======
		
		TB_ProductDAO dao = new TB_ProductDAO();
		

	/*	int p_number=Integer.parseInt(request.getParameter("p_number"));
>>>>>>> branch 'master' of https://github.com/2022-SMRHD-DCX-Bigdata-8/homeTogether.git
		
		TB_Review review = new TB_Review();
		review.setP_number(p_number);
				
		
		TB_ReviewDAO dao = new TB_ReviewDAO();
        
		List<TB_Review> list = dao.select(review);
		
	    request.setAttribute("list", list); 

		
		return "product";
	}

}
