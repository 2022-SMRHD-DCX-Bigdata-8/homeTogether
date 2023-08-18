package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ha.dao.TB_QNADAO;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_QNA;

public class questionCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String q_content = request.getParameter("q_content");
       
        System.out.println(q_content);
       
        HttpSession session = request.getSession();
        TB_Member member = (TB_Member) session.getAttribute("user");
        String nick = member.getNick();
        
        // DAO 생성
        TB_QNADAO dao = new TB_QNADAO();
        
        // TB_QNA 객체 생성
        TB_QNA qna = new TB_QNA();
        qna.setQ_content(q_content);
        qna.setNick(nick);
        
        // 상품 문의 정보를 데이터베이스에 저장
       int cnt = dao.insertQNA(qna);
       
        // 상품 문의 정보를 가져옴 (이 부분은 상황에 맞게 작성)
        List<TB_QNA> questionList = dao.selectQNA(qna);
        
        // JSON 형식으로 응답 준비
        Gson gson = new Gson();
        String json = gson.toJson(questionList);
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);

        return null;
	}

}
