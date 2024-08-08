package com.ha.controller;

import com.ha.dao.TB_MemberDAO;
import com.ha.entity.TB_Member;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class idCheckCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		TB_MemberDAO dao = new TB_MemberDAO();
		TB_Member member = dao.check(id);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out =  response.getWriter();
		if(member==null) {
			out.print("true");
		}else {
			out.print("false");
		}
		
		
		return null;
	}

}
