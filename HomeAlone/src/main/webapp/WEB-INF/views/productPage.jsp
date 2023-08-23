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
            <li><a href="#"><span>벽조명</span></a></li>
            <li><a href="#"><span>스탠드조명</span></a></li>
            <li><a href="#"><span>천장등</span></a></li>
        </c:if>
        <c:if test="${product[0].prod_type =='수납'}">
        <ul id="filter">
            <li><a href="#"><span>행거</span></a></li>
            <li><a href="#"><span>선반</span></a></li>
            <li><a href="#"><span>수납박스</span></a></li>
            <li><a href="#"><span>서랍장</span></a></li>
        </c:if>
        <c:if test="${product[0].prod_type =='침구류'}">
        <ul id="filter">
            <li><a href="#"><span>침대</span></a></li>
            <li><a href="#"><span>이불/베개</span></a></li>
            <li><a href="#"><span>러그</span></a></li>
        </c:if>
        <c:if test="${product[0].prod_type =='가전제품'}">
        <ul id="filter">
            <li><a href="#"><span>주방가전</span></a></li>
            <li><a href="#"><span>생활가전</span></a></li>            
        </c:if>
        <c:if test="${product[0].prod_type =='테이블'}">
        <ul id="filter">
            <li><a href="#"><span>좌식/접이식 테이블</span></a></li>
            <li><a href="#"><span>사이드 테이블</span></a></li>
            <li><a href="#"><span>일반테이블</span></a></li>
        </c:if>
         <c:if test="${product[0].prod_type =='의자/소파'}">
         <ul id="filter">
            <li><a href="#"><span>좌식의자</span></a></li>
            <li><a href="#"><span>인테리어의자</span></a></li>
            <li><a href="#"><span>사무용의자</span></a></li>
            <li><a href="#"><span>소파</span></a></li>
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


    <script src="assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
    <script src="assets/js/products.js"></script>
    <script type="text/javascript">
	let property;
    
	  $(document).ready(function() {
		console.log('test')
		
     	$('#filter>li').on('click', function(){
     		
     		property = $(this).find('a>span').text(); 
     		
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