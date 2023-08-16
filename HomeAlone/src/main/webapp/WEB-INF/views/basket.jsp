<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	
	ArrayList<TB_Basket> list = (ArrayList<TB_Basket>)session.getAttribute("basket");
	
	out.print(list.get(0));
	

	
	%>
	<div>
		<table >
			<tr>
				<td>상품명</td>
				<td>상품가격</td>
				<td>상품수량</td>
				<td>상품번호</td>
				
			</tr>
			
			<tr>
				<td><%=list.get(0).getP_name() %></td>
				<td><%=list.get(0).getP_price()%> </td>
				<td><%=list.get(0).getP_cnt()%></td>
				<td><%=list.get(0).getP_number()%></td>
				
				
			</tr>				
			
		</table>
	</div>
	
	

</body>
</html>