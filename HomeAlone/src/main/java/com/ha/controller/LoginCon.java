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
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			TB_Member member = new TB_Member();
			member.setId(id);
			member.setPw(pw);
			TB_MemberDAO dao = new TB_MemberDAO();
			TB_Member result =dao.login(member);
			
			
			if(result!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", result);
				System.out.println("로그인성공");
				return "redirect:/main.do";
								
			}else {
				System.out.println("로그인실패");
				return "redirect:/goLogin.do";
			}
			
			
			
		
			
	}

}
