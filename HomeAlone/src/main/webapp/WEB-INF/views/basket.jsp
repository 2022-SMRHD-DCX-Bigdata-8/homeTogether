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
    <link rel="stylesheet" href="http://mooozi.github.io/css/reset.css%22%3E">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    </style>

    <script>
        function toggleAll(source) {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i] !== source) {
                    checkboxes[i].checked = source.checked;
                }
            }
        }
        function deleteSelected() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].parentNode.parentNode.remove(); // Remove the entire row
            }
        }
    </script>
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
	<% TB_Member user = (TB_Member)session.getAttribute("user"); %>
    <div id="login_view">
        <div id="back"><img src="img/icon/back.png"></div>
        <form action="#" method="post">
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

        <form action="#" method="post">
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
                        <td>
                            <input type="text" name="cellPhone" id="cellPhone" placeholder="핸드폰번호 입력" maxlength="13" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>ADRESS</td>
                        <td>
                            <input type="text" id="sample6_postcode" placeholder="우편번호" style="margin-right: 10px;">
                        </td>
                        <td>
                            <input id="post_btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="text" id="sample6_address" placeholder="주소">
                            <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                        </td>
                        <td></td>
                    </tr>


                    <tr>
                        <td>GENDER</td>
                        <td>
                            <label class="test_obj">
                                <input type="radio" name="fruit" value="apple">
                                <span>남자</span>
                            </label>

                            <label class="test_obj">
                                <input type="radio" name="fruit" value="banana">
                                <span>여자</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td id="login_btn" colspan="2"><button>JOIN US</button></td>
                    </tr>
                </tbody>
            </table>
        </form>

    </div>
    <div class="navbar">
        <a class="logo" href="#">
            <img src="/img/logo/image2.png" height="75px">
        </a>
		<ul id="menu">
			<li><a href="#home">검색</a></li>
			<li><a href="goBasket.do">장바구니</a></li>
			<% if (user == null) {	%>
			<li id=goLogin><a href="#">로그인</a></li>
			<% } else { %>
			<li><a href="goMypage.do">마이페이지</a></li>
			<li><a href="goLogout.do">로그아웃</a></li>
			<% } %>
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
                            <span id="c_name">smhrd</span>
                        </div>
                        <div class="flex-container">
                            <p>HOME
                                >>
                                장바구니
                            </p>
                        </div>
                    </div>

                    <form action="#">
                        <table>
                            <tr>
                                <td id="selectAll"><input type="checkbox" onclick="toggleAll(this)"></td>
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
                                <td><input type="checkbox" name="1"></td>
                                <td>
                                    <article>
                                        <a href="#">
                                            <img src="assets/img/test/KakaoTalk_20230817_155756756_01.jpg" alt="1">
                                        </a>
                                        <div>
                                            <h2><a href="#">상품명</a></h2>
                                            <p>상품설명</p>
                                        </div>
                                    </article>
                                </td>

                                <td><span>1</span></td>
                                <td class="number"><span>homealone1</span></td>
                                <td><span>1</span></td>
                                <td class="fr_send"><span>무료배송</span></td>
                                <td><span>9000</span></td>
                            </tr>

                            <tr class="basket">
                                <td><input type="checkbox" name="2"></td>
                                <td>
                                    <article>
                                        <a href="#">
                                            <img src="assets/img/test/KakaoTalk_20230817_155756756_03.jpg" alt="1">
                                        </a>
                                        <div>
                                            <h2><a href="#">상품명</a></h2>
                                            <p>상품설명</p>
                                        </div>
                                    </article>
                                </td>
                                <td><span>2</span></td>
                                <td class="number"><span> homealone2</span></td>
                                <td><span>1</span></td>
                                <td class="fr_send"><span>무료배송</span></td>
                                <td><span>9000</span></td>
                            </tr>

                            <tr class="basket">
                                <td><input type="checkbox" name="3"></td>
                                <td>
                                    <article>
                                        <a href="#">
                                            <img src="assets/img/test/KakaoTalk_20230817_155802481_07.jpg" alt="1">
                                        </a>
                                        <div>
                                            <h2><a href="#">상품명</a></h2>
                                            <p>상품설명</p>
                                        </div>
                                    </article>
                                </td>
                                <td><span>3</span></td>
                                <td class="number"><span>homealone3</span></td>
                                <td><span>1</span></td>
                                <td class="fr_send"><span>무료배송</span></td>
                                <td><span>9000</span></td>
                            </tr>
                        </table>
                        <input type="button" name="del" value="선택삭제" onclick="deleteSelected()">

                        <div class="total">
                            <h2>전체합계</h2>
                            <table>
                                <tr>
                                    <td>상품수</td>
                                    <td>1</td>
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
                            <input type="submit" value="주문하기">
                        </div>
                    </form>

                    <div id="ad">
                        <p>추천 상품</p>
                        <div>
                            <a href=""><img src="img/shopa/이미지10.jpg" alt="쇼파1"></a>
                            <strong>제품 이름입니다만</strong><br>
                            <strong>제품 가격인데 얼마임?</strong>
                        </div>
                        <div>
                            <a href=""><img src="img/shopa/이미지14.jpg" alt="쇼파2"></a>
                            <strong>제품 이름</strong><br>
                            <strong>제품 가격</strong>
                        </div>
                        <div>
                            <a href=""><img src="img/shopa/이미지11.jpg" alt="쇼파2"></a>
                            <strong>제품 이름</strong><br>
                            <strong>제품 가격</strong>
                        </div>
                    </div>
                </section>
        </div>
    </main>
    <footer id="footer">
        <div id="foot_wrap">
            <div id="foot_left">
                <div><Strong>고객센터</Strong></div>
                <div>
                    <p>010-8927-0775</p>
                    <p>09:00~18:00</p>
                </div>
                <div>
                    <p>
                        평일 : 전체 문의 상담 가능<br>
                        주말, 공휴일: 제품 A/S 및 기타 문의 상담 가능
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
                    (주)HomeTogether는 통신판매중개자로 거래당사자가아니므로,
                    판매자가 등록한 상품정보 및 거래 등에 대해 책임을 지지 않습니다.
                    단, (주)HomeTogether가 판매자로 등록 판매한 상품은 판매자로 책임을 부담합니다.
                    <br>
                    <br>
                    &copy 2023 HomeTogether, Co., Ltd.All rights reserved
                </p>
            </div>
        </div>
    </footer>
    </main>



    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
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
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
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
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>

    <script src="//code.jquery.com/jquery-3.3.1.min.js">
    </script>
    <script>
        $(document).ready(function () {
            $(function () {
                $("button").click(function () {
                    $(":checkbox").attr("checked", "checked")
                })
            });
        })
    </script>
    <script src="assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
    <script src="assets/js/products.js"></script>

</body>

</html>