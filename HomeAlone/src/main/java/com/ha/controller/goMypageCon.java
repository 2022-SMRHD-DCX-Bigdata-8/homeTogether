package com.ha.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.dao.TB_OrderDAO;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_ORDER;

public class goMypageCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		 HttpSession session = request.getSession();
	     TB_Member member=(TB_Member)session.getAttribute("user");
	     String nick = member.getNick();
		
		TB_ORDER order = new TB_ORDER();
		order.setNick(nick);
		
		TB_OrderDAO dao = new TB_OrderDAO();
		
		List<TB_ORDER> list = dao.select(order);
		
		request.setAttribute("order", list);
		
		System.out.println(list);
		
		
		
		
		
		// TODO Auto-generated method stub
		
		return "mypage";
	}

}
