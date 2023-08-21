<%@page import="com.ha.entity.TB_Member"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ha.entity.TB_Basket"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>HOMEWORK</title>
<link rel="stylesheet" href="assets/css/basket_complete.css">
<link rel="stylesheet"
	href="http://mooozi.github.io/css/reset.css%22%3E">

<meta name="viewport" content="width=device-width, initial-scale=1">


<style>
#product>.cart>form>table {
	width: 100%;
	border-bottom: 1px solid #d3d3d3;
	border-collapse: collapse;
	border-spacing: 0;
}

#product>.cart>form>table tr {
	border-bottom: 1px solid #d3d3d3;
}

#product>.cart>form>table th:first-child {
	width: 60px;
}

#product>.cart>form>table th {
	padding: 12px 0;
	border-top: 2px solid #000;
	border-bottom: 1px solid #d3d3d3;
	background: #fff;
	color: #383838;
	font-size: 0.95em;
	text-align: center;
	letter-spacing: -0.1em;
}

#product>.cart>form>table .empty {
	display: none;
}

#product>.cart>form>table td {
	text-align: center;
}

#product>.cart>form>table td:last-child {
	color: #ff006c;
	font-weight: bold;
}

#product>.cart>form>table td>article {
	padding: 6px;
	overflow: hidden;
}

#product>.cart>form>table td>article>a {
	float: left;
	display: inline-block;
}

#product>.cart>form>table td>article>a>img {
	width: 80px;
}

#product>.cart>form>table td>article>div {
	float: left;
	margin-left: 10px;
}

#product>.cart>form>table td>article>div>h2 {
	text-align: left;
}

#product>.cart>form>table td>article>div>p {
	text-align: left;
	color: #777;
	margin-top: 4px;
}

#product>.cart>form>input[name=del] {
	border-color: #bdbdbd;
	border-bottom-color: #828282;
	background: #fafafa;
	color: #4d4d4d;
	padding: 6px 11px;
	border-width: 1px;
	margin-top: 6px;
}

#product>.cart>form>.total {
	float: right;
	width: 360px;
	padding: 20px;
	margin-top: 12px;
	background: #fff;
	border: 1px solid #d3d3d3;
	box-sizing: border-box;
}

#product>.cart>form>.total>h2 {
	width: 100%;
	font-weight: bold;
	font-size: 16px;
	border-bottom: 1px solid #111;
	margin-bottom: 10px;
	padding-bottom: 10px;
	box-sizing: border-box;
	color: #1e1e1e;
}

#product>.cart>form>.total>table {
	width: 100%;
}

#product>.cart>form>.total>table tr:nth-last-child(1) td {
	font-size: 20px;
}

#product>.cart>form>.total>table tr:nth-last-child(1) td:last-child {
	color: #ff006c;
	font-size: 20px;
	font-weight: bold;
}

#product>.cart>form>.total>table td {
	padding: 10px 0;
	font-size: 14px;
	color: #555;
}

#product>.cart>form>.total>table td:last-child {
	text-align: right;
}

#product>.cart>form>.total>input[type=submit] {
	width: 100%;
	height: 56px;
	font-size: 26px;
	border-width: 1px;
	border-color: #d81818;
	border-bottom-color: #9e1212;
	background: #ed2f2f;
	background-image: -webkit-linear-gradient(#ed2f2f, #dd0e0e);
	color: #fff;
	box-sizing: border-box;
	margin-top: 10px;
}

.cart {
	margin-top: 40px;
}
</style>
</head>




