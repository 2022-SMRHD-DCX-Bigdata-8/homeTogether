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

	

			<% 	// 아이디를 띄우기 위해 세션 사용
				TB_Member user = (TB_Member)session.getAttribute("user");
			%>
			
			<h2><%= user.getId()%>님! 회원 탈퇴를 원하시면 비밀번호를 입력해주세요</h2>
			<form action="delete.do" method="post">
			<input type="password" name="pw">
			<input type="submit" value="회원 탈퇴">		
			</form>







</body>
</html>