
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="mypage.css">
    
</head>

<body>
    <header>
        <div>

            <div id="wrapper">
                <a class="logo" href="#">
                    <img src="/PROJECT/pj_images/logogo.png" height="75px">
                </a>
                <ul id="menu">
                    <li><a href="#home">검색</a></li>
                    <li><a href="#html">게시판</a></li>
                    <li><a href="#css">장바구니</a></li>
                    <li><a href="#javascrript">로그인</a></li>
                </ul>
            </div>

        </div>
        <main id="product">
            <aside>
                <ul class="category">



                </ul>
            </aside>


            <div class="wrap">
                <div class="Container">
                    <div class="centered">
                        <div class="name">MY PAGE</div>
                    </div>
                    <div class="modify"></div>
                </div>
                <div class="summaryContainer">
                </div>
                <div class="shippingStatusContainer">
                    <div class="title">
                        주문/배송조회
                        <h3>나의 주문처리 현황(최근 3개월 기준)</h3>
                    </div>
                    <div class="status">

                        <div class="item">
                            <div>
                                <div class="number">0</div>
                                <div class="text">장바구니</div>
                            </div>
                            <div class="icon"> > </div>
                        </div>
                        <div class="item">
                            <div>
                                <div class="number">3</div>
                                <div class="text">결제완료</div>
                            </div>
                            <div class="icon"> > </div>
                        </div>
                        <div class="item">
                            <div>
                                <div class="number">0</div>
                                <div class="text">배송중</div>
                            </div>
                            <div class="icon"> > </div>
                        </div>
                        <div class="item">
                            <div>
                                <div class="number">1</div>
                                <div class="text">구매확정</div>
                            </div>
                        </div>


                    </div>

                </div>
                <div class="listContainer">
                    <a href="#" class="item">
                        <div class="icon">ii</div>
                        <div class="text">주문목록<span class="circle"></span></div>
                        <div class="right"></div>
                    </a>
                    <a href="#" class="item">
                        <div class="icon">ii</div>
                        <div class="text">상품후기</div>
                        <div class="right"></div>
                    </a>
                    <a href="#" class="item">
                        <div class="icon">ii</div>
                        <div class="text">상품문의</div>
                        <div class="right"></div>
                    </a>
                    <a href="#" class="item">
                        <div class="icon">ii</div>
                        <div class="text">찜한상품</div>
                        <div class="right"></div>
                    </a>

                    <a href="#" class="item">
                        <div class="icon">ii</div>
                        <div class="text">로그아웃</div>
                        <div class="right"></div>
                    </a>
                </div>
                <div class="email-box">
                    <p>안녕하세요. <strong th:text="${name}">smhrd</strong>님의 결제내역입니다.</p>
                    <h3>결제 내역</h3>
                    <table>
                        <tr th:each="orderItem : ${orderItemList}" th:with="result=${orderItem.price}">
                            <td>
                                <span th:text="${orderItem.name}">푹신푹신 쇼파</span>
                            </td>
                            <td>
                                <span th:text="${#numbers.formatCurrency(orderItem.price)}">￦9,000</span>원
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>반짝반짝 조명</span>
                            </td>
                            <td>￦9,000원</td>
                        </tr>
                    </table>
                    <p>
                        전체 결제금액
                        <span th:text="${#numbers.formatCurrency(#aggregates.sum(orderItemList.![price]))}">￦18,000</span>원
                    </p>
                    <p>
                        구매일
                        <span th:text="${#dates.format(orderDate, 'yyyy-MM-dd HH:mm:ss')}">2023-08-17 11:11:11</span>
                    </p>
                    <p>감사합니다.</p>
                </div>
               
            </header>
</body>

</html>


