<%@page import="java.util.List"%>
<%@page import="com.ha.entity.TB_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>HomeTogether</title>
<link rel="stylesheet" href="assets/css/basket_complete.css">
<style>
/* 로그인창 */

/* 아이콘 */
#del {
	width: 80px;
	height: 80px;
	float: right;
	opacity: 50%;
}

#del>img {
	width: 100%;
}

#back {
	position: fixed;
	width: 80px;
	float: left;
	top: 50%;
	left: 67%;
	transform: translateY(-50%);
	opacity: 0%;
}

#back>img {
	width: 100%;
	opacity: 0%;
}

/* 아이콘 끝 */
#login_view>form>h1 {
	color: #b2b278;
	font-size: 24px;
}

#login_view {
	z-index: 1;
	position: fixed;
	opacity: 100%;
	background-color: #f3f3e6;
	height: 100%;
	right: 0px;
	opacity: 98%;
	width: 0%;
}

#login_view>form>h1 {
	margin-bottom: 20px;
}

#login_view>form>table {
	margin: 14px auto;
}

#login>tbody>tr>td {
	padding-top: 15px;
	border: none;
}

#login>tbody>tr>:first-child {
	padding-right: 20px;
}

#login input[type=text], #login input[type=password], #join input {
	border-radius: 10px;
	height: 30px;
	border: 1px solid #b2b278;
}

#login input:focus {
	background-color: lemonchiffon;
}

/* 로그인창 끝*/
#login_h1 {
	margin: 45px auto 0px;
	width: 225px;
}

#join {
	width: 350px;
}

/* 회원가입 */
#join_h1 {
	margin: 45px auto 10px;
	width: 225px;
	color: #b2b278;
	font-size: 24px;
}

#join>tbody {
	padding-left: 80px;
	display: block;
}

#join>tbody>tr {
	margin: 0 auto;
	box-sizing: border-box;
}

#join>tbody>tr>:last-child {
	padding-left: 10px;
}

#join>tbody>:last-child>td>button {
	margin-top: 20px;
}

#join>tbody>tr>td {
	padding-top: 10px;
	box-sizing: border-box;
}

input[type=radio] {
	margin-left: 30px;
}

/* 회원가입 끝 */

/* radio 버튼 */
.test_obj input[type="radio"] {
	display: none;
}

.test_obj input[type="radio"]+span {
	display: inline-block;
	padding: 15px 10px;
	border: 1px solid #b2b278;
	border-radius: 50%;
	background-color: #ffffff;
	text-align: center;
	cursor: pointer;
}

.test_obj input[type="radio"]:checked+span {
	background-color: #b2b278;
	color: #ffffff;
}

.test_obj {
	margin-left: 10px;
}

/* radio 버튼 끝 */

/* 버튼 */
#post_btn {
	background-color: #b2b278;
	color: white;
}

#login_btn {
	padding-right: 0px !important;
	padding-left: 0px !important;
}

button {
	background: #b2b278;
	color: #fff;
	border: none;
	position: relative;
	height: 40px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	box-sizing: border-box;
	width: 100%;
}

button:hover {
	background: #fff;
	color: #b2b278;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #b2b278;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

/* 버튼 끝 */
#product>.complete>article {
	margin-top: 16px;
}

#product>.complete>.message>h2 {
	font-size: 32px;
	font-weight: bold;
	text-align: center;
	color: gray;
	padding: 10px;
}

#product>.complete>.message>h2>i {
	font-size: 26px;
}

#product>.complete>.message>p {
	font-size: 18px;
	font-weight: bold;
	padding: 10px;
	text-align: center;
}

#product>.complete>article {
	margin-top: 16px;
}

#product>.complete>article>h1 {
	font-weight: bold;
	font-size: 18px;
	color: #111;
	padding: 6px 0;
}

#product>.complete table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	border-top: 2px solid #000;
}

#product>.complete table tr {
	border-bottom: 1px solid #d3d3d3;
}

