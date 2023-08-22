<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HOMEWORK</title>
<link rel="stylesheet" href="payment.css">
<link rel="stylesheet" href="http://mooozi.github.io/css/reset.css%22%3E">


<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
$(document).ready(function() {
    $("#btn_payment").click(function() {
        // class가 btn_payment인 태그를 선택했을 때 작동한다.
        IMP.init('imp33005853');
        
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '기울어진 마라탕', // 결제창에서 보여질 이름
            amount : 2400, // 실제 결제되는 가격
            buyer_email : 'iamport@siot.do',
            buyer_name : '김찬호',
            buyer_tel : '010-1234-5678',
            buyer_addr : '광주 남구 송암로 60',
            buyer_postcode : '123-456'
        }, function(rsp) {
            if (rsp.success) {
            	 jQuery.ajax({
            	        url: "{서버의 결제 정보를 받는 가맹점 endpoint}", //
            	        method: "POST",
            	        headers: { "Content-Type": "application/json" },
            	        data: {
            	          imp_uid: rsp.imp_uid,            // 결제 고유번호
            	          merchant_uid: rsp.merchant_uid   // 주문번호
            	        }
            	      }).done(function (data) {
            	        // 가맹점 서버 결제 API 성공시 로직
            	    	  var msg = '결제가 완료되었습니다.';
            	    	    msg += '고유ID : ' + rsp.imp_uid;
            	    	    msg += '상점 거래ID : ' + rsp.merchant_uid;
            	    	    msg += '결제 금액 : ' + rsp.paid_amount;
            	    	    msg += '카드 승인번호 : ' + rsp.apply_num;
            	      })
            } else {
            	var msg = '결제가 완료되었습니다.';
	    	    msg += '고유ID : ' + rsp.imp_uid;
	    	    msg += '상점 거래ID : ' + rsp.merchant_uid;
	    	    msg += '결제 금액 : ' + rsp.paid_amount;
	    	    msg += '카드 승인번호 : ' + rsp.apply_num;
            }
            alert(msg);
        });
    });


    
    
  /*  var msg = '결제가 완료되었습니다.';
    msg += '고유ID : ' + rsp.imp_uid;
    msg += '상점 거래ID : ' + rsp.merchant_uid;
    msg += '결제 금액 : ' + rsp.paid_amount;
    msg += '카드 승인번호 : ' + rsp.apply_num;*/
    
    

    $("button").click(function() {
        $(":checkbox").attr("checked", "checked");
    });
});

</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.flex-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.container {
	display: flex;
	justify-content: space-between;
	margin: 30px;
}

