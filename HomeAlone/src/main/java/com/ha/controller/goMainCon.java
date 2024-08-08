package com.ha.controller;

import com.ha.dao.TB_ProductDAO;
import com.ha.entity.TB_Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class goMainCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		TB_ProductDAO dao  = new TB_ProductDAO();
		List<TB_Product> list = dao.productList();
		
		int rannum[] = new int[9];
		Random ran = new Random();
		for(int i=0; i<9 ; i++) {
			
			rannum[i] = ran.nextInt(100);
			for(int j=0; j<i ; j++) {
				
				if(rannum[i]==rannum[j]) {
					i--;
				}
			}
		}
		ArrayList<TB_Product> main_list = new ArrayList<>();
		for (int i=0 ;  i<list.size() ; i++) {
			for(int j=0; j<9 ; j++) {
			if(list.get(i).getProd_seq()==rannum[j]) {
				main_list.add(list.get(i));
			}
			}
		}
		
		
		request.setAttribute("mainlist", main_list);
			
		
		
		
		
		
		return "main";
	}

}
