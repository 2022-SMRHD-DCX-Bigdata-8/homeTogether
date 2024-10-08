
<%@page import="com.ha.entity.TB_Member"%>
<%@page import="com.ha.entity.TB_ORDER"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="assets/css/myPage.css">

</head>

<body>

   <% 
   TB_Member user = (TB_Member) session.getAttribute("user");
   List<TB_ORDER> orders = (List<TB_ORDER>)request.getAttribute("order");
   // 비밀번호 삭제할 때 비교할 세션에 저장된 본인 비밀번호
   String password = user.getPw();  
   //String id =user.getId();
   //id=id.substring(0, 4);
   System.out.println(orders);

String jsonOrders = "[";
for (TB_ORDER order : orders) { // 여기서 변수명을 `orders`가 아니라 `order`로 사용합니다.
    jsonOrders += "{";
    jsonOrders += "\"order_seq\": " + order.getOrder_seq() + ",";
    jsonOrders += "\"nick\": \"" + order.getNick() + "\",";
    jsonOrders += "\"total_amount\": " + order.getTotal_amount() + ",";
    // 다른 주문 정보도 추가할 수 있습니다.
    jsonOrders += "\"order_status\": \"" + order.getOrder_status() + "\"";
    jsonOrders += "},";
}
// 마지막 쉼표(,)를 제거합니다.
if (jsonOrders.endsWith(",")) {
    jsonOrders = jsonOrders.substring(0, jsonOrders.length() - 1);
}
jsonOrders += "]";


   
   %>
   
   <div id="float">
      <div>
         <h1>회원탈퇴</h1>
             <div id="errorMessage" style="display: none;">
                     <h3>비밀번호가 일치하지 않습니다. 취소 버튼을 누르고 다시 입력해주세요.</h3>
                 </div>
                  <div id="exitText">
                  <h3>정말로 탈퇴 하시겠습니까?</h3>
                  <h3>탈퇴 정보는 즉시 파기되어 복구하실 수 없습니다.</h3>
              </div>      
         <div id="float_content">
            <button id="ok">확인</button>
            <button id="cancle">취소</button>
         </div>
      </div>
   </div>
   <header>
      <div>
         <div id="wrapper">

            <a class="logo" href="main.do"> <img src="img/logo/image2.png"
               height="75px">
            </a>

            <ul id="menu">
            <form action="search.do" method="post" >
         		<div id="search">
            		<span>Search</span>
            		<input type="text" id="search_content" name="search">
            		<input id="search_img" type="image" src="img/icon/search2.png">
         		</div>
     		 </form>
               <li id="search_btn"><a href="#home">검색</a></li>
               <li><a href="goBasket.do">장바구니</a></li>
               <%
               if (user == null) {
               %>
               <li id=goLogin><a href="#">로그인</a></li>
               <%
               } else {
               %>
               <li><a href="goMypage.do">마이페이지</a></li>
               <li><a href="goLogout.do">로그아웃</a></li>
               <%
               }
               %>

            </ul>
         </div>

      </div>
      <main id="product">
         <div class="wrap">
            <div class="Container">
               <div class="centered">
                  <div class="name">MY PAGE</div>
               </div>
               <div class="modify"></div>
            </div>
            <div class="summaryContainer"></div>
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
                     <div class="icon">></div>
                  </div>
                  <div class="item payment-complete">
                     <div>
                        <div class="number">0</div>
                        <div class="text">결제완료</div>
                     </div>
                     <div class="icon">></div>
                  </div>
                   <div class="item in-delivery">
                     <div>
                        <div class="number">0</div>
                        <div class="text">배송중</div>
                     </div>
                     <div class="icon">></div>
                  </div>
                 <div class="item delivered">
                     <div>
                        <div class="number">0</div>
                        <div class="text">배송완료</div>
                     </div>
                  </div>
               </div>
            </div>


            <div id="content_wrap">
               <div class="listContainer">
                  <a href="#" class="item" id="order_list">
                     <div class="icon">ii</div>
                     <div class="text">
                        주문내역<span class="circle"></span>
                     </div>
                  </a> <a href="#" class="item" id="review_QnA">
                     <div class="icon">ii</div>
                     <div class="text">리뷰 및 QnA 기록</div>
                  </a> <a href="goBasket.do" class="item" id="basket">
                     <div class="icon">ii</div>
                     <div class="text">장바구니</div>
                  </a> <a href="#" class="item" id="member_data">
                     <div class="icon">ii</div>
                     <div class="text">회원정보 변경</div>
                  </a>
               </div>
               <div id="login_view" style="display: none;">
                  <h1 id="join_h1">회원정보 수정</h1>
                  <form action="update.do" method="post">
                     <table id="join">
                        <tbody>






                           <tr>
                              <td>ID</td>
                              <td><input type="text" readonly
                                 value="${sessionScope.user.id }" name="id"></td>
                              <td></td>
                           </tr>
                           <tr>
                              <td>PW</td>
                              <td><input type="password"
                                 value="${sessionScope.user.pw}" placeholder="비밀번호를 입력해주세요"
                                 name="pw"></td>
                              <td></td>
                           </tr>
                           <tr>
                              <td>NICK</td>
                              <td><input type="text" value="${sessionScope.user.nick}"
                                  name="nick" readonly></td>
                              <td></td>
                           </tr>
                           <tr>
                              <td>PHONE</td>
                              <td><input type="text" id="cellPhone"
                                 value="${sessionScope.user.phone}" placeholder="핸드폰번호 입력"
                                 maxleangth="13" name="phone"></td>
                              <td></td>
                           </tr>
                           <tr>
                              <td>ADRESS</td>
                              <td><input type="text" id="sample6_postcode"
                                 value="${sessionScope.user.zipCode}" placeholder="우편번호"
                                 style="margin-right: 10px;" name="zipCode"></td>
                              <td><input id="post_btn" type="button"
                                 onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                              </td>
                           </tr>
                           <tr>
                              <td></td>
                              <td><input type="text" id="sample6_address"
                                 value="${sessionScope.user.addr}" placeholder="주소"
                                 name="addr"> <input type="text"
                                 id="sample6_detailAddress"
                                 value="${sessionScope.user.addrDetail}" placeholder="상세주소"
                                 name="addrDetail"></td>
                              <td></td>
                           </tr>
                           <tr>
                              <td></td>
                              <td><input type="text" id="sample6_extraAddress"
                                 value="${sessionScope.user.text}" placeholder="참고항목"
                                 name="text"></td>
                              <td></td>
                           </tr>


                           <tr>
                              <td>GENDER</td>
                              <td><label class="test_obj"> 
                              <input type="radio" name="gender" value="M"> 
                                 <span>남자</span>
                              </label><label class="test_obj"> 
                                 <input type="radio"   name="gender" value="W"> <span>여자</span>
                              </label></td>
                           </tr>
                           <tr>
                              <td class="login_btn" colspan="2"><button>수정하기</button></td>
                              
                              <td class="login_btn" colspan="2">
                                 <button type="button" id="widthraw">탈퇴하기</button>
                              </td>
                           </tr>
                           <tr id="hidden_line">
                              <td>비밀번호 :</td>
                              <td><input type="password" name="pw" id="pw_input" 
                              placeholder="비밀번호를 입력하세요"></td>
                              <td><button type="button" id="pwOkButton">확인</button></td>
                           </tr>
                        </tbody>
                     </table>
                  </form>

               </div>

               <div id="review" style="display: none;">
                  <ul>
                     
                     <article class="next">
                        <div class="paging">
                           <span class="prev"> <a href="#">이전</a>
                           </span> <span class="num"> <a href="#" class="on">1</a> <a
                              href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
                              <a href="#">6</a> <a href="#">7</a>
                           </span> <span class="next"> <a href="#">다음 ></a>
                           </span>
                        </div>
                  </ul>
               </div>
               
               <div id="email_boxes">
              
    <c:forEach var="orderlist" items ="${orders}">
    <div class="email-box">
        <p>
            안녕하세요. <strong>${orderlist.nick}</strong>님의 결제내역입니다.
        </p>
        <h3>결제 내역</h3>
        <table>
            <tr>
                <td><span>총 결제금액</span></td>
                <td><span>${orderlist.total_amount}</span>원</td>
            </tr>
            <tr>
                <td><span>할인 금액</span></td>
                <td>￦ ${orderlist.discount_amount}</td>
            </tr>
        </table>
        <p>
            전체 결제금액 <span>${orderlist.paid_amount}</span>원
        </p>
        <p>
            구매일 <span>${orderlist.created_at}</span>
        </p>
        <p><strong>${orderlist.order_status}</strong></p>
    </div>
