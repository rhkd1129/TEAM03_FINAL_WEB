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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_payment_successcss.css">
	<script src="${pageContext.request.contextPath}/resource/script/addressapi.js"></script>
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
 
	<div class="successMain">
		<div class="successFrame">
			<div class="successTop">
				<div id="successTopHead">
					주문 완료
				</div>
				<div id="successTopBody">
					<table id="successTopBodyTable">
						<tr id="successTopBody1"><td>주문 감사합니다.</td></tr>
						<tr id="successTopBody2"><td>주문 요청이 완료되었으며 고객님의 휴대전화 번호로 주문 확인 문자가 곧 발송됩니다.</td></tr>					
					</table>
				</div>	
			</div>
			<div class="successMid">
				<div id="successMidHead">
					배달 정보
				</div>
				<div id="successMidBody">
					<table>
						<tr>
						<td id="successMidBody1">주문식당</td>
						<td id="successMidBody2">주문 감사합니다.</td>
						</tr>
						<tr>
						<td id="successMidBody1">결제수단</td>
						<td id="successMidBody2">주문 감사합니다.</td>
						</tr>
						<tr>
						<td id="successMidBody1">주문자 정보</td>
						<td id="successMidBody2">주문 감사합니다.</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="successBottom">
				<div id="successBottomHead">
					주문 내역
				</div>
				<div id="successBottomBody">
					<table>
						<%-- <c:forEach items="" var=""> --%>
						<tr>
						<td>항목</td>
						<td>가격</td>
						</tr>
						<%-- </c:forEach> --%>
						
						<tr>
						<td>총 결제 금액</td>
						<td>00000원</td>
						</tr>
					</table>
				
				</div>
			</div>
		</div>
	</div>
	








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
    location.href = "${pageContext.request.contextPath}/customer/customer_main.do";
});

</script>
</html>
