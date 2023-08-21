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




	<p>=============================================================================================================================================================================</p>
	<h1>상품 평</h1>

	<li>댓글 : <input type="text" id="review_content"
		placeholder="댓글을 입력해주세요"></li>
	<li>평점 : <input type="number" id="ratings" step="0.5" min="0"
		max="5" value="5.0"></li>
	<br>
	<li><button id="insert">올리기</button></li>
	<br>

	<table border="2">
		<tr>
			<td>리뷰번호</td>
			<td>닉네임</td>
			<td>리뷰 내용</td>
			<td>별점</td>
			<td>수정 / 삭제</td>
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
					<c:if test="${review.nick eq sessionScope.user.nick}">
						<td>
							<button class="updateButton"
								data-review-id="${review.review_seq}">수정</button>
							<button class="deleteButton"
								data-review-id="${review.review_seq}">삭제</button>
						</td>
					</c:if>
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
	<div class="updateForm" style="display: none;">
		<input type="text" class="updateContent"> <input type="number"
			class="updateRatings" step="0.5" min="0" max="5">
		<button class="saveButton">수정 완료</button>
	</div>



	<p>=============================================================================================================================================================================</p>
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
            <th style="width: 5%;">문의번호</th>
            <th style="width: 10%;">질문자</th>
            <th style="width: 80%;">문의 내용</th>
            <th style="width: 15%;">댓글</th>
        </tr>
    </thead>
    <tbody id="qna_tbd">
        <c:forEach var="qna" items="${qna}">
            <tr>
                <td>${qna.q_seq}</td>
                <td>${qna.nick}</td>
                <td>${qna.q_content}</td>
                
                <td>
                    <c:if test="${sessionScope.user.m_type == 'A'}">
                        <button class="answerButton" data-qna-id="${qna.q_seq}">댓글</button>
                    </c:if>
                </td>
            </tr>

            <!-- 댓글 폼과 댓글 표시 영역 -->
            <tr class="commentRow" style="display: none;">
                <td colspan="4">
                    <div class="commentForm" style="margin-top: 10px;">
                        <input type="text" class="a_content">
                        <button class="addAnswerButton">댓글</button>
                    </div>
                    <div class="comments" style="margin-top: 10px;"></div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>





		<p>=============================================================================================================================================================================</p>
		<!-- 세션에 저장된 유저 닉네임 사용하려고 가져온 스크립트 태그 -->
		<script>
			var userNick = "${sessionScope.user.nick}";
		</script>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"
			integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
			crossorigin="anonymous"></script>
		<script type="text/javascript">
		
		
			$(document).ready(function() {

			$('#damgi').on('click', inCart);
				$('#insert').on('click', inReview);
				$('#question').on('click', inQuestion);
				$('.updateButton').on('click', showUpdateForm);
				$('.saveButton').on('click', updateReview);
				$('.deleteButton').on('click', deleteReview);
				$('.answerButton').on('click', function() {
					let isAdmin = "${sessionScope.user.m_type}" === 'A';

					if (isAdmin) {
						let row = $(this).closest('tr');
						row.next('.commentRow').toggle();
					}
				});
				$('.addAnswerButton').on('click', addAnswer);

			});

			// ====================================================================================================================================        

			function inCart() {
				let prod_cnt = $('#prod_cnt').data('value');
				let prod_name = $('#prod_name').data('value');
				let prod_seq = $('#prod_seq').data('value');
				let prod_price = $('#prod_price').data('value');

				$
						.ajax({
							url : 'inCart.do',
							type : 'post',
							contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
							data : {
								"prod_cnt" : prod_cnt,
								"prod_seq" : prod_seq,
								"prod_name" : prod_name,
								"prod_price" : prod_price
							},
							dataType : 'json',
							success : function(res) {
								console.log('성공!!');
							},
							error : function(e) {
								console.log('요청실패!!!');
							}
						});
			}

			// ====================================================================================================================================    

			function inReview() {
				let review_content = $('#review_content').val();
				let prod_seq = $('#prod_seq').data('value');
				let ratings = $('#ratings').val();

				$
						.ajax({
							url : 'inReview.do',
							type : 'post',
							contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
							data : {
								"review_content" : review_content,
								"prod_seq" : prod_seq,
								"ratings" : ratings
							},

							dataType : 'json',
							success : function(res) {
								console.log('요청성공');

								let tbody = $('#tbd');
								tbody.html('');

								for (let i = 0; i < res.length; i++) {

									tr = "<tr>";
									tr += "<td>" + res[i].review_seq + "</td>"
									tr += "<td>" + res[i].nick + "</td>"
									tr += "<td>" + res[i].review_content
											+ "</td>"
									tr += "<td>" + res[i].ratings + "</td>"
									tr += "</tr>";

									// html('code') :덮어쓰기
									// after('code'):닫는태그 바로뒤에 추가
									// before('code'):여는태그 바로앞에 추가
									// append('code'):자식요소로 추가
									tbody.append(tr);

								}

								// 글을 작성하고 난 후에 새로고침 실행
								location.reload();

							},
							error : function(e) {
								console.log('요청실패!!!');
							}
						});

			}

			// ====================================================================================================================================    

			function inQuestion() {
				let q_content = $('#q_content').val();
				let prod_seq = $('#prod_seq').data('value');

				$.ajax({
					url : 'question.do',
					type : 'post',
					data : {
						"q_content" : q_content,
						"prod_seq" : prod_seq,

					},
					dataType : 'json',
					success : function(res) {
						console.log('요청성공');
						let tbody = $('#qna_tbd');
						tbody.html('');
						console.log(res)
						for (let i = 0; i < res.length; i++) {
							tr = "<tr>";
							tr += "<td>" + res[i].q_seq + "</td>"
							tr += "<td>" + res[i].nick + "</td>"
							tr += "<td>" + res[i].q_content + "</td>"
							tr += "</tr>";
							tbody.append(tr);
						}

					},
					error : function(e) {
						console.log('요청실패!!!');
					}
				});

			}

			//====================================================================================================================================        

			// 리뷰 수정 창 보이기
			function showUpdateForm() {
				let reviewId = $(this).data('review-id');
				let reviewContent = $(this).closest('tr').find('td:eq(2)')
						.text();
				let ratings = $(this).closest('tr').find('td:eq(3)').text();

				$('.updateContent').val(reviewContent);
				$('.updateRatings').val(ratings);

				$('.updateForm').show();
				$('.saveButton').data('review-id', reviewId);
			}

			//====================================================================================================================================        

			// 리뷰 수정
			function updateReview() {
				let reviewId = $(this).data('review-id');
				let updatedContent = $('.updateContent').val();
				let updatedRatings = $('.updateRatings').val();

				// 세션에 저장된 사용자의 nick
				let userNick = "${sessionScope.user.nick}";

				$
						.ajax({
							url : 'updateReview.do',
							type : 'post',
							data : {
								"review_seq" : reviewId,
								"review_content" : updatedContent,
								"ratings" : updatedRatings
							},
							dataType : 'json',
							success : function(res) {
								console.log('요청성공');

								// 업데이트 성공 후 필요한 동작 수행
								let tbody = $('#tbd');
								tbody.html('');

								for (let i = 0; i < res.length; i++) {
									// 리뷰 작성자와 세션 사용자 일치 여부 확인
									if (res[i].nick === userNick) {
										// 리뷰 작성자와 세션 사용자가 일치하는 경우에만 리뷰 수정
										tr = "<tr>";
										tr += "<td>" + res[i].review_seq
												+ "</td>"
										tr += "<td>" + res[i].nick + "</td>"
										tr += "<td>" + res[i].review_content
												+ "</td>"
										tr += "<td>" + res[i].ratings + "</td>"
										tr += "<td><button class='updateButton' data-review-id='"+res[i].review_seq+"'>수정</button></td>";
										tr += "<td><button class='deleteButton' data-review-id='"+res[i].review_seq+"'>삭제</button></td>";
										tr += "</tr>";
										tbody.append(tr);
									}
								}

								// 댓글 업데이트 후 페이지 새로고침
								location.reload();

							},
							error : function(e) {
								console.log('요청실패!!!');
							}
						});

				// 수정 폼 숨기기
				$('.updateForm').hide();
			}

			//====================================================================================================================================        

			// 댓글 삭제
			function deleteReview() {
				let reviewId = $(this).data('review-id');
				// 선택된 버튼의 부모 행을 가져옴
				let rowToRemove = $(this).closest('tr');
				// 세션에 저장된 사용자의 nick
				let userNick = "${sessionScope.user.nick}";

				$.ajax({
					url : 'deleteReview.do',
					type : 'post',
					data : {
						"review_seq" : reviewId
					},
					dataType : 'json',
					success : function(res) {
						console.log('삭제 요청 성공');

						// 삭제된 리뷰 제거
						$('#review_seq').filter(function() {
							return $(this).text() === reviewId.toString();
						}).closest('tr').remove();
						// 삭제후 새로고침
						location.reload();
					},
					error : function(e) {
						console.log('삭제 요청 실패!!!');
					}
				});
			}

			//====================================================================================================================================        

			 function addAnswer() {

			 let row = $(this).closest('.commentRow');
			 let q_seq = row.prev('tr').find('td:eq(0)').text(); // 문의번호 가져오기
			 let a_content = row.find('.a_content').val(); // 댓글 내용 가져오기

			 $.ajax({
			 url: 'addAnswer.do',
			 type: 'post',
			 data: {
			 "q_seq": q_seq,
			 "a_content": a_content
			 },
			 dataType: 'json',
			 success: function(res) {
			 console.log('댓글 추가 성공');
			
			 // 추가된 댓글 화면에 표시
			 let commentTbody = row.find('.comments');
			 let commentRow = `<div>${res.nick}: ${res.a_content}</div>`;
			 commentTbody.append(commentRow); // append를 사용하여 댓글을 추가합니다

			 // 댓글 입력 필드 초기화
			 row.find('.a_content').val('');
			 },
			 error: function(e) {
			 console.log('댓글 추가 실패');
			 }
			 });
			 }
		</script>
</body>


</html>

