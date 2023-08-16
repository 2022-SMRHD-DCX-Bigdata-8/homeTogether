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
	
		HttpSession sesion = request.getSession();
		TB_Member member=(TB_Member)sesion.getAttribute("user");
		String nick=member.getNick();
		
	%>
	
		<p id="pNumber" value="0001">0001</p>
		<p id="pCnt" value="1">1</p>>
		<p id="pName" value="책상">책상</p>
		<p id="pPrice" value="10000">10000</p>
		<br>
		<li><button id="damgi" >담기</button></li>
	
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$('#damgi').on('click', inCart );
	});
	
	function inCart(){
		let p_cnt =$('#pCnt').text();
		let p_name =$('#pName').text();
		let p_number=$('#pNumber').text();
		let p_price =$('#pPrice').text();
		let nick = ${nick};
		
		$.ajax({
			url : 'inCart.do',
			type: 'post',
			data: {
				"p_cnt" : p_cnt
				"p_number" : p_number
				"p_name" : p_name
				"nick" :  nick
				"p_price" : p_price
			},
			dataType: 'json',
			success : function(res){
				
				console.log('성공!!');
					
					
				}
				
			},
			error :  function(e){
				console.log('요청실패!!!');
			}
			
		});
	
	
		
		
	</script>
</body>
</html>
	