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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_mobile_logincss.css">
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		
		<script type="text/javascript">
			function validation() {
				var customerId = document.getElementById("id");
				var customerPassword = document.getElementById("password");
								
				var userId = /^[A-Za-z0-9+]{6,12}$/;
				var userPassword = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{8,16}$/;
				
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
		<div class="customerlogin" style="width: 100%;">
			<div>
				<img style="width: 100%; margin-top: 15%; margin-bottom: 10%;" class="customerloginimg" src="${pageContext.request.contextPath}/resource/image/customer/customer_login.png">
			</div>

			<div class="customerloginform" style="width: 100%;">
				<form:form method="post" modelAttribute="cloginForm" onsubmit="return validation()">
					<ul style="margin-left: 5%;">
						<li>아이디</li>
						<li>
							<form:input id="id" path="mid" autofocus="autofocus" style="width: 95%;"/>
						</li>
						<li>
							<form:errors path="mid" style="color:red"/>
						</li>
						<li style="margin-top: 5%;">비밀번호</li>
						<li style="margin-bottom: 5%;">
							<form:password id="password" path="mpassword" style="width: 95%;"/>
						</li>
						<li>
							<form:errors path="mpassword" style="color:red"/>
						</li>				
					</ul>
					<input type="submit" value="로그인" style="width: 90%; margin-left: 5%;"/>
				</form:form>
			</div>
		</div>
	
	
		




	</body>
</html>