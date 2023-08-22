<%@page import="com.ha.entity.TB_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>HOMEWORK</title>
    <link rel="stylesheet" href="assets/css/products.css">
    <link rel="stylesheet" href="http://mooozi.github.io/css/reset.css">

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
    <header>
        <a class="logo" href="#">
            <img src="img/logo/image2.png" height="75px">
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
    </header>
    <nav id="nav">
        <ul id="categori">
            <li><a class="on" href="#"><span>조명</span></a></li>
            <li><a href="#"><span>책상</span></a></li>
            <li><a href="#"><span>테이블</span></a></li>
            <li><a href="#"><span>소파</span></a></li>
            <li><a href="#"><span>침구</span></a></li>
            <li><a href="#"><span>전자</span></a></li>
        </ul>
    </nav>
    <div class="goods_list_title">
        <h2>${product[0].prod_type}</h2>
    </div>
    <div id="filter_box">
        <ul id="filter">
            <li><a href="#"><span>항목1</span></a></li>
            <li><a href="#"><span>항목2</span></a></li>
            <li><a href="#"><span>항목2</span></a></li>
            <li><a href="#"><span>항목2</span></a></li>
            <li><a href="#"><span>항목2</span></a></li>
            <li><a href="#"><span>항목3</span></a></li>
        </ul>
    </div>
    <div id="sort_div">
        <ul id="sort_list">
            <li><span>Total 2400item</span></li>
            <li>
                <ul id="sort">
                    <li class="li">
                        <h1>높은평점</h1>
                    </li>
                    <li class="li">
                        <h1>높은가격</h1>
                    </li>
                    <li class="li">
                        <h1>낮은가격</h1>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="content">
        <div>
            <ul id="goods_lists">
                <!--  <c:forEach var="products" items="${product}">-->
                <li>
                    <a href="goProductcell.do?prod_seq=${product[1].prod_seq}" class="image_container">
                        <img class="hover_image" src="${product[1].prod_img}" alt="랄로!?">
                    </a>
                    <div><span>${product[1].prod_name}</span></div>
                    <div><strong>이게 되면 성공</strong></div>
                    <div><strong>${product[1].prod_price}</strong></div>
                </li>
                <!--  </c:forEach>-->
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481_08.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481_07.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481_06.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481_05.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481_04.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481_03.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481_02.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481_01.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155802481.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155756756_01.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155756756_02.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155756756_03.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container"> 
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155756756_04.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
                <li>
                    <a href="" class="image_container">
                        <img class="hover_image" src="img/test/KakaoTalk_20230817_155756756_05.jpg" alt="랄로!?">
                    </a>
                    <div><span>80억 날린 청년</span></div>
                    <div><strong>랄로를 몰라!?</strong></div>
                    <div><strong>80억</strong></div>
                </li>
            </ul>
            <div id="goods_paging">
                <ul id="buttons">
                    <li class="click"><span>1</span></li>
                    <li><span>2</span></li>
                    <li><span>3</span></li>
                    <li><span>4</span></li>
                    <li><span>5</span></li>
                </ul>
            </div>
        </div>
    </div>
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


    <script src="assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
    <script src="assets/js/products.js"></script>

</body>

</html>