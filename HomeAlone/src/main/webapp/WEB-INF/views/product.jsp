<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.ha.entity.TB_Review"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ha.entity.TB_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>



	<% 	ArrayList<TB_Review> list = (ArrayList<TB_Review>)session.getAttribute("list"); 
	 
	%>



<body>
	<h1>상품 정보</h1>
	<table border="2">
		<tr>
			<td>상품 번호</td>
			<td>상품 갯수</td>
			<td>상품 이름</td>
			<td>상품 가격</td>
		</tr>
		<tr>
			<td><p id="pNumber" data-value="5">p-5</p></td>
			<td><p id="pCnt" data-value="1">1</p></td>
			<td><p id="pName" data-value="Gaming Mouse">Gaming Mouse</p></td>
			<td><p id="pPrice" data-value="45000">45000</p></td>
		</tr>
		<tr>
			<td>상품 평</td>
			<td>23개</td>
		</tr>
		<tr>
			<td>별점</td>
			<td>2.7</td>
		</tr>
	</table>
	<br>
	<li>장바구니
		<button id="damgi">담기</button>
	</li>



	<p>=========================================================================================================================</p>
	<h1>상품 평</h1>

	<li>댓글 : <input type="text" id="content"></li>
	<li>평점 : <input type="number" id="ratings" step="0.5" min="0"
		max="5"></li>
	<br>
	<li><button id="insert">올리기</button></li>
	<br>

	<table border="2">
		<tr>
			<td>닉네임</td>
			<td>리뷰 내용</td>
			<td>별점</td>
		</tr>

		<tbody id="tbd">
		<% if(list != null){ %>  
				
    <c:forEach var="review" items="${list}">
        <tr>
            <td>${review.nick}</td>
            <td>${review.content}</td>
            <td>${review.ratings}</td>
        </tr>
    </c:forEach>

		<%
		} else {
		%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>

		<%} %>   
		</tbody>


	</table>


	<p>=========================================================================================================================</p>
	<h1>상품문의</h1>


	<table border="2">
		<tr>
			<td>질문자</td>
			<td>문의 내용</td>
		</tr>
		<tr>
			<td><p id="qNickname" data-value="user123">${review.nick}</p></td>
			<td><textarea id="qContent" rows="4" cols="50"></textarea></td>
		</tr>
	</table>
	<br>
	<button id="askQuestion">문의하기</button>
	<br>















	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#damgi').on('click', inCart);
			$('#insert').on('click', inReview);
		});
		
		<script type="text/javascript">
	    $(document).ready(function() {
	        $('#damgi').on('click', inCart);
	        $('#insert').on('click', inReview);
	        $('#askQuestion').on('click', askQuestion);
	    });
		
		
		

<<<<<<< HEAD

    $(document).ready(function(){
        $('#damgi').on('click', inCart);
        $('#insert').on('click', inReview);
    });
    
    function inCart(){
        let p_cnt = $('#pCnt').data('value');
        let p_name = $('#pName').data('value');
        let p_number = $('#pNumber').data('value');
        let p_price = $('#pPrice').data('value');
        
        $.ajax({
            url : 'inCart.do',
            type: 'post',
            data: {
                "p_cnt": p_cnt,
                "p_number": p_number,
                "p_name": p_name,
                "p_price": p_price
            },
            dataType: 'json',
            success: function(res){
                console.log('성공!!');
            },
            error: function(e){
                console.log('요청실패!!!');
            }
        });
    }
    
    function inReview(){
        let content = $('#content').val();
        let p_number = $('#pNumber').data('value');
        let ratings = $('#ratings').val();
        
        $.ajax({
            url : 'inReview.do',
            type: 'post',
            data: {
                "content": content,
                "p_number": p_number,
                "ratings": ratings
            },
            dataType: 'json',
            success: function(res){
            	
            	let tbody=$('#tbd');
				tbody.html('');
				
				for(let i =0; i<res.length; i++){
					
					tr= "<tr>";
					tr += "<td>"+res[i].nick+"</td>"
					tr += "<td>"+res[i].content+"</td>"
					tr += "<td>"+res[i].ratings+"</td>"
					tr +="</tr>";
					
					// html('code') :덮어쓰기
					// after('code'):닫는태그 바로뒤에 추가
					// before('code'):여는태그 바로앞에 추가
					// append('code'):자식요소로 추가
					tbody.append(tr);
					
                        	
            	
            	
            },
            error: function(e){
                console.log('요청실패!!!');
            }
        });
    
        }

		
	</script>



</body>


</html>