.delivery, .payment {
	width: 100%;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.payment-method {
	margin-bottom: 20px;
}

.payment-method label {
	margin-right: 10px;
	font-size: 16px;
}

.payment-method img {
	max-width: 100px;
	height: auto;
	vertical-align: middle;
}

td {
	width: 100px;
	height: 50px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

.num>h1 {
	height: 100%;
}

.fr_send {
	text-align: center;
	left: 80px;
}

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

#product>.cart>form>table th>input {
	
}

#product>.cart>form>table tr>td>input {
	
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
	height: 412px;
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

table>tr>td {
	
}

.num {
	
}

.number>h1 {
	
}
</style>

</head>

<body>

	<a class="logo" href="#"> <img src="/PROJECT/pj_images/logogo.png"
		height="75px">
	</a>
	<ul id="menu">
		<li><a href="#home">검색</a></li>
		<li><a href="#html">게시판</a></li>
		<li><a href="#css">장바구니</a></li>
		<li><a href="#javascrript">로그인</a></li>
	</ul>

	<div id="wrapper">
		<main id="product">
			<aside>
				<ul class="category">



				</ul>
			</aside>
		
		<section class="cart">
			<div>
				<h1>주문내역</h1>
				<h1 id="customer">구매자</h1>
			</div>
			<span id="c_name">smhrd</span>
			<div class="flex-container">
				<p>HOME >> 장바구니 >> 주문내역</p>
			</div>

						<form action="#">
							<table border="0">
								<tr>

									<th>상품명</th>
									<th>상품번호</th>
									<th>제품번호</th>
									<th>총수량</th>
									<th>배송비</th>
									<th>소계</th>
								</tr>
								<tr class="empty">
									<td colspan="7">장바구니에 상품이 없습니다.</td>
								</tr>

								<tr class="basket">

									<td>
									<article>
											<a href="#"> <img src="/PROJECT/pj_images/이미지1.jpg"
												alt="1">
											</a>
											<div>
												<h2>
													상품명</a>
												</h2>
												<p>상품설명</p>
											</div>
										</article>
									</td>

									<td class="num">1</td>
									<td class="number">homealone1</td>
									<td>1</td>
									<td class="fr_send">무료배송</td>
									<td>9000</td>
								</tr>
								<tr class="basket">
									<td><article>
											<a href="#"> <img src="/PROJECT/pj_images/이미지2.jpg"
												alt="1">
											</a>
											<div>
												<h2>
													<a>상품명</a>
												</h2>
												<p>상품설명</p>
											</div>
										</article></td>
									<td class="num">2</td>
									<td class="number">homealone2</td>
									<td>1</td>
									<td class="fr_send">무료배송</td>
									<td>9000</td>
								</tr>
								<tr class="basket">
									<td><article>
											<a href="#"> <img src="/PROJECT/pj_images/이미지0.jpg"
												alt="1">
											</a>
											<div>
												<h2>
													<a>상품명</a>
												</h2>
												<p>상품설명</p>
											</div>
										</article></td>
									<td class="num">3</td>
									<td class="number"><span>homealone3</span></td>
									<td>1</td>
									<td class="fr_send"><span>무료배송</span></td>
									<td>9000</td>
								</tr>
							</table>


							<div class="total">
								<h2>최종결제 금액</h2>
								<table>
									<tr>
										<td>상품수</td>
										<td>1</td>
									</tr>
									<tr>
										<td>제품번호</td>
										<td>homealone1</td>
									</tr>
									<tr>
										<td>상품금액</td>
										<td>27,000</td>
									</tr>

									<tr>
										<td>배송비</td>
										<td>0</td>
									</tr>

									<tr>
										<td>전체주문금액</td>
										<td>27,000</td>
									</tr>
								</table>
								<input type="submit" id="btn_payment" value="주문하기">

							</div>
							<div class="container">
								<article class="delivery">

									<h1>배송정보</h1>
									<table>
										<tr>
											<td>주문자</td>
											<td><input type="text" name="orderer"></td>
										</tr>
										<tr>
											<td>휴대폰</td>
											<td><input type="text" name="hp"> <span>-
													포함 입력</span></td>
										</tr>
										<tr>
											<td>우편번호</td>
											<td><input type="text" id="zip" name="zip"> <input
												type="button" onclick="execDaumPostcode()" value="우편번호 검색">
											</td>
										</tr>
										<tr>
											<td>도로명주소</td>
											<td><input type="text" id="roadAddress"
												name="roadAddress"></td>
										</tr>
										<tr>
											<td>상세주소</td>
											<td><input type="text" name="addr2"></td>
										</tr>
									</table>
								</article>
								</div>
								<article class="payment">
									<h1>결제방법</h1>
									<div class="container">
										<article class="payment">
											<h1>결제방법</h1>
											<div class="payment-method">
												<span><font color='royalblue'>신용카드</font></span><br>
														<label> <input type="radio" name="payment"
															value="type1">ISP 결제
													</label> <label> <input type="radio" name="payment"
															value="type2">체크카드 결제
													</label>
											</div>
											<div class="payment-method">
												<span><font color='royalblue'>계좌이체</font></span><br>
														<label> <input type="radio" name="payment"
															value="type3">실시간 계좌이체
													</label> <label> <input type="radio" name="payment"
															value="type4">무통장 입금
													</label>
											</div>
											<div class="payment-method">
												<span><font color='royalblue'>기타</font></span><br>
														<label> <input type="radio" name="payment"
															value="type4">휴대폰 결제
													</label> <label> <input type="radio" name="payment"
															value="type5">카카오페이 <img src="" alt="">
													</label>
											</div>
										</article>
									</div>
							</article>
									<script
										src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
                        function execDaumPostcode() {
                          new daum.Postcode({
                            oncomplete: function(data) {
                              document.getElementById('zip').value = data.zonecode;
                              document.getElementById('roadAddress').value = data.roadAddress;
                            }
                          }).open();
                        }
                      </script>
						</form>
					</section>
				</main>


			</div>

</body>


</html>