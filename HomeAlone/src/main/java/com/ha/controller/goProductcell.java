package com.ha.controller;

import com.ha.dao.TB_AnswerDAO;
import com.ha.dao.TB_ProductDAO;
import com.ha.dao.TB_QNADAO;
import com.ha.dao.TB_ReviewDAO;
import com.ha.entity.TB_Answer;
import com.ha.entity.TB_Product;
import com.ha.entity.TB_QNA;
import com.ha.entity.TB_Review;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class goProductcell implements Controller {

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {      

      int prod_seq =Integer.parseInt(request.getParameter("prod_seq"));
      TB_ProductDAO dao = new TB_ProductDAO();
      TB_Product product = dao.productName(prod_seq);
      
      
      
      

      
      
      TB_ReviewDAO reviewdao = new TB_ReviewDAO();
      TB_QNADAO qnadao = new TB_QNADAO();
      TB_AnswerDAO answerdao = new TB_AnswerDAO();
      
      TB_Review review = new TB_Review();
      TB_QNA qna = new TB_QNA();
      TB_Answer answer = new TB_Answer();
      
      review.setProd_seq(prod_seq);
      qna.setProd_seq(prod_seq);
      answer.setProd_seq(prod_seq);
      
      List<TB_Review> list = reviewdao.select(review);
      List<TB_Answer>a_list = answerdao.selectAnswer(answer);
      List<TB_QNA>qnalist = qnadao.selectQNA(qna);
      
      request.setAttribute("review", list);
      request.setAttribute("qna", qnalist);
      request.setAttribute("answer", a_list);
      request.setAttribute("product", product);


      
      
      return "productcell";
   }

}