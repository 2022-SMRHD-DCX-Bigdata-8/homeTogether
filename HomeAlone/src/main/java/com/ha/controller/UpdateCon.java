package com.ha.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.dao.TB_MemberDAO;
import com.ha.entity.TB_Member;

public class UpdateCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pw=request.getParameter("pw");
		String tel=request.getParameter("tel");
		String address=request.getParameter("addr");
		String gender=request.getParameter("gender");
		String nick = request.getParameter("nick");
		
		
		HttpSession session = request.getSession();
		TB_Member member = (TB_Member)session.getAttribute("user");
		member.setAddr(address);
		member.setGender(gender);
		member.setNick(nick);
		member.setPhone(tel);
		member.setPw(pw);
		TB_MemberDAO dao = new TB_MemberDAO();
		int cnt=dao.update(member);
		if(cnt>0) {
			return "redirect:/main.do";
		}else {
			
			return "redirect:/goUpdate.do";
		}
	}

}
