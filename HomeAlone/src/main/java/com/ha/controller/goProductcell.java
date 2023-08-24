package com.ha.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ha.dao.TB_ProductDAO;
import com.ha.entity.TB_Product;

public class goProductcell implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int prod_seq =Integer.parseInt(request.getParameter("prod_seq"));
		TB_ProductDAO dao = new TB_ProductDAO();
		TB_Product product = dao.productName(prod_seq);
		
		request.setAttribute("product", product);
		
		
		
		
		return "productcell";
	}

}
