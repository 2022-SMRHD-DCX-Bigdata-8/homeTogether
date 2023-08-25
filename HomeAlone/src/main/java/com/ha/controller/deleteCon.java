package com.ha.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.dao.TB_MemberDAO;
import com.ha.entity.TB_Member;

public class deleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // 인코딩

		// 세션에 저장되어있는 사용자 정보를 가져오기 위해서
		HttpSession session = request.getSession();
		TB_Member user = (TB_Member) session.getAttribute("user");
		System.out.println(user);
		// 파라미터로 비밀번호 가져오기
		String pw = request.getParameter("password");

		TB_MemberDAO dao = new TB_MemberDAO();

		if (pw.equals(user.getPw())) {
			int cnt = dao.delete(user);
			session.removeAttribute("user");
			System.out.println(cnt + " = 삭제성공(1),실패(0)");
			return "redirect:/main.do";
		} else {
			return "redirect:/goMypage.do";
		}

	}

}
