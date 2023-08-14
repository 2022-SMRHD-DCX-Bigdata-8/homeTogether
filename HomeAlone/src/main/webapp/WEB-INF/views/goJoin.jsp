<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


			<br><br><br><br><br>
				
				
			<li><h5>회원가입</h5></li>
			<form action="join.do" method="post">
				<li><input id="checkInput" type="text"
					placeholder="ID를 입력하세요" name="id"></li>
				<p id="checkResult"></p>
				<li><input type="password" placeholder="PW를 입력하세요" name="pw"></li>
				<li><input type="text" placeholder="닉네임을 입력하세요" name="nick"></li>
				<li><input type="text" placeholder="주소를 입력하세요" name="addr"></li>
				<li><input type="text" placeholder="전화번호를 입력하세요" name="phone"></li>
			  남<input type="radio" name="gender" value="M">
              여<input type="radio" name="gender" value="W">
				<li><input type="submit" value="가입하기" class="button fit"></li>
			</form>	
				
				 
				
				


</body>
</html>