</c:forEach>
                  </div>
                  
        </div>
   </header>
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
   <script src="assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
   <script src="assets/js/myPage.js"></script>
   <script>
   
   
   document.addEventListener("DOMContentLoaded", function() {
	    // 카운트 업데이트 코드 여기에 추가
	
   var orders = <%= jsonOrders %>;
   
// 주문 상태 카운트를 초기화합니다.
   var paymentCompleteCount = 0;
   var inDeliveryCount = 0;
   var deliveredCount = 0;
   
// 주문 목록을 반복하면서 각 상태에 따라 카운트를 증가합니다.
   for (var i = 0; i < orders.length; i++) {
       var orderStatus = orders[i].order_status;
       console.log(orders[i].order_status)
       if (orderStatus === "결제완료") {
           paymentCompleteCount++;
       } else if (orderStatus === "배송중") {
           inDeliveryCount++;
       } else if (orderStatus === "배송완료") {
           deliveredCount++;
       }
   }
   // 계산된 숫자를 HTML에 삽입합니다.
   document.querySelector(".payment-complete .number").textContent = paymentCompleteCount;
   document.querySelector(".in-delivery .number").textContent = inDeliveryCount;
   document.querySelector(".delivered .number").textContent = deliveredCount;
   });
   
  //========================================================================================================= 
   
   document.getElementById("ok").addEventListener("click", function () {
	    var inputPassword = document.getElementById("pw_input").value; // 입력한 비밀번호

	    $.ajax({
	        url: 'delete.do',
	        type: 'POST',
	        dataType: 'html', // HTML로 응답을 처리
	        data: { password: inputPassword }, // 비밀번호를 'password' 파라미터로 전송
	        dataType: 'json',
	        success: function (res) {
	           
	            console.log('요청 성공!!!', res);
	            $("#float").hide();
	            window.location.href = "main.do";
	        },
	        error: function (e) {
	            console.log('요청 실패!!!', e);
	            $("#float").hide();
	            window.location.href = "main.do";
	        }
	    });
	});
	    
	    
   
   //==================================================================== 
   document.getElementById("pwOkButton").addEventListener("click", function () {
       var inputPassword = document.getElementById("pw_input").value; // 입력한 비밀번호
       var sessionPassword = "<%= password %>"; // 세션에서 가져온 비밀번호
       var errorMessageElement = document.getElementById("errorMessage");
       var exitTextElement = document.getElementById("exitText");
       var okButton = document.getElementById("ok");
       var cancleButton = document.getElementById("cancle");
       
       // 비밀번호 검사
       if (inputPassword === sessionPassword) {
           // 비밀번호가 일치할 경우
           errorMessageElement.style.display = "none"; // 오류 메시지 숨김
           exitTextElement.style.display = "block"; // 회원탈퇴 화면 표시
           okButton.style.display = "block"; // 확인 버튼 표시
           cancleButton.style.width = "40%"; // 취소 버튼의 길이를 늘림
           cancleButton.style.margin = "5%"; // 취소 버튼의 길이를 늘림
       } else {
           // 비밀번호가 일치하지 않을 경우
           errorMessageElement.style.display = "block"; // 오류 메시지를 표시합니다.
           exitTextElement.style.display = "none"; // 회원탈퇴 화면 숨김
           okButton.style.display = "none"; // 확인 버튼 숨김
           cancleButton.style.width = "100%"; // 취소 버튼의 길이를 늘림
           cancleButton.style.margin = "0"; // 취소 버튼의 길이를 늘림
       }
   });
   
   
   //====================================================================
   
      
   $(document).ready(function() {
       $('#review_QnA').on('click', function() {
          // qnaList();// 클릭 시 reviewList 함수 실행
           reviewList();
           orderList();
       });
   });

  
   function orderList() {
       $.ajax({
           url : 'myPageOrder.do',
           type : 'get',
           data : {},
           dataType : 'json',
           success : function(res) {
                                 
               
           },
           error : function(e) {
               console.log('요청실패!!!', e);
           }
       });
   }
   
   function reviewList() {
       $.ajax({
           url : 'myPageReview.do',
           type : 'get',
           data : {},
           dataType : 'json',
           success : function(response) {
               let review = $('#review>ul');
               
               var reviewList = response.reviewList; // 리뷰 리스트
               var qnaList = response.qnaList; // QNA 리스트
               var reviewProd = response.product_review;
               var qnaProd = response.product_qna;
               
               
               
               for (let i = 0; i < reviewList.length; i++) {
                   let tr = "<li>";
                   tr += "<h1>리뷰</h1>";
                   tr += "<div><h5 class='rating star4'>리뷰</h5>";
                   tr += "<span>" + "${sessionScope.user.nick}"+" "+reviewList[i].created_at + "</span></div>";
                   tr += "<h3>" + reviewProd[i].prod_name + "</h3>"                           
                   tr += "<p>"+reviewList[i].review_content+"</p>";
                   tr += "</li>";
                     review.prepend(tr);                                 
               }
               for (let i = 0; i < qnaList.length; i++) {
                   let tr = "<li>";
                   tr += "<h1>QnA</h1>";
                   tr += "<div><h5 class='rating star4'>QnA</h5>";
                   tr += "<span>" + "${sessionScope.user.nick}"+" "+qnaList[i].created_at + "</span></div>";
                   tr += "<h3>" + qnaProd[i].prod_name + "</h3>"                           
                   tr += "<p>"+qnaList[i].q_content+"</p>";
                   tr += "</li>";
                     review.prepend(tr);                                 
               } 
              
               
               
           },
           error : function(e) {
               console.log('요청실패!!!', e);
           }
       });
   }
   </script>


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
   

   
</body>

</html>