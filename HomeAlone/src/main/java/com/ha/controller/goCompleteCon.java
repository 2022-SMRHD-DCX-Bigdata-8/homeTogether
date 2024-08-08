package com.ha.controller;

import com.ha.entity.OrderComplete;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class goCompleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String orderer = request.getParameter("orderer");
		String zip=request.getParameter("zip");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String total= request.getParameter("totalp");
		String hp = request.getParameter("hp");
		String date= request.getParameter("date");
		
		System.out.println(addr1);
		System.out.println(date);
		
		String date1= date.substring(11,15);
		date= date.substring(16, 24);
		System.out.println(date);
		
		
		System.out.println(date1);
		
		
		String ordernum= date.replace(":", "");
		date1 +=ordernum;
		OrderComplete order = new OrderComplete(orderer, zip, addr1, addr2, total, hp, date, date1);
		
		System.out.println(date1);
		HttpSession session = request.getSession();
		session.setAttribute("order", order);
		
		
		response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print("true");
		
		
		
		
		

		
		
		
		return null;
	}

}
