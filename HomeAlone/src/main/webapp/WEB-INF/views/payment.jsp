<%@page import="com.ha.entity.TB_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<title>HOMEWORK</title>
<link rel="stylesheet" href="assets/css/payment.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
   <%
   TB_Member user = (TB_Member) session.getAttribute("user");
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
                  <td><input type="text" placeholder="아이디를 입력해주세요" name="id"></td>
               </tr>
               <tr>
                  <td>PW</td>
                  <td><input type="password" placeholder="비밀번호를 입력해주세요"
                     name="pw"></td>
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
                  <td><input type="text" placeholder="아이디를 입력해주세요" name="id"></td>
                  <td></td>
               </tr>
               <tr>
                  <td>PW</td>
                  <td><input type="password" placeholder="비밀번호를 입력해주세요"
                     name="pw"></td>
                  <td></td>
               </tr>
               <tr>
                  <td>NICK</td>
                  <td><input type="text" placeholder="닉네임을 입력해주세요" name="nick"></td>
                  <td></td>
               </tr>
               <tr>
                  <td>PHONE</td>
                  <td><input type="text" name="phone" id="cellPhone"
                     placeholder="핸드폰번호 입력" maxlength="13" /></td>
                  <td></td>
               </tr>
               <tr>
                  <td>ADRESS</td>
                  <td><input type="text" id="sample6_postcode" name="zipCode"
                     placeholder="우편번호" style="margin-right: 10px;"></td>
                  <td><input id="post_btn" type="button"
                     onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
               </tr>
               <tr>
                  <td></td>
                  <td><input type="text" id="sample6_address" name="addr"
                     placeholder="주소"> <input type="text"
                     id="sample6_detailAddress" name="addrDetail" placeholder="상세주소">
                  </td>
                  <td></td>
               </tr>
               <tr>
                  <td></td>
                  <td><input type="text" id="sample6_extraAddress" name="text"
                     placeholder="참고항목"></td>
                  <td></td>
               </tr>


               <tr>
                  <td>GENDER</td>
                  <td><label class="test_obj"> <input type="radio"
                        name="gender" value="M"> <span>남자</span>
                  </label> <label class="test_obj"> <input type="radio"
                        name="gender" value="W"> <span>여자</span>
                  </label></td>
               </tr>
               <tr>
                  <td id="login_btn" colspan="2"><button>JOIN US</button></td>
               </tr>
            </tbody>
         </table>
      </form>

   </div>
   <div class="navbar">   
      <a class="logo" href="main.do"> <img src="img/logo/image2.png"
         height="75px">
      </a>
      <ul id="menu">
      <form action="search.do" method="post" >
         <div id="search">
            <span>Search</span> <input type="text" id="search_content" name="search">
            <input id="search_img" type="image" src="img/icon/search2.png">
         </div>
      </form>
         <li id="search_btn"><a href="#home">검색</a></li>
         <li><a href="#html">게시판</a></li>
         <li><a href="goBasket.do">장바구니</a></li>
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

   <div id="wrapper">
      <main id="product">
         <aside>
            <ul class="category">



            </ul>
         </aside>

         <section class="cart">
            <div>
               <h1>주문내역</h1>
               <h1 id="customer">주문자</h1>
            </div>
            <span id="c_name">${user.nick}</span>
            <div class="flex-container">
               <p>HOME >> 장바구니 >> 주문내역</p>
            </div>

            <form action="#">
               <table border="0">
                  <tr>
                     <td id="selectAll"><input type="checkbox" onclick="toggleAll(this)"></td>
                     <th>상품명</th>
                     <th>상품번호</th>
                     <th>제품번호</th>
                     <th>총수량</th>
                     <th>배송비</th>
                     <th>소계</th>
                  </tr>
                    <c:if test="${list_empty}"> 
                  <tr class="empty">
                     <td colspan="7">장바구니에 상품이 없습니다.</td>
                  </tr>
                    </c:if> 
                    <c:if test="${!list_empty}"> 
                  <c:forEach var="list" items="${sessionScope.basket }" varStatus="status">
                     <tr class="basket">
                        <td><input type="checkbox" name="1" data-product-id="${list.prod_seq}"></td>
                        <td>
                           <article>
                              <a href="goProductcell.do?prod_seq=${list.prod_seq}"> <img src="${list.prod_img}" alt="1">
                              </a>
                              <div>
                                 <h2>
                                    <a>${list.prod_name}</a>
                                 </h2>
                                 <p>상품설명</p>
                              </div>
                           </article>
                        </td>

                     <td class="num">${status.index + 1}</td>
                     <td class="number">PHT-${list.prod_seq}</td>
                     <td>${list.prod_cnt}</td>
                     <td class="fr_send">무료배송</td>
                     <td id="price"><span>${list.prod_price * list.prod_cnt }원</span></td>
                     </tr>
                  </c:forEach>
                    </c:if>            
                  

               </table>
               <input type="button" name="del" value="선택삭제" onclick="deleteSelected()">


               <div class="container"><!-- 1차 컨테이너 시작 -->
                  <article class="delivery">

                     <h1>배송정보</h1>
                     <table>
                        <tr>
                           <td>주문자</td>
                           <td><input type="text" name="orderer" value="${sessionScope.user.nick}" readonly></td>
                           <td></td>
                        </tr>
                        <tr>
                           <td>휴대폰</td>
                           <td><input type="text" name="hp" value="${sessionScope.user.phone}" placeholder="핸드폰번호 입력"></td>
                           <td></td>
                        </tr>

                        <tr>
                           <td>우편번호</td>
                           <td><input type="text" id="zip" name="zip" value="${sessionScope.user.zipCode}" placeholder="우편번호"></td>
                           <td><input type="button" onclick="execDaumPostcode()" value="우편번호 검색"></td>
                        </tr>
                        <tr>
                           <td>도로명주소</td>
                           <td><input type="text" id="roadAddress" name="roadAddress" value="${sessionScope.user.addr}" placeholder="주소"></td>
                           <td></td>
                        </tr>
                        <tr>
                           <td>상세주소</td>
                           <td><input type="text" name="addr2" value="${sessionScope.user.addrDetail}" placeholder="상세주소"></td>
                           <td></td>
                        </tr>
                     </table>
                  </article>
                  <article class="payment">
                  <h1>결제방법</h1>
                     <article class="payment">
                        <h1>결제방법</h1>
                        <div class="payment-method">
                           <span><font color='royalblue'>신용카드</font></span><br> <label>
                              <input type="radio" name="payment" value="type1">ISP
                              결제
                           </label> <label> <input type="radio" name="payment"
                              value="type2">체크카드 결제
                           </label>
                        </div>
                        <div class="payment-method">
                           <span><font color='royalblue'>계좌이체</font></span><br> <label>
                              <input type="radio" name="payment" value="type3">실시간
                              계좌이체
                           </label> <label> <input type="radio" name="payment"
                              value="type4">무통장 입금
                           </label>
                        </div>
                        <div class="payment-method">
                           <span><font color='royalblue'>기타</font></span><br> <label>
                              <input type="radio" name="payment" value="type4">휴대폰
                              결제
                           </label> <label> <input type="radio" name="payment"
                              value="type5">카카오페이 <img src="" alt="">
                           </label>
                        </div>
                     </article>
               </article>
                              <div class="total">
                            <h2>전체합계</h2>
                            <table>
                                <tr>
                                    <td>상품수</td>
                                    <td id="selectedCount"></td>

                                </tr>
                                <tr>
                                    <td>상품금액</td>
                                    <td id="productsPrice"></td>

                                </tr>

                                <tr>
                                    <td>배송비</td>
                                    <td>무료배송</td>
                                </tr>

                                <tr>
                                    <td>전체주문금액</td>
                                    <td id="totalPrice"></td>

                                </tr>
                            </table>
                            <input type="submit" value="주문하기" >
                    </div><!-- total 종료  -->
               </div><!-- 1차 컨테이너 종료 -->
               
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

   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
   <script src="assets/js/code.jquery.com_jquery-3.7.0.min.js"></script>
   <script src="assets/js/products.js"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

   <script>
   $(document).ready(function() {
       $("#btn_payment").click(function() {
           // class가 btn_payment인 태그를 선택했을 때 작동한다.
           IMP.init('imp33005853');
           
           IMP.request_pay({
               pg : 'html5_inicis',
               pay_method : 'card',
               merchant_uid : 'merchant_' + new Date().getTime(),
               name : '(주)HomeTogether', // 결제창에서 보여질 이름
               amount : 2400, // 실제 결제되는 가격
               buyer_email : 'iamport@siot.do',
               buyer_name : '${sessionScope.user.nick}',
               buyer_tel : '${sessionScope.user.phone}',
               buyer_addr : '${sessionScope.user.addr}',
               buyer_postcode : '${sessionScope.user.zipCode}'
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
                  
                  
                  var orderer = $("input[name='orderer']").val();
                  var hp = $("input[name='hp']").val();
                  var zip = $("input[name='zip']").val();
                  var roadAddress = $("input[name='roadAddress']").val();
                  var addr2 = $("input[name='addr2']").val();
                  
                  
                  // 입력한 값을 세션에 저장
                  sessionStorage.setItem("orderer", orderer);
                  sessionStorage.setItem("hp", hp);
                  sessionStorage.setItem("zip", zip);
                  sessionStorage.setItem("roadAddress", roadAddress);
                  sessionStorage.setItem("addr2", addr2);
                  
                  
                  window.location.href = 'goComplete.do';
               }
               alert(msg);
           });
       });
   });
   </script>
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
                function execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            document.getElementById('zip').value = data.zonecode;
                            document.getElementById('roadAddress').value = data.roadAddress;
                        }
                    }).open();
                }
                
               /* $("#btn_payment").click(function() {
                    // 입력한 값들을 가져옴
                    var orderer = $("input[name='orderer']").val();
                    var hp = $("input[name='hp']").val();
                    var zip = $("input[name='zip']").val();
                    var roadAddress = $("input[name='roadAddress']").val();
                    var addr2 = $("input[name='addr2']").val();
                    
                    // 입력한 값을 세션에 저장
                    sessionStorage.setItem("orderer", orderer);
                    sessionStorage.setItem("hp", hp);
                    sessionStorage.setItem("zip", zip);
                    sessionStorage.setItem("roadAddress", roadAddress);
                    sessionStorage.setItem("addr2", addr2);
                    
                   
                });   */           
            </script>
            <script>
             $(document).ready(function () {
            function autoHypenPhone(str) {
                str = str.replace(/[^0-9]/g, '');
                var tmp = '';
                if (str.length < 4) {
                    return str;
                } else if (str.length < 7) {
                    tmp += str.substr(0, 3);
                    tmp += '-';
                    tmp += str.substr(3);
                    return tmp;
                } else if (str.length < 11) {
                    tmp += str.substr(0, 3);
                    tmp += '-';
                    tmp += str.substr(3, 3);
                    tmp += '-';
                    tmp += str.substr(6);
                    return tmp;
                } else {
                    tmp += str.substr(0, 3);
                    tmp += '-';
                    tmp += str.substr(3, 4);
                    tmp += '-';
                    tmp += str.substr(7);
                    return tmp;
                }
                return str;
            };

            var cellPhone = document.getElementById('cellPhone');
            cellPhone.onkeyup = function (event) {
                event = event || window.event;
                var _val = this.value.trim();
                this.value = autoHypenPhone(_val);
            };
            $(function () {
                $("button").click(function () {
                    $(":checkbox").attr("checked", "checked")
                })
            });
            $("#search_btn").click(function () {
                $("#search").toggleClass("on")
            });
            $("#search_btn").click(function(){
                $("#search").toggleClass("on")
            })
        })
      </script>

      <script>
         function toggleAll(source) {
            var checkboxes = document
                  .querySelectorAll('input[type="checkbox"]');
            for (var i = 0; i < checkboxes.length; i++) {
               if (checkboxes[i] !== source) {
                  checkboxes[i].checked = source.checked;
               }
            }
         }

         function deleteSelected() {
            //전체선택 체크박스 누르고 선택삭제했을때  전체선택 체크박스에 체크상태로 남아있었는데
            //체크 풀어주는 코드
            var selectAllCheckbox = document
                  .querySelector('#selectAll input[type="checkbox"]');
            selectAllCheckbox.checked = false;

            var checkboxes = document
                  .querySelectorAll('input[type="checkbox"]:checked');
            var selectAllCheckbox = document
                  .querySelector('#selectAll input[type="checkbox"]');
            
            var checkedProducts = [];
            
            
                 
              
            console.log("성공");
            // 체크박스 상품 사라지게하는 code !!!전체선택 체크박스 <tr>태그는 사라지지않게!! 
            for (var i = 0; i < checkboxes.length; i++) {
               
               checkedProducts.push(checkboxes[i].getAttribute('data-product-id'));
               
               var row = checkboxes[i].parentNode.parentNode;
               if (row !== selectAllCheckbox.closest('tr')) {
                  row.remove();
               }
            }
            
            updateSelectedCount(); // 선택된 상품 개수 업데이트
            updateTotalPrice(); // 가격 업데이트
            
            var checkedProductsString = checkedProducts.join(',');
               //리스트에 정보가 담겨있을때  ajax실행
              if (checkedProducts.length > 0) {
                  $.ajax({
                      url: "deleteCart.do", // 장바구니 세션에서 상품지우는 컨트롤러
                      type: 'POST',
                      
                      data: { "checkedProductsString" : checkedProductsString },
                      success: function(res) { 
                         if (res === "true") {                          
                          var td  = "<tr class='basket'>";
                          td += "<td colspan='7'>"                            
                          td +="장바구니에 상품이없습니다"
                          td +="</td></tr>"
                      
                          var select= $('#selectAll').parent();
                          select.after(td);
                          console.log("상품이없습니다!")
                         }else{
                            
                         }
                          console.log("상품이없습니다!")
                          
                      },
                      error: function(e) {
                          console.log('요청실패!!!');
                      }
                  });
              }else{
                 console.log("실패");
              }

         }
      </script>


      <script>
         // 체크 표시했을때 가격 올라가는 코드
         function updateTotalPrice() {
            var checkboxes = document
                  .querySelectorAll('input[type="checkbox"]:checked');
            var total = 0;

            for (var i = 0; i < checkboxes.length; i++) {
               var row = checkboxes[i].parentNode.parentNode;
               var priceCell = row.querySelector('#price'); // 가격이 들어있는 열 선택

               if (priceCell) {
                  var price = parseInt(priceCell.textContent.replace(
                        /[^0-9]/g, '')); // 문자열에서 숫자 추출
                  total += price;
               }
            }
            document.getElementById('productsPrice').textContent = total
                  .toLocaleString()
                  + '원';
            document.getElementById('totalPrice').textContent = total
                  .toLocaleString()
                  + '원'; // 총 가격 표시
         }

         $(function() {
            $("button").click(function() {
               $(":checkbox").attr("checked", "checked");
               updateTotalPrice();
            });

            $(":checkbox").click(function() {
               updateTotalPrice();
            });
         });
      </script>
      <script>
         //체크했을때 체크한 상품개수 올라가는 메서드

         function updateSelectedCount() {
            var checkboxes = document
                  .querySelectorAll('input[type="checkbox"]');
            var selectedCheckboxes = document
                  .querySelectorAll('input[type="checkbox"]:checked');
            var selectedCount = selectedCheckboxes.length;
            var totalCount = checkboxes.length;

            if (selectedCount === totalCount) {
               document.getElementById('selectedCount').textContent = (selectedCount - 1)
                     + '개';
            } else {
               document.getElementById('selectedCount').textContent = selectedCount
                     + '개';
            }
         }

         //체크박스 클릭했을때 체크되는 함수
         $(function() {
            $("button").click(function() {
               $(":checkbox").attr("checked", "checked");
               updateSelectedCount();
            });

            $(":checkbox").click(function() {
               updateSelectedCount();
            });
         });
      </script>
      
      <script>
    // 라디오 버튼이 변경될 때 이벤트 처리
    $('input[type="radio"][name="payment"]').on('change', function() {
        // 선택된 라디오 버튼의 값 가져오기
        var selectedValue = $("input[type='radio'][name='payment']:checked").val();
        
        // 선택된 값에 따라 텍스트를 가져와서 표시
        var selectedText = $(this).parent().text().trim();
        
        console.log("Selected Value: " + selectedValue);
        console.log("Selected Text: " + selectedText);
        
        // 선택된 값과 텍스트를 사용하여 원하는 동작 수행
        // 예를 들어, 선택된 값과 텍스트를 다른 곳에 표시할 수 있습니다.
    });
</script>
</body>


</html>