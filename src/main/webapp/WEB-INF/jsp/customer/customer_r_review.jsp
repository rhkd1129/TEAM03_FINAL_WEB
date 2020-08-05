<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_r_review.css">
		<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
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
	             var form = $('#commentForm')[0];
	   
	             // FormData 객체 생성
	             var formData = new FormData(form);
	   
	             // 코드로 동적으로 데이터 추가 가능
	             formData.append("crating", crating);
	   
	             $.ajax({
	                 type: "POST",
	                 url: "${pageContext.request.contextPath}/customer/customer_r_review.do",
	                 data: formData,
	                 processData: false,
	                 contentType: false,
	                 success: function (result) {
	                    alert("댓글이 등록되었습니다.");
	                 },
	                 error: function (e) {
	                     console.log("ERROR : ", e);
	                 }
	             });
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
		</style>
		
	</head>
	<body>
		<h5 class="alert alert-success">/리뷰.jsp</h5>
		
		<c:if test="${sessionMid != null}">
			<form id="commentForm" method="post">
				<div id="rateYo" style="float:left"></div>			
				<div class="counter" id="rating"></div>
				
				<div style="margin-top:15px; float:left;">
					<textarea id="commentReview" name="ccontent" rows="3" cols="85" style="resize:none"></textarea>
				</div>
				<div style="margin-top:11.5px; margin-left:10px; float:left;">
					<input id="commentReview_savebtn" class="commentSubmit" type="button" value="등록" onclick="commentRegist()"/>
				</div>
			</form>
		</c:if>
		
		
		
		
		
	</body>
</html>