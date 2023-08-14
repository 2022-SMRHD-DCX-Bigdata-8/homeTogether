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
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 수집
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		
		// 데이터 tb_member에 다 담기
		TB_Member tb_member = new TB_Member(id, pw, nick, addr, phone, gender);
		
		// dao 불러오기
		TB_MemberDAO dao = new TB_MemberDAO();
		
		//dao의 join기능 실행
		int cnt = dao.join(tb_member);
		
		// url변수 만들기
		String url = "";

		
		// join기능 (리턴타입이 int형) 기능 실행하면 cnt가 0보다 큼 , 실패하면 else로 넘어감 
		if(cnt > 0) {
			// forward로 join_success.jsp로 이동
			url = "redirect:/goMain.do";
		}else {
			url = "redirect:/goJoin.do";
		}

	return url;
	
		
		
		

	}

}
