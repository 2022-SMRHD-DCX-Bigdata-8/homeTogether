<%@page import="com.ha.entity.TB_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>HOMEWORK</title>
    <link rel="stylesheet" href="assets/css/products.css">
    <link rel="stylesheet" href="http://mooozi.github.io/css/reset.css">

</head>

<body>
<% 
	TB_Member user = (TB_Member)session.getAttribute("user"); 

%>
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
        <a class="logo" href="main.do">
            <img src="img/logo/image2.png" height="75px">
        </a>
		<ul id="menu">
			<form action="search.do" method="post" >
				<div id="search">
					<span>Search</span> <input type="text" id="search_content" name="search">
					<input id="search_img" type="image" src="img/icon/search2.png">
				</div>
			</form>
			<li id="search_btn"><a href="#home">검색</a></li>
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
            <li><a href="goLighting.do"><span>조명</span></a></li>
            <li><a href="goTable.do"><span>테이블</span></a></li>
            <li><a href="goStorage.do"><span>수납</span></a></li>
            <li><a href="goChair.do"><span>의자/소파</span></a></li>
            <li><a href="goBedding.do"><span>침구류</span></a></li>
            <li><a href="goGajun.do"><span>가전제품</span></a></li>
        </ul>
    </nav>
    <div class="goods_list_title">
    <c:if test="${searched!=null}">
        <h2>${searched}</h2>
    </c:if>
    <c:if test="${searched==null}">
    	<h2>${product[0].prod_type}</h2>
    </c:if>
    </div>
    <div id="filter_box">
        <c:if test="${searched!=null}">
        	<ul id="filter" style="visibility : hidden">
            <li>뭐냐?</li>
       	</c:if>
        <c:if test="${product[0].prod_type =='조명'}">
        <ul id="filter">
            <li><a href="#" data-value='벽조명'><span>벽조명</span></a></li>
            <li><a href="#" data-value='스탠드조명'><span>스탠드조명</span></a></li>
            <li><a href="#" data-value='천장등'><span>천장등</span></a></li>
        </c:if>
        <c:if test="${product[0].prod_type =='수납'}">
        <ul id="filter">
            <li><a href="#" data-value='행거'><span>행거</span></a></li>
            <li><a href="#" data-value='선반'><span>선반</span></a></li>
            <li><a href="#" data-value='수납박스'><span>수납박스</span></a></li>
            <li><a href="#" data-value='서랍장'><span>서랍장</span></a></li>
        </c:if>
        <c:if test="${product[0].prod_type =='침구류'}">
        <ul id="filter">
            <li><a href="#" data-value='침대'><span>침대</span></a></li>
            <li><a href="#" data-value='이불/베개'><span>이불/베개</span></a></li>
            <li><a href="#" data-value='러그'><span>러그</span></a></li>
        </c:if>
        <c:if test="${product[0].prod_type =='가전제품'}">
        <ul id="filter">
            <li><a href="#" data-value='주방가전'><span>주방가전</span></a></li>
            <li><a href="#" data-value='생활가전'><span>생활가전</span></a></li>            
        </c:if>
        <c:if test="${product[0].prod_type =='테이블'}">
        <ul id="filter">
            <li><a href="#" data-value='좌식/접이식 테이블'><span>좌식/접이식</span></a></li>
            <li><a href="#" data-value='사이드 테이블'><span>사이드 테이블</span></a></li>
            <li><a href="#" data-value='일반테이블'><span>일반테이블</span></a></li>
        </c:if>
         <c:if test="${product[0].prod_type =='의자/소파'}">
         <ul id="filter">
            <li><a href="#" data-value='좌식의자'><span>좌식의자</span></a></li>
            <li><a href="#" data-value='인테리어의자'><span>인테리어의자</span></a></li>
            <li><a href="#" data-value='사무용의자'><span>사무용의자</span></a></li>
            <li><a href="#" data-value='소파'><span>소파</span></a></li>
        </c:if>
           
        </ul>
    </div>
    <div id="sort_div">
        <ul id="sort_list">
            <li id="total"><span>Total ${total}</span></li>
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
                <c:forEach var="products" items="${product}">
                	<li>
                   		<a href="goProductcell.do?prod_seq=${products.prod_seq}" class="image_container">
                        <img class="hover_image" src="${products.prod_img}" alt="랄로!?">
                    	</a>
                    	<div><span>${products.prod_name}</span></div>
                    	<div><strong>이게 되면 성공</strong></div>
                    	<div><strong>${products.prod_price}원</strong></div>
                	</li>
                </c:forEach>
                                
            </ul>
            <div id="goods_paging">
                <ul id="buttons">
                
				<c:if test="${searched ==null }">
				<c:forEach var="i" begin="1" end="${page}">
    				<li><span><a href="${url}?page=${i}">${i}</a></span></li>
				</c:forEach>
				</c:if>
				<c:if test="${searched !=null }">
				<c:forEach var="i" begin="1" end="${page}">
    				<li><span><a href="${url}?page=${i}&search=${searched}">${i}</a></span></li>
				</c:forEach>
				</c:if>
				
                    
    				
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
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    <script src="assets/js/products.js"></script>
    <script type="text/javascript">
	let property;
    
	  $(document).ready(function() {
		console.log('test')
		
     	$('#filter>li').on('click', function(){
     		
     		property = $(this).find('a').data('value');
     		console.log(property);
     		goProperty();
     		
     	});
               

     });
    
   
    
    function goProperty(page) {
    	$.ajax({
                 url : 'property.do',
                 type : 'post',
                 contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                 dataType : 'json',
                 data : {
                     "property" : property,
                     "page" : page
                 },
                 
                 success : function(response) {
                    console.log(response);
                    
                                        
            	    var total = response.total;
            	    var product = response.product;
            	    var page = response.page;
            	    var url = response.url;
            	    
                    let ul = $('#goods_lists');
                    ul.html('');
                    

                    for (let i = 0; i < product.length; i++) {

                       tr = "<li>";
                       tr += "<a href="+"'goProductcell.do?prod_seq="+product[i].prod_seq+"' class='image_container'>"
                       tr += "<img class='hover_image' src='"+product[i].prod_img+"' alt='랄로!?'>"
                       tr += "</a>" 
                       tr += "<div><span>"+product[i].prod_name+"</span></div>"
                       tr += "<div><strong>이게 되면 성공</strong></div>"
                       tr += "<div><strong>"+product[i].prod_price+"원</strong></div>"
                       tr += "</li>";

                       
                       ul.append(tr);

                    }
                    let totalcnt=$('#total');
                    totalcnt.html('');
                    
                    totalnum = "<span>Total"+ total+"</span>"
                    
                    totalcnt.append(totalnum);
                    
                    
                    
                    
                    let btns = $('#buttons');
                    btns.html('');
                    if(total%15 !=0){
                    	total= total/15+1
                    }else{
                    	total=total/15
                    }
                    
                    for(var i = 1; i <= total; i++){
						btns.append(`
							<li>
							<span>
								<a href="javascript:goProperty(` + (1 + 15*(i-1)) + `)">` + i + `</a>
							</span>
							</li>
						`);                    	
                    }
                    
                    
                    
                    

                 },
                 error : function(e) {
                    console.log('요청실패!!!');
                 }
              });

     }
    
    </script>
    

</body>

</html>