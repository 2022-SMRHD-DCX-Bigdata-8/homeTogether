package com.ha.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.dao.TB_MemberDAO;
import com.ha.entity.TB_Member;

public class LoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		TB_Member tb_member = new TB_Member();
		
		tb_member.setID(id);
		tb_member.setPW(pw);
		
		TB_MemberDAO dao = new TB_MemberDAO();
		TB_Member result = dao.login(tb_member);
		
		String url = "";
		
		if (result != null) {
			
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("user", result);
			
		} else {
			System.out.println("로그인 실패~~~");
		}
		
		
			
			
			
			
			
		return "redirect:/login.do";
			
	}

}
