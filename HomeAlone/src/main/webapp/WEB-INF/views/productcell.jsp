<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>HomeTogether</title>
    <link rel="stylesheet" href="assets/css/productcell.css">


</head>

<body>
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
    <div>
        <div id="wrapper">
            <a class="logo" href="#">
                <img src="img/logo/image2.png" height="75px">
            </a>
            <ul id="menu">
                <li><a href="#home">검색</a></li>
                <li><a href="#html">게시판</a></li>
                <li><a href="#css">장바구니</a></li>
                <li><a href="#javascrript" id="goLogin">로그인</a></li>
            </ul>
        </div>

    </div>


    </div>

    </div>
    </header>
    <main id="product">
        <aside>

        </aside>
        <section class="view">
            <nav>
                <h1>상품보기</h1>
                <p>
                    HOME >>
                    <span>가구/의자</span>
                    >>
                    <strong>리클라이너</strong>
                </p>
            </nav>
            <article class="info">
                <div class="image">
                    <img src="img/shopa/이미지10.jpg" alt="상품이미지">
                </div>
                <div class="summary">
                    <h2>
                        상품번호 :
                        <span>20230000</span>
                    </h2>
                    <h1>(주)판매자명</h1>

                    <nav>
                        <h3>리클라이너 의자</h3>
                        <p>상품설명 출력</p>

                    </nav>
                    <nav id="price">
                        <div class="org_price">
                            <del>30,000</del>
                            <span>10%</span>
                        </div>
                        <div class="dis_price">
                            <ins>27,000</ins>
                        </div>
                    </nav>
                    <nav id="free_baesong">
                        <span class="delivery">무료배송</span>
                        <span class="arrival">모레(일) 8/27 도착예정</span>
                        <span class="desc">본 상품은 국내배송만 가능합니다.</span>
                    </nav>
                    <nav>
                        <span class="origin">원산지-상세설명 참조</span>
                    </nav>
                    <div class="count">
                        <button class="decrease">-<i class="fas fa-minus"></i></button>
                        <input type="text" name="num" value="1" readonly>
                        <button class="increase">+<i class="fas fa-plus"></i></button>
                    </div>
                    <div class="total">
                        <span>27,000</span>
                        <em>총 상품금액</em>
                    </div>
                    <div class="button">
                        <input type="button" class="cart" value="장바구니">
                        <input type="button" class="order" value="구매하기">
                    </div>
                </div>
            </article>
            <article class="detail">
                <div>
                    <nav>
                        <h1>상품정보</h1>
                    </nav>
                    <nav>
                        <h1>상품 정보 제공 고시</h1>
                    </nav>
                    <nav>
                        <h1>상품리뷰</h1>
                    </nav>
                    <nav>
                        <h1>QnA</h1>
                    </nav>
                </div>



                <img src="https://via.placeholder.com/860x460" alt="상세페이지1">
                <br>
                <img src="https://via.placeholder.com/860x460" alt="상세페이지2">
                <br>
                <img src="https://via.placeholder.com/860x460" alt="상세페이지3">
            </article>
            <article class="notice">
                <nav>
                    <h1>상품 정보 제공 고시</h1>
                    <p>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 등록된 정보입니다.</p>
                </nav>
                <table>
                    <tr>
                        <td>상품번호</td>
                        <td>11111111111</td>
                    </tr>
                    <tr>
                        <td>상품상태</td>
                        <td>새상품</td>
                    </tr>
                    <tr>
                        <td>부가세 면세여부</td>
                        <td>과세상품</td>
                    </tr>
                    <tr>
                        <td>영수증발행</td>
                        <td>발행가능 - 신용카드 전표, 온라인 현금영수증</td>
                    </tr>
                    <tr>
                        <td>사업자구분</td>
                        <td>사업자 판매자</td>
                    </tr>
                    <tr>
                        <td>브랜드</td>
                        <td>블루포스</td>
                    </tr>
                    <tr>
                        <td>원산지</td>
                        <td>국내생산</td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>제품소재</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>색상</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>치수</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>제소사/수입국</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>제조국</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>취급시 주의사항</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>제조연월</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>품질보증기준</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>A/S 책임자와 전화번호</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td>주문후 예상 배송기간</td>
                        <td>상세정보 직접입력</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            구매, 교환, 반품, 배송, 설치 등과 관련하여 추가비용, 제한조건 등의 특이사항이 있는 경우
                        </td>
                    </tr>
                </table>
                <p class="notice">
                    소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고
                    동법 제 18조 제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의
                    환급이 3영업일을 넘게 지연된 경우, 소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조
                    제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여 전상법 시행령으로 정하는 이율을 곱하여
                    산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 아울러, 교환∙반품∙보증 및 결제대금의
                    환급신청은 [나의쇼핑정보]에서 하실 수 있으며, 자세한 문의는 개별 판매자에게 연락하여 주시기 바랍니다.
                </p>
            </article>
            <article class="review">
                <div id=re-form>

                    <nav>
                        <h2>상품리뷰</h2>
                    </nav>
                </div>
                <ul>
                    <li>
                        <div>
                            <h5 class="rating star4">상품평</h5>
                            <span>jun****** 2023-08-18</span>
                        </div>
                        <h3>상품명1/BLUE/L</h3>
                        <p> 푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                        </p>

                    </li>
                    <li>
                        <div>
                            <h5 class="rating star4">상품평</h5>
                            <span>jun****** 2023-08-18</span>
                        </div>
                        <h3>상품명1/BLUE/L</h3>
                        <p> 푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                        </p>
                    </li>
                    <li>
                        <div>
                            <h5 class="rating star4">상품평</h5>
                            <span>jun****** 2023-08-18</span>
                        </div>
                        <h3>상품명1/BLUE/L</h3>
                        <p> 푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                        </p>
                    </li>
                    <li>
                        <div>
                            <h5 class="rating star4">상품평</h5>
                            <span>jun****** 2023-08-18</span>
                        </div>
                        <h3>상품명1/BLUE/L</h3>
                        <p> 푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                        </p>
                    </li>
                    <li>
                        <div>
                            <h5 class="rating star4">상품평</h5>
                            <span>jun****** 2023-08-18</span>
                        </div>
                        <h3>상품명1/BLUE/L</h3>
                        <p> 푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                        </p>
                    </li>
                    <div class="qa-form">
                        <h2>리뷰 작성</h2>
                        <div class="input-container">
                            <p>이름</p>
                            <input type="text" id="questionInput" placeholder="고객님의 리뷰는 힘이 됩니다.">
                            <button id="askButton">작성하기</button>
                        </div>
                    </div>

                    <article class="next">
                        <div class="paging">
                            <span class="prev" id="review_prev">
                                <a href="#">이전</a>
                            </span>
                            <span class="num" id="review_num">
                                <a href="#" class="on">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#">6</a>
                                <a href="#">7</a>
                            </span>
                            <span class="next" id="review_append">
                                <a href="#">다음 ></a>
                            </span>
                        </div>
                </ul>
            </article>
            <article class="QandA">
                <nav>
                    <h1>QandA</h1>
                </nav>

                <ul></ul>
                <div class="qa-list" id="qaList">

                </div>

                <ul>
                    <li>
                        <div>
                            <h5 class="QandA1"></h5>
                            <span>jun****** 2023-08-18</span>
                        </div>
                        <h3>상품명1/BLUE/L<a href="#" id="rep">답변하기<small></small></a></h3>
                        <p> 푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                        </p>
                    </li>

                </ul>
                <ul>

                    <li>
                        <div>
                            <h5 class="QandA1"></h5>
                            <span>jun****** 2023-08-18</span>
                        </div>
                        <h3>상품명2/red/L<a href="#" id="rep">답변하기<small></small></a></h3>
                        <p> 푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                            푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신푹신
                        </p>
                    </li>



                </ul>

            </article>
            <div class="qa-form">
                <h2>새 질문 작성</h2>
                <h3>nick***</h3>
                <input type="text" id="questionInput" placeholder="질문을 입력하세요">
                <button id="askButton">질문하기</button>
            </div>

            <article class="next">
                <div class="paging">
                    <span class="prev" id="QnA_prev">
                        <a href="#">이전</a>
                    </span>
                    <span class="num" id="QnA_num">
                        <a href="#" class="on">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                    </span>
                    <span class="next" id="QnA_append">
                        <a href="#">다음 ></a>
                    </span>
                </div>
            </article>
        </section>
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

    </div>

    <script src="assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
    <script src="assets/js/productCell.js"></script>
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
    <script>
        const decreaseButton = document.querySelector('.decrease');
        const increaseButton = document.querySelector('.increase');
        const inputField = document.querySelector('input[name="num"]');

        decreaseButton.addEventListener('click', () => {
            const currentValue = parseInt(inputField.value);
            if (currentValue > 1) {
                inputField.value = currentValue - 1;
            }
        });

        increaseButton.addEventListener('click', () => {
            const currentValue = parseInt(inputField.value);
            inputField.value = currentValue + 1;
        });
    </script>
    
</body>

</html>