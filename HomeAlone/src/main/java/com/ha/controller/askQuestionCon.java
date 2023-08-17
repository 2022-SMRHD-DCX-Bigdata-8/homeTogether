package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.entity.TB_Member;

public class askQuestionCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        String qContent = request.getParameter("q_content");

        HttpSession session = request.getSession();
        TB_Member member = (TB_Member) session.getAttribute("user");
        String qNickname = member.getNick();

       // TB_Question question = new TB_Question(qNickname, qContent);
       // TB_QuestionDAO dao = new TB_QuestionDAO();
        //int num = dao.insert(question);

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print("true");

   
		
		
		
		
		
		return null;
	}

}
