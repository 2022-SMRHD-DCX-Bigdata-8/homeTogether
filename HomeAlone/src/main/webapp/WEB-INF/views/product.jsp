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
	
		<p id="pNumber" value="0001">p0001</p>
		<p id="pCnt" value="1">1개</p>>
		<li><button id="damgi" >담기</button></li>
	
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$('#damgi').on('click', inCart );
	});
	
	function inCart(){
		let pCnt =$('#pCnt').val();
		let name =$('#pNumber').val();
		let nick = <%= nick %>
		
		$.ajax({
			url : 'inCart.do',
			type: 'post',
			data: {
				"pCnt" : pCnt
				"pNumber" : pNumber
				"nick" :  nick
			},
			dataType: 'json',
			success : function(res){
				
				
					
					
				}
				
			},
			error :  function(e){
				console.log('요청실패!!!');
			}
			
		});
	
	
		
		
	</script>
</body>
</html>
	