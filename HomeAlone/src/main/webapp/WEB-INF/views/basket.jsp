<%@page import="java.util.ArrayList"%>
<%@page import="com.ha.entity.TB_Basket"%>
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
	HttpSession sesion = request.getSession();
	ArrayList<TB_Basket> list = (ArrayList<TB_Basket>)sesion.getAttribute("basket");
	
	%>
	<div>
		<table >
			<tr>
				<td>상품명</td>
				<td>상품가격</td>
				<td>상품수량</td>
				<td>상품가격</td>
			</tr>
			<tr>
				<td>${list[0].P_name}</td>
				<td>${list[0].P_price}</td>
				<td>${list[0].P_cnt}</td>
				<td>${list[0].P_price}</td>		
			</tr>				
			
		</table>
	</div>
	
	

</body>
</html>