#product>.complete table tr>th {
	padding: 12px 0;
	background: #fff;
	color: #383838;
	font-size: 0.95em;
	text-align: center;
	letter-spacing: -0.1em;
}

/* 상품정보 */
#product>.complete>.info>table tr>th:last-child {
	width: 200px;
}

#product>.complete>.info table tr>td {
	text-align: center;
}

#product>.complete>.info table tr>td:last-child {
	color: #ff006c;
	font-weight: bold;
	text-align: right;
}

#product>.complete>.info table tr>td>article {
	overflow: hidden;
	padding: 6px;
}

#product>.complete>.info table tr>td img {
	float: left;
	width: 100px;
}

#product>.complete>.info table tr>td div {
	float: left;
	margin-left: 10px;
	text-align: left;
}

#product>.complete>.info table tr>td div>p {
	text-align: left;
	color: #777;
	margin-top: 4px;
}

#product>.complete>.info .total>td>table {
	border: none;
}

#product>.complete>.info .total>td>table tr {
	border: none;
}

#product>.complete>.info .total>td>table td {
	text-align: right;
	color: #111;
	background: #f2f2f2;
	font-weight: normal;
	border-bottom: none;
	padding: 10px;
	box-sizing: border-box;
}

.info>:first-child, #customer {
	font-size: 20px !important;
}

#product>.complete>.info .total>td>table tr:last-child span {
	font-weight: bold;
	color: #ff006c;
}

/* 주문정보 */
.order, .delivery {
	width: 40% !important;
}

#product>.complete>.order table tr>td {
	padding: 10px;
	box-sizing: border-box;
}

#product>.complete>.order>table tr>td:nth-child(1) {
	width: 160px;
	background: #f2f2f2;
}

#product>.complete>.order table tr>td:nth-child(2) {
	width: auto;
}

#product>.complete>.order table tr>td:nth-child(3) {
	width: 100px;
	text-align: right;
	vertical-align: top;
	background: #f2f2f2;
}

#product>.complete>.order table tr>td:nth-child(4) {
	width: 100px;
	text-align: right;
	vertical-align: top;
	background: #f2f2f2;
}

#product>.complete>.order table span {
	font-weight: bold;
	color: #ff006c;
}

/* 배송정보 */
#product>.complete>.delivery table tr>td:nth-child(1) {
	width: 160px;
	background: #f2f2f2;
}

#product>.complete>.delivery table tr>td {
	padding: 10px;
	box-sizing: border-box;
}

#product>.complete>.delivery table tr>td:nth-child(3) {
	width: 200px;
	background: #f2f2f2;
}

/* 꼭 알아두세요 */
#product>.complete>.alert {
	width: 100%;
	background-color: #f7f7f7;
	padding: 10px;
	padding-left: 24px;
	color: #999;
	box-sizing: border-box;
}

#product>.complete>.alert>h1 {
	margin-left: -12px;
}

#product>.complete>.alert>ul {
	list-style: inherit;
}

#product>.complete>.alert>ul>li {
	line-height: 20px;
}

#product>.complete>.alert>ul>li>span {
	position: relative;
	left: -6px;
}

input[type="submit"] {
	padding: 10px 20px;
	background-color: black;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 18px;
}

.logo-container {
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: left;
	padding: 10px;
	margin-bottom: 80px;
	margin-top: 20px;
}

.total {
	margin: 20px 0px;
	border-bottom: none !important;
}

.total table {
	margin: 20px 0px !important;
}
</style>
</head>

<body>

<%
   TB_Member user = (TB_Member) session.getAttribute("user");
