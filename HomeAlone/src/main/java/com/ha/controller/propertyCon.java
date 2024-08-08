package com.ha.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ha.dao.TB_ProductListDAO;
import com.ha.entity.Paging;
import com.ha.entity.TB_Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class propertyCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("여기오냐?");
		request.setCharacterEncoding("UTF-8");
		int page = 1;
		String text= request.getParameter("text");
		try {
			page = Integer.parseInt(request.getParameter("text"));
			System.out.println(page);
		}catch( NumberFormatException e ){
			System.out.println("첫 번째 페이지");
		}
		
		String property =request.getParameter("property");
		
		System.out.println(property);
		
		TB_ProductListDAO dao =  new TB_ProductListDAO();
		// 페이징? --> 너무 많아서
		//			 스크롤 제한, 로딩 시간
		
		// 전체 게시글 수 가져오는 거
		int cnt = dao.count(property);
		System.out.println("전체 상품 수 : " + cnt);
		System.out.println(page);
		
		// 원하는 페이지 만큼만 List DB검색 
		Paging p = new Paging();
		p.setPage(page);
		p.setProperty(property);
		
		List<TB_Product> list = dao.paging(p);
		System.out.println(list.size());
		
		Gson gson = new Gson();
		JsonObject jo = new JsonObject();
		jo.addProperty("total", cnt);
		jo.add("product", gson.toJsonTree(list));
		jo.add("text", gson.toJsonTree(text));
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jo.toString());
		
		return null;
	}

}
