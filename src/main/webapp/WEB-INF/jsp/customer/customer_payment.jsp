<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문하기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
	<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_maincss.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_paymentcss.css">
	<script src="${pageContext.request.contextPath}/resource/script/addressapi.js"></script>
	<script>
			$(function(){
				sum = 0
				var i = 1
				while(true) {
					
					sum = sum + $('#price'+i).text() * $('#count'+i).text();
					var flag = $('#flag'+i).text()
					if(!flag) {
						break;
					}
					i = i + 1
				}
				$('#sum').text(sum);
				$('#test').val(sum);
			});
	</script>
</head>
<body>
	<div class="header">
		<div class="navbar1">
			<img class="zgiyo" src="${pageContext.request.contextPath}/resource/image/home/즈기요.png">

			<div class="boxbox">
				<c:if test="${sessionMid == null}">
					<div class="login"><a href="${pageContext.request.contextPath}/customer/customer_login.do"></a>로그인</div>
					<div class="join"><a href="${pageContext.request.contextPath}/customer/customer_join.do"></a>회원가입</div>
				</c:if>
				<c:if test="${sessionMid != null}">
					<button type="button" class="logout" onclick="location.href='${pageContext.request.contextPath}/customer/logout.do'">로그아웃</button>
				</c:if>
			</div>
		</div>
	</div>
	
	
 	<form id="paymentDetail" method="post" action="${pageContext.request.contextPath}/customer/customer_kakaopay.do">
		<div class="paymentMain">
			<div class="paymentMainFrame">
				<div class="paymentTop">
					결제하기
				</div>
					<div class="paymentBody">
						<div class="paymentInfo">
							배달 정보
						</div>
						<div class="paymentInfoContent">
							<table style="width: 100%;">
								<tr id="paymentInfoContentRows" style="display: none;">
									<td id="paymentInfoContentColumn1">가게 번호</td>
									<td>
										<input name="orno" value="${rno}" style="width:95%;">
										<input id="test" name="ototalprice" value="">
									</td>
								</tr>
							
								<tr id="paymentInfoContentRows">
									<td id="paymentInfoContentColumn1">주소</td>
									<td>
										<input name="ofulladdr" value="${fullAddr}" style="width:95%;">
									</td>
								</tr>
								<tr id="paymentInfoContentRows">
									<td id="paymentInfoContentColumn1"></td>
									<td>
										<input name="odetailaddr" placeholder="(필수) 상세주소 입력" style="width:95%;">
									</td>
								</tr>
								<tr id="paymentInfoContentRows">
									<td id="paymentInfoContentColumn1">휴대전화번호</td>
									<td>
										<input name="otel" placeholder="(필수) 휴대전화 번호 입력" style="width:95%;">
									</td>
								</tr>
							</table>
						</div>
						<div class="paymentRequirement">
							주문시 요청사항
						</div>
						<div class="paymentRequirementContent">
							<textarea name="orequirement" rows="3" cols="100"></textarea>
						</div>
						<div class="paymentMethod">
							결제수단 선택
						</div>
						<div class="paymentMethodContent">
							결제수단 선택
						</div>
					</div>
				
				
			</div>
		</div>
		<div class="paymentSide">
			<div class="paymentSideFrame">
				<div class="paymentSideTop">
					주문 내역
				</div>
				<div class="paymentSideBody">
					<c:forEach var="beforeOrder" items="${orderTableList}" varStatus="status">
						<table style="width:100%; margin-top: 2px; margin-bottom: 2px; border-bottom: 1px solid #d7dada;">
							<tr style="height: 30px">
								<td colspan="2" style="font-size: 17px; font-weight: bold; padding-left: 10px;">${beforeOrder.bfname}</td>
									
							</tr>	
							<tr style="height: 30px">
								<td id="price${status.count}" style="width: 100px; padding-left: 10px; text-align: right">${beforeOrder.bfprice}</td>
								<td style="width: 20px; text-align: left">원</td>
								<td id="count${status.count}" style="width:40px; text-align: right">${beforeOrder.bcount}</td>
								<td style="width: 40px;">개</td>
								<td id="flag${status.count}" style="display: none;">${status.last}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div style="height: 50px; color:#f4001f; font-size:20px; font-weight: bold; text-align: right; background-color: #ffffbe;">
				 	<table style="width: 100%;">
				 		<tr>
				 			<td style="text-align: left;">총 결제 금액 :</td>
				 			<td id="sum" style="text-align: right;">
				 			</td>
				 			<td>원</td>
				 		</tr>
				 	</table>
				</div>
				<div class="payment">
					 <input id="paymentSubmit" type="submit" style="width:100%; height: 50px; color:#ffffff; font-size:25px; font-weight: bold; text-align: center; background-color: #f4001f;" value="결제하기">
				</div>
			</div>
		</div>
	</form>



	<!-- FOOTER START ======================================== -->
	<div class="footermain1">
		<div class="footer1-1">
			<div class="footer1-2-1">이용약관</div>
			<div class="footer1-2-2">개인정보처리방침</div>
			<div class="footer1-2-3">회원등급정책</div>
			<div class="footer1-2-4">회사소개</div>
			<div class="footer1-2-5">즈기요사장님</div>
			<div class="footer1-2-6">입점문의</div>
			<div class="footer1-2-7">공지사항</div>

			<div class="foot1-2">
				<img class="footimg1" src="${pageContext.request.contextPath}/resource/image/home/footer/face.png">
				페이스북
			</div>
			<div class="foot1-3">
				<img class="footimg2" src="${pageContext.request.contextPath}/resource/image/home/footer/blog.png">
				블로그
			</div>
		</div>
	</div>

	<div class="footermain2">
		<img class="footimg3" src="${pageContext.request.contextPath}/resource/image/home/footer/footer.png">
	</div>
	<!-- FOOTER END ======================================== -->

</body>
<script type="text/javascript">
$(".login").click(function(){
    location.href = "${pageContext.request.contextPath}/customer/customer_login.do";
});

$(".logout").click(function(){
    location.href = "${pageContext.request.contextPath}/customer/logout.do";
});

$(".join").click(function(){
    location.href = "${pageContext.request.contextPath}/customer/customer_join.do";
});

$(".zgiyo").click(function(){
    location.href = "${pageContext.request.contextPath}/home/landingpage.do";
});

</script>
</html>
