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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_maincss.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_logincss.css">
	
	<script type="text/javascript">
			function validation() {
				var idCheck = $('#idCheck').val();
				var customerId = document.getElementById("id");
				var customerPassword = document.getElementById("password");
				var customerName = document.getElementById("name");
				var customerTel = document.getElementById("tel");
				
				var userId = /^[A-Za-z0-9+]{6,12}$/;
				var userPassword = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{8,16}$/;
				var userName = /^[가-힣]{2,6}$/;
				var phoneNumber = /^[0-9]{2,3}-?[0-9]{3,4}-?[0-9]{4}$/;
				
				if (idCheck != "1") {
					alert("아이디 중복확인을 해주세요");
					return false;
				}
				
				if ((customerId.value) == "") {
			        alert("아이디를 입력해주세요.")
			        return false;
			    }
				
			    if (!check(userId, customerId, "대/소문자 구분 없이 6~12자리의 알파벳+숫자로 입력해주세요.")) {
			        return false;
			    }
			    
			    if ((customerPassword.value) == "") {
			        alert("비밀번호를 입력해주세요.")
			        customerPassword.focus();
			        return false;
			    }
			    
			    if (!check(userPassword, customerPassword, "최소 하나의 소문자와 숫자가 포함된\n8~16자리의 비밀번호를 입력해주세요.")) {
			        return false;
			    }
			    
			    if ((customerName.value)=="") {
		            alert("이름을 입력해 주세요.");
		            customerName.focus();
		            return false;
		        }
		        
		        if (!check(userName, customerName, "이름이 잘못 되었습니다.")) {
		            return false;
		        }
				
				if ((customerTel.value) == "") {
					alert("전화번호를 입력해주세요.");
			        return false;
			    }
				
			    if (!check(phoneNumber, customerTel, "전화번호를 제대로 입력해주세요. ex)01x-xxxx-xxxx")) {
			    	return false;
			    }
			    
			}
			
			function check(re, what, message) {
			    if (re.test(what.value)) {
			       return true;
			    }
			    alert(message);
			    what.value="";
			    what.focus();
			}
	</script>
	<script type="text/javascript">
			function id_check(){
				var customerId = document.getElementById("id");
				var userId = /^[A-Za-z0-9+]{6,12}$/;
				console.log("11111111111111111111111111111111")
				$.ajax({
					url:"idcheck.do",
					type:"post",
					data:{mid:$("#id").val()},
					success: function(data) {
						console.log("22222222222222222222222222222222222222222")
						if(data.result == "success"){
							if ($("#id").val() == "") {
								alert("아이디를 입력해주세요.")
								return false;
							} else if (!check(userId, customerId, "대/소문자 구분 없이 6~12자리의 알파벳+숫자로 입력해주세요.")) {
								return false;
						}
							alert("사용 가능한 아이디 입니다.")
							$("#id").attr("readonly",true)
							$("#user_id").attr("href","#")
							document.getElementById("idCheck").value="1";
							
						}else{
							alert("이미 존재하는 아이디입니다.")
						}
					}
				})
			}
			
			function check(re, what, message) {
			    if (re.test(what.value)) {
			       return true;
			    }
			    alert(message);
			    what.value="";
			    what.focus();
			}
	</script>
</head>
<body>
	<div class="navbar1">
		<div class="navbar2">
			<img class="zgiyo" src="${pageContext.request.contextPath}/resource/image/home/즈기요.png">
		</div>
	</div>

	<div class="customerlogin">
		<div>
			<img class="customerloginimg" src="${pageContext.request.contextPath}/resource/image/customer/customer_login.png">
		</div>

		<div class="customerloginform" style="width:576px">
			<form:form method="post" modelAttribute="cmember" onsubmit="return validation()">
				<ul>
					<li>아이디</li>
					<li>
						<form:input id="id" path="mid" style="width:500px; height:50px;"/>
					</li>
					<li>비밀번호</li>
					<li>
						<form:password id="password" path="mpassword" style="width:500px; height:50px;"/>
					</li>
					<li>이름</li>
					<li>
						<form:input id="name" path="mname" style="width:500px; height:50px;"/>
					</li>
					<li>전화번호</li>
					<li>
						<form:input id="tel" path="mtel" style="width:500px; height:50px;"/>
					</li>
					<li>주소</li>
					<li>
						<form:input id="adress" path="madress" style="width:500px; height:50px;"/>
					</li>				
				</ul>
				<input type="submit" value="가입" style="width:500px; height:50px; margin:20px"/>
			</form:form>
			<div>
				<a id="user_id" class="btn" href="javascript:id_check()">중복확인</a>
				<input type="hidden" name="idCheck" id="idCheck" value="0">
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
    location.href = "${pageContext.request.contextPath}/member/ologin.do";
});

$(".join").click(function(){
    location.href = "${pageContext.request.contextPath}/member/ojoin.do";
});

$(".zgiyo").click(function(){
    location.href = "${pageContext.request.contextPath}/home/landingpage.do";
});
</script>
</html>
