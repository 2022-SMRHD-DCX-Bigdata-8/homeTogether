
package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ha.dao.TB_ProductDAO;
import com.ha.dao.TB_QNADAO;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_Product;
import com.ha.entity.TB_QNA;
import com.ha.entity.TB_Review;

public class myPageReviewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		TB_Member member=(TB_Member)session.getAttribute("user");
		String nick=member.getNick();
		TB_ProductDAO pdao = new TB_ProductDAO();
		TB_ReviewDAO dao = new TB_ReviewDAO();
		List<TB_Review> list =dao.myPageReview(nick);
		List<TB_Product> products = new ArrayList<>();
		System.out.println(list.get(0).getProd_seq());
		
		for(int i=0 ; i<list.size() ;i++) {
			
		TB_Product product=pdao.productName(list.get(i).getProd_seq());
		products.add(product);
		
		}
		System.out.println(products.get(0).getProd_name());
		TB_QNADAO daoo = new TB_QNADAO();
		
		List<TB_QNA> lists = daoo.myPageQna(nick);
		List<TB_Product> productss = new ArrayList<>();
		
		for(int i=0 ; i<lists.size() ;i++) {
			
			TB_Product product=pdao.productName(lists.get(i).getProd_seq());
			productss.add(product);
			
			}
		
		
		
		
		response.setContentType("text/plain ; charset=UTF-8");// 프린트 라이터보다 위에서 인코딩을 해줘야 합니다!!
	      
		
	    PrintWriter out = response.getWriter();
	         
	      

	    Gson gson = new Gson();
	      
	   
	    
	    JsonObject resJson = new JsonObject();
	    resJson.add("reviewList", gson.toJsonTree(list));
	    resJson.add("qnaList", gson.toJsonTree(lists));
	    resJson.add("product_review", gson.toJsonTree(products));
	    resJson.add("product_qna", gson.toJsonTree(productss));

	    String jsonRes = gson.toJson(resJson);
	    out.print(jsonRes);
	    
	    
	    
		
		
		
		
		
		return null;
	}

}

