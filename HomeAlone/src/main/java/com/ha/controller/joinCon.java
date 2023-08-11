package com.ha.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ha.dao.TB_MemberDAO;
import com.ha.entity.TB_Member;

public class joinCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String gender = request.getParameter("gender");
		
		TB_Member tb_member = 
				new TB_Member(id, pw, nick, address, tel, gender);
		
		TB_MemberDAO dao = new TB_MemberDAO();
		
		int cnt = dao.join(tb_member);

		
		if(cnt > 0) {
			System.out.println("회원가입 성공");
			return "redirect:/goLogin.do";
			
		} else {
			System.out.println("회원가입 실패");
			return "goJoin";
		}
		
		
//		if(cnt>0) {
//			
//		return "redirect:/goMain.do";
//		
//		}else {
//			
//			return "redirect:/goJoin.do";
//			
//		
		
		
		
	}

}