List<String>buyer = (List<String>)session.getAttribute("buyer");
   %>
	<div id="login_view">
		<div id="back">
			<img src="img/icon/back.png">
		</div>
		<form action="login.do" method="post">
			<h1 id="login_h1">로그인</h1>
			<table id="login">
				<tbody>
					<tr>
						<td>ID</td>
						<td><input type="text" placeholder="아이디를 입력해주세요"></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" placeholder="비밀번호를 입력해주세요"></td>
					</tr>
					<tr>
						<td id="login_btn" colspan="2"><button>LOGIN</button></td>
					</tr>
				</tbody>
			</table>
		</form>
		<h1 id="join_h1">회원가입</h1>

		<form action="join.do" method="post">
			<table id="join">
				<tbody>
					<tr>
						<td>ID</td>
						<td><input type="text" placeholder="아이디를 입력해주세요"></td>
						<td></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" placeholder="비밀번호를 입력해주세요"></td>
						<td></td>
					</tr>
					<tr>
						<td>NICK</td>
						<td><input type="text" placeholder="닉네임을 입력해주세요"></td>
						<td></td>
					</tr>
					<tr>
						<td>PHONE</td>
						<td><input type="text" name="cellPhone" id="cellPhone"
							placeholder="핸드폰번호 입력" maxlength="13" /></td>
						<td></td>
					</tr>
					<tr>
						<td>ADRESS</td>
						<td><input type="text" id="sample6_postcode"
							placeholder="우편번호" style="margin-right: 10px;"></td>
						<td><input id="post_btn" type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" id="sample6_address" placeholder="주소">
							<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" id="sample6_extraAddress"
							placeholder="참고항목"></td>
						<td></td>
					</tr>


					<tr>
						<td>GENDER</td>
						<td><label class="test_obj"> <input type="radio"
								name="fruit" value="apple"> <span>남자</span>
						</label> <label class="test_obj"> <input type="radio" name="fruit"
								value="banana"> <span>여자</span>
						</label></td>
					</tr>
					<tr>
						<td id="login_btn" colspan="2"><button>JOIN US</button></td>
					</tr>
				</tbody>
			</table>
		</form>

	</div>
	<header>
		<div class="navbar">
			<a class="logo" href="#"> <img src="/img/logo/image2.png"
				height="75px">
			</a>
			<ul id="menu">
				<li><a href="#home">검색</a></li>
				<li><a href="#html">게시판</a></li>
				<li><a href="#css">장바구니</a></li>
				<%
      if (user == null) {
      %>
		<li id="goLogin"><a href="#javascript">로그인</a></li>
		<%
      } else {
      %>
		<!-- ★마이페이지,로그아웃★ -->
		<li><a href="goMypage.do">마이페이지</a></li>
		<li><a href="goLogout.do">로그아웃</a></li>
		<%
      }
      %>
			</ul>
		</div>
		<main id="product">
			<aside>
				<ul class="category">



				</ul>
			</aside>
	</header>
	<main id="product">

		<section class="complete">

			<article class="message">
				<h2>
					고객님의 주문이 정상적으로 완료되었습니다. <i class="far fa-smile" aria-hidden="true"></i>
				</h2>
				<p>즐거운 쇼핑이 되셨습니까? 항상 고객님을 최우선으로 생각하는 HomeTogether가 되겠습니다.</p>
				<div class="logo-container">

					<div>
						<p>주문번호: 202300000000</p>
						<p>주문일자: 2023-08-17 12:00:00</p>
					</div>
				</div>
				<div>
					<h1 id="customer">주문완료</h1>
					<p>HOME >> 장바구니 >> 주문내역 >> 주문완료</p>
				</div>
			</article>

			<!-- 상품정보 -->
			<article class="info">
				<h1>상품정보</h1>
				<table border="0">
					<tr>
						<th>상품명</th>
						<th>주문날짜</th>
						<th>상품금액</th>
						<th>수량</th>
						<th>주문금액</th>
					</tr>
					<tr>
						<td>
							<article>
								<img src="img/shopa/이미지1.jpg" alt="">
								<div>
									<h2>
										<a href="#">상품명</a>
									</h2>
									<p>상품설명</p>
								</div>
							</article>
						</td>
						<td>2023-08-25</td>
						<td>9,000원</td>
						<td>1</td>
						<td class="price"><span>9,000원</span></td>
					</tr>
					<tr>
						<td>
							<article>
								<img src="img/shopa/이미지10.jpg" alt="">
								<div>
									<h2>
										<a href="#">상품명</a>
									</h2>
									<p>상품설명</p>
								</div>
							</article>
						</td>
						<td>2023-08-25</td>
						<td>9,000원</td>
						<td>1</td>
						<td class="price"><span>9,000원</span></td>
					</tr>
					<tr>
						<td>
							<article>
								<img src="img/shopa/이미지13.jpg" alt="">
								<div>
									<h2>
										<a href="#">상품명</a>
									</h2>
									<p>상품설명</p>
								</div>
							</article>
						</td>
						<td>2023-08-25</td>
						<td>9,000원</td>
						<td>1</td>
						<td class="price"><span>9,000원</span></td>
					</tr>
					<tr class="total">
						<td colspan="1"></td>
						<td>
							<table id="center_tb">
								<tr>
									<td class="left_text">총 상품금액</td>
									<td><span>27,000원</span></td>
								</tr>

								<tr>
									<td class="left_text">배송비</td>
									<td><span>0원</span></td>
								</tr>
								<tr>
									<td class="left_text">총 결제금액</td>
									<td><span>27,000</span>원</td>
								</tr>
							</table>
						</td>
						<td colspan="1"></td>
					</tr>
				</table>
			</article>
			<!-- 주문정보 -->
			<article class="order">
				<h1>주문정보</h1>
				<table id="oder_content">
					<tr>
						<td>주문번호</td>
						<td>HomeTogether</td>
					</tr>
					<tr>
						<td>결제방법</td>
						<td>신용카드</td>
					</tr>
					<tr>
						<td>주문자/연락처</td>
						<td>${sessionScope.user.nick}/${sessionScope.user.phone}</td>
					</tr>
				</table>
				<table id="order_price">
					<tr style="font-size: 22px;">
						<td>총 결제금액</td>
						<td><span>27,000</span>원</td>
					</tr>
				</table>
			</article>
			<!-- 배송정보 -->
			<article class="delivery">
				<h1>배송정보</h1>
				<table>
					<tr>
						<td>수취인</td>
						<td>${sessionScope.buyer[0]}</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${sessionScope.buyer[1]}</td>
					</tr>
					<tr>
						<td>배송지 주소</td>
						<td>${sessionScope.buyer[3]}${sessionScope.buyer[4]}</td>
					</tr>
				</table>
			</article>

			<div class="logo-container" style="text-align: center;">
				<a href="main.do"><input type="submit" value="홈으로"></a>
			</div>

			</div>
		</section>
	</main>
	<footer id="footer">
		<div id="foot_wrap">
			<div id="foot_left">
				<div>
					<Strong>고객센터</Strong>
				</div>
				<div>
					<p>010-8927-0775</p>
					<p>09:00~18:00</p>
				</div>
				<div>
					<p>
						평일 : 전체 문의 상담 가능<br> 주말, 공휴일: 제품 A/S 및 기타 문의 상담 가능
					</p>
				</div>
			</div>
			<div id="foot_center">
				<div>
					<p>상호명: HomeTogether</p>
					<p>대표자: 김찬호</p>
					<p>광주 남구 송암로 60 CGI 센터 2400층</p>
					<p>사업자 등록번호 : 2400-2400-2400</p>
				</div>
			</div>
			<div id="foot_right">
				<p>
					(주)HomeTogether는 통신판매중개자로 거래당사자가아니므로, 판매자가 등록한 상품정보 및 거래 등에 대해 책임을
					지지 않습니다. 단, (주)HomeTogether가 판매자로 등록 판매한 상품은 판매자로 책임을 부담합니다. <br>
					<br> &copy 2023 HomeTogether, Co., Ltd.All rights reserved
				</p>
			</div>
		</div>
	</footer>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
	<script src="assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
	<script src="assets/js/complete.js"></script>
</body>

</html>