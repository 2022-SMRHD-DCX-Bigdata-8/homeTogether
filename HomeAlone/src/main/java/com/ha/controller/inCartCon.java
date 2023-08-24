package com.ha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ha.entity.TB_Basket;

public class inCartCon implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        ArrayList<TB_Basket> basket_List = (ArrayList<TB_Basket>) session.getAttribute("basket");
        int prod_seq = Integer.parseInt(request.getParameter("prod_seq")); // 상품 번호
        int prod_cnt = Integer.parseInt(request.getParameter("prod_cnt")); // 상품 수량
        String prod_name = request.getParameter("prod_name"); // 상품 이름
        String prod_img = request.getParameter("prod_img");
        int prod_price = Integer.parseInt(request.getParameter("prod_price"));

        TB_Basket basket = new TB_Basket(prod_cnt, prod_seq, prod_name, prod_price, prod_img);
        System.out.println(basket);

        if (basket_List == null) {
            System.out.println("트루");
            basket_List = new ArrayList<>();
            basket_List.add(basket);
            session.setAttribute("basket", basket_List);
            System.out.println(basket_List.size());
        } else {
            System.out.println("엘스");

            System.out.println(basket_List.size());

            ArrayList<TB_Basket> newBasketList = new ArrayList<>(); // 새로운 리스트 생성

            for (int i = 0; i < basket_List.size(); i++) {
                if (basket.getProd_seq() == basket_List.get(i).getProd_seq()) {
                    System.out.println("장바구니에 같은상품이있네");

                    prod_cnt = basket.getProd_cnt() + basket_List.get(i).getProd_cnt();
                    prod_price = basket.getProd_price() + basket_List.get(i).getProd_price();

                    basket.setProd_cnt(prod_cnt);
                    basket.setProd_price(prod_price);
                    System.out.println(basket_List.get(i));

                    // 기존 상품은 추가하지 않고 넘어감

                    System.out.println("장바구니에 같은상품이있네");
                } else {
                    System.out.println("장바구니에 같은상품이없네");
                    newBasketList.add(basket_List.get(i)); // 새로운 리스트에 추가

                    System.out.println("장바구니에 같은상품이없네");
                }
            }

            // 새로운 상품을 추가
            newBasketList.add(basket);

            session.setAttribute("basket", newBasketList); // 새로운 리스트를 세션에 저장
        }
        
        

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print("true");

        return null;
    }
}