<body>
	<div class="navbar">
		<a class="logo" href="main.do"> <img src="img/logo/image2.png"
			height="75px">
		</a>
		<ul id="menu">
			<li><a href="#home">검색</a></li>
			<li><a href="#html">게시판</a></li>
			<li><a href="#css">장바구니</a></li>
			<li id="goLogin"><a href="#javascrript">로그인</a></li>
		</ul>
	</div>

	</div>
	<main id="product">
		<div id="wrapper">
			<header>
				<div class="top">
			</header>
			<main id="product">
				<section class="cart">
					<div>
						<h1>장바구니</h1>
						<h1 id="customer">구매자</h1>
					</div>
					<div id="wrap">

						<div id="span_block">
							<span id="c_name">${user_name}</span>
						</div>


						<div class="flex-container">
							<p>HOME >> 장바구니</p>
						</div>
					</div>






					<form action="#">
						<table>
							<tr id="selectAll">
								<td id="selectAll"><input type="checkbox"
									onclick="toggleAll(this)"></td>
								<th>상품명</th>
								<th>상품번호</th>
								<th>제품번호</th>
								<th>총수량</th>
								<th>배송비</th>
								<th>소계</th>
							</tr>
							<c:if test="${list_empty}">
								<tr class="basket">
									<td colspan="7">장바구니에 상품이없습니다</td>
								</tr>
							</c:if>

							<c:if test="${!list_empty}">
								<c:forEach var="list" items="${sessionScope.basket}">

									<tr class="basket">
										<td><input type="checkbox" name="1" data-product-id="${list.prod_seq}"></td>
										<td>
											<article>
												<a href="goProduct.do?prod_seq=${list.prod_seq}"> <img
													src="img/test/KakaoTalk_20230817_155756756_0${list.prod_seq}.jpg"
													alt="1">
												</a>
												<div>
													<h2>
														<a href="goProduct.do?prod_seq=${list.prod_seq}">${list.prod_name}</a>
													</h2>
													<p>상품설명</p>
												</div>
											</article>
										</td>

										<td><span></span></td>
										<td class="number"><span>${list.prod_seq}</span></td>
										<td><span>${list.prod_cnt}개</span></td>
										<td class="fr_send"><span>무료배송</span></td>
										<td id="price"><span>${list.prod_price * list.prod_cnt }원</span></td>
									</tr>
								</c:forEach>
							</c:if>

						</table>

						<input type="button" name="del" value="선택삭제"
							onclick="deleteSelected()">

						<div class="total">
							<h2>전체합계</h2>
							<table>
								<tr>
									<td>상품개수</td>
									<td id="selectedCount"></td>
								</tr>
								<tr>
									<td>상품금액</td>

									<td id="productsPrice"></td>

								</tr>

								<tr>
									<td>배송비</td>
									<td>무료배송</td>
								</tr>

								<tr>
									<td>전체주문금액</td>
									<td id="totalPrice"></td>
								</tr>
							</table>
							<input type="submit" value="주문하기">
						</div>
					</form>

					<div id="ad">
						<p>추천 상품</p>
						<div>
							<a href=""><img src="img/shopa/이미지10.jpg" alt="쇼파1"></a> <strong>제품
								이름입니다만</strong><br> <strong>제품 가격인데 얼마임?</strong>
						</div>
						<div>
							<a href=""><img src="img/shopa/이미지14.jpg" alt="쇼파2"></a> <strong>제품
								이름</strong><br> <strong>제품 가격</strong>
						</div>
						<div>
							<a href=""><img src="img/shopa/이미지11.jpg" alt="쇼파3"></a> <strong>제품
								이름</strong><br> <strong>제품 가격</strong>
						</div>
					</div>
				</section>
			</main>

		</div>
		
		
		<script src="assets/js/products.js"></script>
		<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
		
		<script>
			$(function() {
				$("button").click(function() {
					$(":checkbox").attr("checked", "checked")
				})
			});
		</script>

		<script>
			function toggleAll(source) {
				var checkboxes = document
						.querySelectorAll('input[type="checkbox"]');
				for (var i = 0; i < checkboxes.length; i++) {
					if (checkboxes[i] !== source) {
						checkboxes[i].checked = source.checked;
					}
				}
			}

			function deleteSelected() {
				//전체선택 체크박스 누르고 선택삭제했을때  전체선택 체크박스에 체크상태로 남아있었는데
				//체크 풀어주는 코드
				var selectAllCheckbox = document
						.querySelector('#selectAll input[type="checkbox"]');
				selectAllCheckbox.checked = false;

				var checkboxes = document
						.querySelectorAll('input[type="checkbox"]:checked');
				var selectAllCheckbox = document
						.querySelector('#selectAll input[type="checkbox"]');
				
				var checkedProducts = [];
				
				
		        	
		        
				console.log("성공");
				// 체크박스 상품 사라지게하는 code !!!전체선택 체크박스 <tr>태그는 사라지지않게!! 
				for (var i = 0; i < checkboxes.length; i++) {
					
					checkedProducts.push(checkboxes[i].getAttribute('data-product-id'));
					
					var row = checkboxes[i].parentNode.parentNode;
					if (row !== selectAllCheckbox.closest('tr')) {
						row.remove();
					}
				}
				
				updateSelectedCount(); // 선택된 상품 개수 업데이트
				updateTotalPrice(); // 가격 업데이트
				
				var checkedProductsString = checkedProducts.join(',');
					//리스트에 정보가 담겨있을때  ajax실행
		        if (checkedProducts.length > 0) {
		            $.ajax({
		                url: "deleteCart.do", // 장바구니 세션에서 상품지우는 컨트롤러
		                type: 'POST',
		                
		                data: { "checkedProductsString" : checkedProductsString },
		                success: function(res) {
		                	if (res === "true") {		                    
		                    var td  = "<tr class='basket'>";
		                    td += "<td colspan='7'>"		                      
							td +="장바구니에 상품이없습니다"
							td +="</td></tr>"
							 
		                      
							$('#selectAll').after(td);
							console.log("상품이없습니다!")
		                	}else{
		                		
		                	}
		                    console.log("상품이없습니다!")
		                    
		                },
		                error: function(e) {
		                    console.log('요청실패!!!');
		                }
		            });
		        }else{
		        	console.log("실패");
		        }

			}
		</script>


		<script>
			// 체크 표시했을때 가격 올라가는 코드
			function updateTotalPrice() {
				var checkboxes = document
						.querySelectorAll('input[type="checkbox"]:checked');
				var total = 0;

				for (var i = 0; i < checkboxes.length; i++) {
					var row = checkboxes[i].parentNode.parentNode;
					var priceCell = row.querySelector('#price'); // 가격이 들어있는 열 선택

					if (priceCell) {
						var price = parseInt(priceCell.textContent.replace(
								/[^0-9]/g, '')); // 문자열에서 숫자 추출
						total += price;
					}
				}
				document.getElementById('productsPrice').textContent = total
						.toLocaleString()
						+ '원';
				document.getElementById('totalPrice').textContent = total
						.toLocaleString()
						+ '원'; // 총 가격 표시
			}

			$(function() {
				$("button").click(function() {
					$(":checkbox").attr("checked", "checked");
					updateTotalPrice();
				});

				$(":checkbox").click(function() {
					updateTotalPrice();
				});
			});
		</script>
		<script>
			//체크했을때 체크한 상품개수 올라가는 메서드

			function updateSelectedCount() {
				var checkboxes = document
						.querySelectorAll('input[type="checkbox"]');
				var selectedCheckboxes = document
						.querySelectorAll('input[type="checkbox"]:checked');
				var selectedCount = selectedCheckboxes.length;
				var totalCount = checkboxes.length;

				if (selectedCount === totalCount) {
					document.getElementById('selectedCount').textContent = (selectedCount - 1)
							+ '개';
				} else {
					document.getElementById('selectedCount').textContent = selectedCount
							+ '개';
				}
			}

			//체크박스 클릭했을때 체크되는 함수
			$(function() {
				$("button").click(function() {
					$(":checkbox").attr("checked", "checked");
					updateSelectedCount();
				});

				$(":checkbox").click(function() {
					updateSelectedCount();
				});
			});
		</script>
</body>

</html>