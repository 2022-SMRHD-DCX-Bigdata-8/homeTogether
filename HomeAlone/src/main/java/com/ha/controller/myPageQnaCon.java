package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ha.dao.TB_ProductDAO;
import com.ha.dao.TB_QNADAO;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_Product;
import com.ha.entity.TB_QNA;
import com.ha.entity.TB_Review;

public class myPageQnaCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		TB_Member member=(TB_Member)session.getAttribute("user");
		String nick=member.getNick();
		TB_ProductDAO pdao = new TB_ProductDAO();
		TB_QNADAO dao = new TB_QNADAO();
		List<TB_QNA> list = dao.myPageQna(nick);
		List<TB_Product> products = new ArrayList<>();
		System.out.println("여기까지오나요?");
		
		for(int i=0 ; i<list.size() ;i++) {
			
		TB_Product product=pdao.productName(list.get(i).getProd_seq());
		products.add(product);
		
		}
		session.setAttribute("qna", list);
		session.setAttribute("product_qna", products);
		
		
	         
	      

		
		
		
		
		return null;
		
		
		
		
	}

}
