package com.ha.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ha.dao.TB_ProductListDAO;
import com.ha.entity.TB_Product;

public class goChairCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		TB_ProductListDAO dao = new TB_ProductListDAO();
		List<TB_Product> list = dao.ChairSelect();
		
		request.setAttribute("chair", list);
		
		return "productPage";
	}

}
