package com.ha.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ha.controller.Controller;

// FrontController 디자인패턴
// 단 한개의 서블릿(FrontController)만 사용
// == 모든요청을 단하나의 서블릿으로 처리!!!!!
// *.do : .do로 끝나는 모든요청을 받겠다.
// *.do : .do로 끝나는 모든요청을 받겠다.
// *.do : .do로 끝나는 모든요청을 받겠다.

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//HashMap 자료구조
	// 파이썬 딕셔너리자료형 key, value 짝지어서 저장 , Key값을 이용해서 조회
	// HashMap<Key자료형, Value 자료형>
	private HashMap<String, Controller> handler;
	
	@Override
	public void init() throws ServletException {
		// Servlet이 메모리에 등록되었을 때 단 한번만 실행
			handler = new HashMap<String, Controller>();
			handler.put("/main.do", new goMainCon() );
			handler.put("/join.do", new joinCon() );
			handler.put("/login.do", new LoginCon());
			handler.put("/goUpdate.do", new goUpdateCon());
			handler.put("/update.do", new UpdateCon());
			handler.put("/goLogout.do", new LogoutCon());
			handler.put("/inCart.do", new inCartCon());
			handler.put("/goDelete.do", new goDeleteCon());
			handler.put("/delete.do", new deleteCon());
			handler.put("/goProduct.do", new goProductCon());
			handler.put("/goBasket.do", new goBasketCon());
			handler.put("/inReview.do", new inReviewCon());

			

	}
	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 요청을 구분하기 위해서, 어떤요청인지 알아내야합니다.
		// uri : /Ex04/main.do
		String uri = request.getRequestURI();
		// ContextPath :/Ex04
		String cpath = request.getContextPath();
		// 슬라이싱
		String mapping = uri.substring(cpath.length());

		System.out.println(mapping);

		String url = null;
		
		Controller con =null;
		// 2. 요청을 구분해서 알맞는 코드를 실행
		
		// HashMap 에서 저장되어있는 POJO(자바객체) 하나 꺼내오기
		con=handler.get(mapping);
		
		// con null 이아닐때 실행 안전장치!
		if(con != null) {
		url=con.execute(request, response);
		}
		// ==============================================================
		// url 이 null 이아닐때 !
		if (url != null) {
			if(url.contains("redirect:/")) {
				//["redirect","goMain.do"]
			response.sendRedirect(url.split(":/")[1]);
			}else {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/"+url+".jsp");
			rd.forward(request, response);
			}
		}
	}

}
