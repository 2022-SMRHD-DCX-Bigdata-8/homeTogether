<%@page import="com.ha.entity.TB_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <title>SimpleShop</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://mooozi.github.io/css/reset.css">
    <link href="assets/css/main.css" rel="stylesheet" />
</head>

<body>
<%  TB_Member user = (TB_Member)session.getAttribute("user"); %>
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
            <img src="img/logo/image2.png" height="75px">
        </a>
        <ul id="menu">
            <li><a href="#home">검색</a></li>
            <li><a href="#html">게시판</a></li>
            <li><a href="#css">장바구니</a></li>
            <li id="goLogin"><a href="#javascrript">로그인</a></li>
        </ul>
    </div>
    <div class="hero_header">
        <ul class="slideshow"> <!-- Add the .slideshow class here -->
            <li> <img src="img/shopa/이미지0.jpg" alt="가구 사진1"> </li>
            <li> <img src="img/shopa/이미지11.jpg" alt="가구 사진2"> </li>
            <li> <img src="img/shopa/이미지15.jpg" alt="가구 사진3"> </li>
            <li> <img src="img/shopa/이미지18.jpg" alt="가구 사진3"> </li>
        </ul>
    </div>

    <div id="categori">
        <ul>
            <li><a href="#"><img src="img/logo/LIGHT.png" alt="카테고리 사진"></a></li>
            <li><a href="#"><img src="img/logo/table2.PNG" alt="카테고리 사진"></a></li>
            <li><a href="#"><img src="img/logo/DRAWER.png" alt="카테고리 사진"></a></li>
            <li><a href="#"><img src="img/logo/CHIAR.png" alt="카테고리 사진"></a></li>
            <li><a href="#"><img src="img/logo/bed.png" alt="카테고리 사진"></a></li>
            <li><a href="#"><img src="img/logo/COOKER.png" alt="카테고리 사진"></a></li>
        </ul>
    </div>

    <h1>Our new Products</h1>
    <div class="products">
        <a href="#">
            <img src="images/sunglasses.jpg">
            <p>Sunglasses</p>
            <p class="price">49,000</p>
        </a>
        <a href="#">
            <img src="images/tassel_loafer.jpg">
            <p>Tassel Loafer</p>
            <p class="price">89,000</p>
        </a>
        <a href="#">
            <img src="images/beige_bag.jpg">
            <p>Begie Bag</p>
            <p class="price">69,000</p>
        </a>
        <a href="#">
            <img src="images/sneakers.jpg">
            <p>Sneakers</p>
            <p class="price">79,000</p>
        </a>
        <a href="#">
            <img src="images/slippers.jpg">
            <p>Slippers</p>
            <p class="price">29,000</p>
        </a>
        <a href="#">
            <img src="images/wrist_watch.jpg">
            <p>Wrist Watch</p>
            <p class="price">99,000</p>
        </a>
        <a href="#">
            <img src="images/fedora_hat.jpg">
            <p>Fedora Hat</p>
            <p class="price">39,000</p>
        </a>
        <a href="#">
            <img src="images/classic_loafer.jpg">
            <p>Classic Loafer</p>
            <p class="price">99,000</p>
        </a>
        <a href="#">
            <img src="images/pink_bag.jpg">
            <p>Pink Bag</p>
            <p class="price">79,000</p>
        </a>
        <div class="clearfix"></div>
    </div>

    <div id="footer">

    </div>

    
    
    
    
    
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
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
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
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
</script>
    <!-- 스크립트 -->
    
    <script src="assets/js/code.jquery.com_jquery-3.7.0.min.js"></script> 
    <script src="assets/js/main.js"></script>
   
</body>

</html>