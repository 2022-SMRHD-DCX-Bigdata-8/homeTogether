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
	<h1>회원정보수정</h1>
	<%
	 
	 
	 TB_Member member=(TB_Member)session.getAttribute("user");
	 
	%>
	<form action="update.do" method="post">
		ID: <input readonly type="text" name="id" value=<%=member.getId() %>><br>
		PW: <input type="password" name="pw" value=<%=member.getPw() %>><br>
		ADDRESS : <input type="text" name="addr" >
		GENDER : 남<input type="radio" name="gender" value="M" >
				 여<input type="radio" name="gender" value="W" ><br>
		NICK : <input readonly type="text" name="nick" value=<%=member.getNick() %>><br>
		TEL : <input type="tel" name="tel" value=<%=member.getPhone() %>><br>
		<input type="submit" value="회원정보수정">
	</form>

</body>
</html>