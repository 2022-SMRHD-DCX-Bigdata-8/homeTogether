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
<table border="2">
	<tr>
		<td>상품 번호</td>		
		<td>상품 갯수 </td>		
		<td>상품 이름</td>		
		<td>상품 가격</td>		
	</tr>
	<tr>
		<td><p id="pNumber" data-value="5">p-5</p></td>
		<td><p id="pCnt" data-value="1">1</p></td>
		<td><p id="pName" data-value="Gaming Mouse">Gaming Mouse</p></td>
		<td><p id="pPrice" data-value="45000">45000</p></td>
	</tr>
</table>
	<br>
	<li> 장바구니 <button id="damgi">담기</button></li>

	<li>댓글 : <input type="text" id="content"></li>
	<li>평점 : <input type="number" id="ratings" step="0.5" min="0" max="5"></li>


	<li><button id="insert">올리기</button></li>

	<p>=========================================================================================================================</p>

	

































	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script type="text/javascript">

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
                console.log('성공!!');
            },
            error: function(e){
                console.log('요청실패!!!');
            }
        });
    }
    </script>

</body>


</html>


