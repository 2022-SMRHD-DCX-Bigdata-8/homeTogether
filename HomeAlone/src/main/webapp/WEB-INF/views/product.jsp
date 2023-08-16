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


	<p id="pNumber" data-value="5">0001</p>
	<p id="pCnt" data-value="1">1</p>
	<p id="pName" data-value="Gaming Mouse">책상</p>
	<p id="pPrice" data-value="45000">10000</p>

	<br>
	<li><button id="damgi">담기</button></li>

	<li><input type="text" id="content"></li>
	<li><input type="number" id="ratings" step="0.1"></li>
	<li><button id="insert">올리기</button></li>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#damgi').on('click', inCart);
			$('#insert').on('click', inReview);
		});

		function inCart() {
			let p_cnt = $('#pCnt').data('value');
			let p_name = $('#pName').data('value');
			let p_number = $('#pNumber').data('value');
			let p_price = $('#pPrice').data('value');

			$.ajax({
				url : 'inCart.do',
				type : 'post',
				data : {
					"p_cnt" : p_cnt,
					"p_number" : p_number,
					"p_name" : p_name,
					"p_price" : p_price
				},
				dataType : 'json',
				success : function(res) {

					console.log('성공!!');

				},

				error : function(e) {
					console.log('요청실패1!!!');
				}

			});
		}

		function inReview() {
			let content = $('#content').val();
			let p_number = $('#pNumber').data('value');
			let ratings = $('#ratings').val();

			$.ajax({
				url : 'inReview.do',
				type : 'post',
				data : {
					"content" : content,
					"p_number" : p_number,
					"ratings" : ratings,

				},
				dataType : 'json',
				success : function(res) {

					console.log('성공!!');

				},
				error : function(e) {
					console.log('요청실패2!!!');

				}

			});
		}
	</script>
</body>
</html>
