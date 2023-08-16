<%@page import="com.ha.entity.TB_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 세션에 있는 값 가져와서 user 변수에 값 담기
	 TB_Member user=(TB_Member)session.getAttribute("user");
		
	%>
	
</body>
</html>	


		<% if(user == null){ %>
		<li> <a href="goLogin.do">로그인</a> </li>		
		<li> <a href="goJoin.do">회원가입</a> </li>
	    <% }else{ %>
		<li> <a href="goLogout.do">로그아웃</a> </li>		
		<li> <a href="goUpdate.do">회원정보수정</a> </li>
		<li> <a href="goProduct.do">상품</a></li>
		<li> <a href="goBasket.do">장바구니</a></li>
		<% } %>





















