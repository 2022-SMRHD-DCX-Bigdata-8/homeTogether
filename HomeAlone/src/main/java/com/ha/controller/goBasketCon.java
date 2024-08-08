package com.ha.controller;

import com.ha.dao.TB_ProductDAO;
import com.ha.entity.TB_Basket;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class goBasketCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		TB_Member member = (TB_Member)session.getAttribute("user");
		List<TB_Basket> list = (List<TB_Basket>) session.getAttribute("basket");
		
		
		
		if(member !=null) {
			request.setAttribute("user_name", member.getNick());
		}else {
			request.setAttribute("user_name", "비회원");
		}
		
		if (list == null || list.isEmpty()) {
			
			request.setAttribute("list_empty", true);
			
		}else {
			request.setAttribute("list_empty", false);
			
			
		}
		TB_ProductDAO dao  = new TB_ProductDAO();
		List<TB_Product> prod_list = dao.productList();
		int rannum[] = new int[3];
		Random ran = new Random();
		for(int i=0; i<3 ; i++) {
			
			rannum[i] = ran.nextInt(100);
			for(int j=0; j<i ; j++) {
				
				if(rannum[i]==rannum[j]) {
					i--;
				}
			}
		}
		
		
		ArrayList<TB_Product> main_list = new ArrayList<>();
		for (int i=0 ;  i<prod_list.size() ; i++) {
			for(int j=0; j<3 ; j++) {
			if(prod_list.get(i).getProd_seq()==rannum[j]) {
				main_list.add(prod_list.get(i));
			}
			}
		}
		request.setAttribute("prodlist", main_list);
		
		
		
		
		return "basket";
	}

}
