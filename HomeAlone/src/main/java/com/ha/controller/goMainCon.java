package com.ha.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ha.dao.TB_ProductDAO;
import com.ha.entity.TB_Product;

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
		for (int i=0 ;  i<9 ; i++) {
			System.out.println(rannum[i]);
		}
		
		request.setAttribute("rannum", rannum);
		request.setAttribute("products", list);
		
		
		
		
		
		
		return "main";
	}

}
