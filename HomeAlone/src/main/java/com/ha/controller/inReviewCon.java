package com.ha.controller;

import com.google.gson.Gson;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Member;
import com.ha.entity.TB_Review;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class inReviewCon implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
      
      
      String review_content = request.getParameter("review_content");
      int prod_seq=Integer.parseInt(request.getParameter("prod_seq"));
      double ratings=Double.parseDouble(request.getParameter("ratings"));
      System.out.println(review_content);
      
 
      HttpSession session = request.getSession();
      TB_Member member=(TB_Member)session.getAttribute("user");
      String nick = member.getNick();
      
      

      TB_Review review = new TB_Review();

      review.setNick(nick);
      review.setProd_seq(prod_seq);
      review.setRatings(ratings);
      review.setReview_content(review_content);
      
      TB_ReviewDAO dao = new TB_ReviewDAO();
      int num=dao.insert(review);
      
      System.out.println(num);
      
      List<TB_Review> list = dao.select(review);


      response.setContentType("text/plain ; charset=UTF-8");// 프린트 라이터보다 위에서 인코딩을 해줘야 합니다!!
      

      PrintWriter out = response.getWriter();
         
      

      Gson gson = new Gson();
      String json= gson.toJson(list);
         
      
      out.print(json);
      
      
      
      
      return null;
   }

}