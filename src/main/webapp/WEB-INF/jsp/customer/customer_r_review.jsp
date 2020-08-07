<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
		
		<script>
			var rating = 0;
			$(function () {
				
				
				console.log(rating);
				  var $rateYo = $("#rateYo").rateYo({

					  onChange: function(rating, retaYoInstance){
						  $(this).next().text(rating);
					  }
				  });

				  rating = $rateYo.rateYo("rating");
				});

			function commentRegist() {
	             var crating = document.getElementById('rating').innerText;
	             var cmenu = $('#menu option:selected').val();
	             var form = $('#commentForm')[0];

	             // FormData 객체 생성
	             var formData = new FormData(form);

	             // 코드로 동적으로 데이터 추가 가능
	             formData.append("crating", crating);
	             formData.append("cmenu", cmenu);

	             $.ajax({
	                 type: "POST",
	                 url: "${pageContext.request.contextPath}/customer/customer_r_review.do",
	                 data: formData,
	                 processData: false,
	                 contentType: false,
	                 success: function (result) {
	                    alert("댓글을 등록했습니다.");
	                 },
	                 error: function (e) {
	                     console.log("ERROR : ", e);
	                 }
	             });
	         }
			
			function fnMore2()
			{
			  document.getElementById("divMore2").style.display="";
			  document.getElementById("bMore2").style.display="none";
			}

			function fnMore3()
			{
			  document.getElementById("divMore2").style.display="none";
			  document.getElementById("bMore2").style.display="";
			}
		</script>
		<style>
			.commentSubmit {
			  background-color: white;
			  color: black;
			  border: 2px solid #f44336;
			  padding: 22px 32px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 18px;
			  margin: 4px 2px;
			  transition-duration: 0.4s;
			  cursor: pointer;
			}

			.commentSubmit:hover {
			  background-color: #f44336;
		  	  color: white;
			}
			
			#rateYo {
				position:absolute;
				padding-top:5.5px;
			}
			
			.counter {
				font-size:30px;
				position:absolute;
				padding-left:170px;
			}
			
			.avgrating {
				font-size:30px;
				position:absolute;
				padding-left:550px;
			}
			
			#menu {
				position:absolute;
				margin-left:350px;
				margin-top:15px;
				padding-right:50px;
				
			}
		</style>
		
	</head>
	<body>
		<div style="text-align:center">
			<img src="${pageContext.request.contextPath}/resource/image/customer/kyochon.jpg">
		</div>
		<h3>사장님 한마디</h3>
		<div>
			안녕하세요! 교촌치킨 삼전점입니다.<br>
			저희 가게를 찾아주셔서 감사드리구요. 조금 부족한 부분이 있어도
			이해해주시고 응원해주셔서 정말 감사드립니다.
			항상 철저한 위생과 서비스에 신경쓰도록 하겠습니다.
			앞으로도 변함없는 모습으로 찾아뵙겠습니다.
		</div>
		
		<b id="bMore2" onclick="fnMore2()" 
		 style="color: #f44336; cursor: pointer; font-size: 12pt; font-weight: normal;"> 
		    더보기
		</b>
		<br />
		<div id="divMore2" style="display: none;">
		  ★리뷰이벤트★<br>
		  리뷰를 작성해주시는 분들께 나쵸칩 or 허니스파클링(택1)을 서비스로 드립니다!<br><br>
		  ☞참여방법☜<br>
		  치킨 주문 후 요청사항에 이벤트 참여한다고 기재해주세요!<br>
		  ex) 리뷰 참여, 허니스파클링<br>
		  치킨과 함께 서비스도 받으시고 간단하게 리뷰 작성해주시면 됩니다!
		  <b onclick="fnMore3()" 
		  style="color: #f44336; cursor: pointer; font-size: 12pt; font-weight: normal;"> 
		    접기
		  </b>
		
		</div>
	
		<h1 style="margin-top:20px; margin-bottom:50px;">Customer Review</h1>

			<form id="commentForm" method="post">
				<table>
					<tr>
						<th id="rateYo"></th>
						<th class="counter" id="rating"></th>
						<th class="avgrating">별점 평균: ${comment.cavgrating}</th>
					</tr>
				</table>
				<%-- <table>
					<tr>
						<th id="rateYo"></th>
						<th class="counter" id="rating" style="font-size:30px; padding-left:5px; padding-top:20px;"></th>
						<th style="float:left; margin-left:50px; font-size:30px; padding-top:31px;">평균 별점: ${comment.cavgrating}</th>
					</tr>
				</table> --%>
				<%-- <div id="rateYo" style="float:left"></div>
				<div class="counter" id="rating" style="font-size:30px"></div>
				<div style="float:left; margin-left:50px; font-size:30px;">${comment.cavgrating}</div> --%>
					<select name="menu" id="menu">
						<option value='' selected>--선택--</option>
							<c:forEach var="orderReceipt" items="${menuList}">
								<option id="selectedMenu">${orderReceipt.osummary}</option>
							</c:forEach>
					</select>
					
				<div style="margin-top:60px; float:left;">
					<textarea id="commentReview" name="ccontent" rows="3" cols="85" style="resize:none"></textarea>
				</div>
				<div style="margin-top:57px; margin-left:10px; float:left;">
					<input id="commentReview_savebtn" class="commentSubmit" type="button" value="등록" onclick="commentRegist()"/>
				</div>
			</form>
		
		<table style="margin-top:180px">
			<thead>
				<tr style="font-size:20px">
					<th style="padding-bottom:30px; width:50px;">번호</th>
					<th style="text-align:center; padding-bottom:30px; width:100px;">ID</th>
					<th style="text-align:center; padding-bottom:30px; width:150px;">메뉴</th>
					<th style="text-align:center; padding-bottom:30px; width:50px;">별점</th>
					<th style="text-align:center; padding-bottom:30px; width:150px;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="comment" items="${list}" varStatus="status">
					<tr>
						<td style="width:50px; padding-bottom:30px;"><c:out value="${status.count}"></c:out></td>
						<td style="text-align:center; width:100px; padding-bottom:30px;"><c:out value="${comment.cmid}"></c:out></td>
						<td style="text-align:center; width:150px; padding-bottom:30px;"><c:out value="${comment.cmenu}"></c:out></td>
						<td style="text-align:center; width:50px; padding-bottom:30px;"><c:out value="${comment.crating}"></c:out></td>
						<td style="text-align:center; width:150px; padding-bottom:30px;"><c:out value="${comment.cdate}"></c:out></td>
					</tr>
					<tr>
						<td style="padding-bottom:50px; display:none;">
							<c:set var="texts" value="${comment.ccontent}"/>${fn:length(texts)}
						</td>
						<c:if test="${fn:length(texts) < 235}">
							<td style="padding-bottom:50px;" colspan="7">${comment.ccontent}</td>
						</c:if>
						<c:if test="${fn:length(texts) >= 235}">
							<td style="padding-bottom:50px" colspan="7">
								<details>
									<summary>장문 리뷰 펼치기</summary>
									<p>${comment.ccontent}</p>
								</details>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>





	</body>
</html>
