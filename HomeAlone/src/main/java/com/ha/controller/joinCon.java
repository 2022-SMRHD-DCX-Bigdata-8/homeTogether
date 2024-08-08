package com.ha.controller;

import com.ha.dao.TB_MemberDAO;
import com.ha.entity.TB_Member;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
		String zipCode = request.getParameter("zipCode");
		String addr = request.getParameter("addr");
		String addrDetail = request.getParameter("addrDetail");
		String text = request.getParameter("text");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		
		// 데이터 tb_member에 다 담기
		TB_Member tb_member = new TB_Member();
		//id, pw, nick, zipCode, addr, addrDetail, text, phone, gender
		tb_member.setId(id);
		tb_member.setPw(pw);
		tb_member.setNick(nick);
		tb_member.setZipCode(zipCode);
		tb_member.setAddr(addr);
		tb_member.setAddrDetail(addrDetail);
		tb_member.setText(text);
		tb_member.setPhone(phone);
		tb_member.setGender(gender);
		
		
		
		
		
		// dao 불러오기
		TB_MemberDAO dao = new TB_MemberDAO();
		
		//dao의 join기능 실행
		int cnt = dao.join(tb_member);
		
		// url변수 만들기
		String url = "";

		
		// join기능 (리턴타입이 int형) 기능 실행하면 cnt가 0보다 큼 , 실패하면 else로 넘어감 
		if(cnt > 0) {
			// forward로 join_success.jsp로 이동
			url = "redirect:/main.do";
			System.out.println("회원가입 성공!");
		}else {
			url = "redirect:/main.do";
			System.out.println("회원가입 실패!");
		}

	return url;
	
		
		
		

	}

}
