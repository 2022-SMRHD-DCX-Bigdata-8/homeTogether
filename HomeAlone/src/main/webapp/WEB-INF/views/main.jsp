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

	<!--  	<br><br><br><br><br><br><br>
		
		<a href="goLogin.do">
		<strong>로그인</strong>
		</a>
		
		<br><br><br><br><br><br><br>
		
		<a href="goJoin.do">
		<strong>가입하기</strong>
		</a>
		
		<br><br><br><br><br><br><br>
		
		<a href="goUpdate.do">
		<strong>회원정보수정</strong>
		</a>
-->
		<% if(user == null){ %>
		<li> <a href="goLogin.do">로그인</a> </li>		
		<li> <a href="goJoin.do">회원가입</a> </li>
	    <% }else{ %>
		<li> <a href="goLogout.do">로그아웃</a> </li>		
		<li> <a href="goUpdate.do">회원정보수정</a> </li>	
		<li> <a href="#">회원탈퇴</a> </li>				
		<% } %>





















