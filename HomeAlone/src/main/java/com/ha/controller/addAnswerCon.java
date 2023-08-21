package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ha.dao.TB_AnswerDAO;
import com.ha.entity.TB_Answer;
import com.ha.entity.TB_Member;

public class addAnswerCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		TB_Member member = (TB_Member) session.getAttribute("user");
		String nick = member.getNick();	
		
		int q_seq = Integer.parseInt(request.getParameter("q_seq"));
		String a_content = request.getParameter("a_content");
		
		TB_Answer answer = new TB_Answer();
		
		answer.setA_content(a_content);
		answer.setQ_seq(q_seq);
		answer.setNick(nick);
		
		TB_AnswerDAO dao = new TB_AnswerDAO();
		int cnt = dao.insertAnswer(answer);
		System.out.println(cnt);
		
		response.setContentType("text/plain ; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
	    String json= gson.toJson(answer);
		
	    out.print(json);
	    
	    
		return null;
	}

}
