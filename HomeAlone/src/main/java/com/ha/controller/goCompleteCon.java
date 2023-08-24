package com.ha.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class goCompleteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		// 세션에서 데이터를 가져옴
		String orderer = (String) session.getAttribute("orderer");
		String hp = (String) session.getAttribute("hp");
		String zip = (String) session.getAttribute("zip");
		String roadAddress = (String) session.getAttribute("roadAddress");
		String addr2 = (String) session.getAttribute("addr2");

		// 리스트에 데이터 담기
		List<String> list = new ArrayList<>();
		list.add(orderer);
		list.add(hp);
		list.add(zip);
		list.add(roadAddress);
		list.add(addr2);

		session.setAttribute("buyer",list);
		
		
		return "complete";
	}

}
