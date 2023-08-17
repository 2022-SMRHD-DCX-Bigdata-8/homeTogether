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
	
	%>
	<div>
		<table border="1" >
			<tr>
				<td>상품명</td>
				<td>상품가격</td>
				<td>상품수량</td>
				<td>상품번호</td>
				
			</tr>
			<% if(list !=null) {%>
			<%for(int i = 0 ; i<list.size();i++) {%>
			<tr>
				<td><%=list.get(i).getP_name() %></td>
				<td><%=list.get(i).getP_price()%> </td>
				<td><%=list.get(i).getP_cnt()%></td>
				<td><%=list.get(i).getP_number()%></td>
				
				
			</tr>
			<%} %>				
			<%}else{ %>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				
			</tr>
			<%}; %>
			
		</table>
	</div>
	
	

</body>
</html>