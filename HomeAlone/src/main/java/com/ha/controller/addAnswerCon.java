package com.ha.controller;

import com.google.gson.Gson;
import com.ha.dao.TB_AnswerDAO;
import com.ha.entity.TB_Answer;
import com.ha.entity.TB_Member;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class addAnswerCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		TB_Member member = (TB_Member) session.getAttribute("user");
		String nick = member.getNick();


		String q_seq = request.getParameter("q_seq");
		String a_content = request.getParameter("a_content");
		System.out.println(a_content);

		System.out.println("===============================================================");
		System.out.println(q_seq);
		System.out.println("===============================================================");
		String[] q= q_seq.split("/");
		System.out.println(q[0]);
		System.out.println(q[1]);
		System.out.println(q[2]);
		String qq =q[0].replace(" ", "");
		System.out.println(qq);

		int qseq= Integer.parseInt(qq);

		System.out.println(qseq);
		System.out.println(a_content);
		int prod_seq=Integer.parseInt(request.getParameter("prod_seq"));
		System.out.println(prod_seq);
		TB_Answer answer = new TB_Answer();

		answer.setA_content(a_content);
		answer.setQ_seq(qseq);
		answer.setNick(nick);
		answer.setProd_seq(prod_seq);
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
