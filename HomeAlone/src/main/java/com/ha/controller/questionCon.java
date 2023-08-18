package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_QNA;

public class questionCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String q_content = request.getParameter("q_content");
        
        HttpSession session = request.getSession();
        TB_Member member = (TB_Member) session.getAttribute("user");
        String nick = member.getNick();
        
        // q_content와 nick을 사용하여 상품 문의 정보 생성 및 저장 (DB에 저장)
        
        // 상품 문의 정보를 가져옴
       // List<TB_QNA> questionList = dao.selectQuestions();  // 이 메서드를 상황에 맞게 작성해야 함
        
        // JSON 형식으로 응답 준비
       // Gson gson = new Gson();
       // String json = gson.toJson(questionList);
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
       // out.print(json);

		
		
		
		return null;
	}

}
