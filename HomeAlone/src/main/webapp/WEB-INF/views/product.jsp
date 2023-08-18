<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.ha.entity.TB_Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ha.entity.TB_Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>





<body>

   <h1>상품 정보</h1>
   <table border="2">
      <tr>
         <td>상품 번호</td>
         <td>상품 갯수</td>
         <td>상품 이름</td>
         <td>상품 가격</td>
      </tr>
      <tr>
         <td><p id="prod_seq" data-value="5">p-5</p></td>
         <td><p id="prod_cnt" data-value="1">1</p></td>
         <td><p id="prod_name" data-value="사무용 의자">사무용 의자</p></td>
         <td><p id="prod_price" data-value="180000">180000</p></td>
      </tr>
      <tr>
         <td>상품 평</td>
         <td>23개</td>
      </tr>
      <tr>
         <td>별점</td>
         <td>2.7</td>
      </tr>
   </table>
   <br>
   <li>장바구니
      <button id="damgi">담기</button>
   </li>




   <p>=========================================================================================================================</p>
   <h1>상품 평</h1>

   <li>댓글 : <input type="text" id="review_content"></li>
   <li>평점 : <input type="number" id="ratings" step="0.5" min="0"
      max="5"></li>
   <br>
   <li><button id="insert">올리기</button></li>
   <br>

   <table border="2">
      <tr>
         <td>리뷰번호</td>
         <td>닉네임</td>
         <td>리뷰 내용</td>
         <td>별점</td>
      </tr>

      <tbody id="tbd">
         <%
         if ("${review}" != null) {
         %>

         <c:forEach var="review" items="${review}">
            <tr>
               <td id="review_seq">${review.review_seq}</td>
               <td>${review.nick}</td>
               <td>${review.review_content}</td>
               <td>${review.ratings}</td>
            </tr>
         </c:forEach>

         <%
         } else {
         %>
         <tr>
            <td></td>
            <td></td>
            <td></td>
         </tr>

         <%
         }
         %>
      </tbody>


   </table>


   <p>=========================================================================================================================</p>
   <h1>상품문의</h1>

   <div style="margin-bottom: 10px;">
      <textarea id="q_content" rows="4" cols="50" style="width: 50%;"></textarea>
   </div>

   <button id="question">문의하기</button>

   <br>
   <br>

   <table border="1" style="width: 50%;">
      <thead>
         <tr>
            <th style="width: 20%;">질문자</th>
            <th style="width: 80%;">문의 내용</th>
         </tr>
      </thead>
      <tbody id="qna_tbd">

         <c:forEach var="qna" items="${qnaList}">
            <tr>
               <td>${qna.nick}</td>
               <td>${qna.q_content}</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>










   <script src="https://code.jquery.com/jquery-3.7.0.min.js"
      integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
      crossorigin="anonymous"></script>
   <script type="text/javascript">

    $(document).ready(function() {
        $('#damgi').on('click', inCart);
        $('#insert').on('click', inReview);
        $('#question').on('click', inQuestion); 
    });

    function inCart(){
        let prod_cnt = $('#prod_cnt').data('value');
        let prod_name = $('#prod_name').data('value');
        let prod_seq = $('#prod_seq').data('value');
        let prod_price = $('#prod_price').data('value');
        
        $.ajax({
            url : 'inCart.do',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: {
                "prod_cnt": prod_cnt,
                "prod_seq": prod_seq,
                "prod_name": prod_name,
                "prod_price": prod_price
            },
            dataType: 'json',
            success: function(res){
                console.log('성공!!');
            },
            error: function(e){
                console.log('요청실패!!!');
            }
        });
    }
    
    function inReview(){
        let review_content = $('#review_content').val();
        let prod_seq = $('#prod_seq').data('value');
        let ratings = $('#ratings').val();
        
        $.ajax({
            url : 'inReview.do',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: {
                "review_content": review_content,
                "prod_seq": prod_seq,
                "ratings": ratings
            },
            
            dataType: 'json',
            success: function(res){
               console.log('요청성공');
               let tbody=$('#tbd');
            tbody.html('');
            console.log(res[0].review_content)
            
            for(let i =0; i<res.length; i++){
               
               tr= "<tr>";
               tr += "<td>"+res[i].nick+"</td>"
               tr += "<td>"+res[i].review_content+"</td>"
               tr += "<td>"+res[i].ratings+"</td>"
               tr +="</tr>";
               
               // html('code') :덮어쓰기
               // after('code'):닫는태그 바로뒤에 추가
               // before('code'):여는태그 바로앞에 추가
               // append('code'):자식요소로 추가
               tbody.append(tr);

            } 
            },
            error: function(e){
                console.log('요청실패!!!');
            }
        });
    
        }
    
function inQuestion() {
        let q_content = $('#q_content').val();
        let prod_seq = $('#prod_seq').data('value');
        $.ajax({
            url: 'question.do',
            type: 'post',
            data: {
               "prod_seq": prod_seq,
                "q_content": q_content
            },
            dataType: 'json',
            success: function(res) {
                console.log('요청성공');
                let tbody = $('#qna_tbd');
                tbody.html('');
            console.log(res)
                for (let i = 0; i < res.length; i++) {
                    tr = "<tr>";
                    tr += "<td>" + res[i].nick + "</td>"
                    tr += "<td>" + res[i].q_content + "</td>"
                    tr += "</tr>";
                    tbody.append(tr);
                }
            },
            error: function(e) {
                console.log('요청실패!!!');
            }
        });
    }
   </script>



</body>


</html>

