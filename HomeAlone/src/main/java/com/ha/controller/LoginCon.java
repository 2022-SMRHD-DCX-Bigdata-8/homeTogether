package com.ha.controller;

import com.ha.dao.TB_MemberDAO;
import com.ha.entity.TB_Member;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			
			String referer = request.getHeader("Referer"); //요청이온페이지url
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			System.out.println(id);
			
			TB_Member member = new TB_Member();
			
			member.setId(id);
			member.setPw(pw);
			
			TB_MemberDAO dao = new TB_MemberDAO();
			TB_Member result =dao.login(member);
			
			
			if(result!=null) {
				//로그인 성공 시 완전한 회원 정보 조회
				 TB_Member fullMemberInfo = dao.getMemberInfo(result.getId());
				
				
				
				if(fullMemberInfo != null && referer != null) {
					 HttpSession session = request.getSession();
			            session.setAttribute("user", fullMemberInfo);
			            System.out.println("로그인성공");
			           
			            System.out.println(fullMemberInfo);
			            response.sendRedirect(referer);
				}
				
				
				
								
			}else {
				System.out.println("로그인실패");
				HttpSession session = request.getSession();
				session.invalidate();
				response.sendRedirect(referer);
				
			}
			
			return null;
			
		
			
	}

}
