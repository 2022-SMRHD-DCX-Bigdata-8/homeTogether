package com.ha.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ha.dao.TB_ProductListDAO;
import com.ha.entity.TB_Product;

public class searchCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		int page_idx=0;
		
		if(request.getParameter("page") ==null) {
			 page_idx = 1;
		}else {
		 page_idx = Integer.parseInt(request.getParameter("page")); 
		}
		
		System.out.println(page_idx);
		
		
		String search=request.getParameter("search");
		
		System.out.println(search);
		TB_ProductListDAO dao =  new TB_ProductListDAO();
		List<TB_Product> list = dao.searchSelect(search);
		
		System.out.println(list.size());
		int page_cnt = 0;
		
		if(list.size()%15 != 0) {
		 page_cnt = list.size()/15 +1;
		}else {
		 page_cnt = list.size()/15;	
		}
		System.out.println(page_cnt);
		
		int start = (page_idx-1)*15;
		int end = start+15;
		if(end >list.size()) {
			end=list.size();
			
		}
		List<TB_Product> product = list.subList(start, end);
		
		String url = request.getRequestURL().toString();
		String[] parts = url.split("/");
		String currenturl = parts[parts.length - 1];
		
		System.out.println(currenturl);
		
		request.setAttribute("total", list.size());
		request.setAttribute("page",page_cnt);
		request.setAttribute("url", currenturl);
		request.setAttribute("product", product);
		request.setAttribute("searched", search);
		
		
		return "productPage";
	}

}
