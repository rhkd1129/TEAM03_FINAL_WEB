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
		
		</head>
	<body>
		<h5 class="alert alert-info">/member/cjoinForm.jsp</h5>
		
		<form:form method="post" modelAttribute="cmember">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<form:input path="mid"/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<form:input path="mpassword"/>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<form:input path="mname"/>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<form:input type="tel" path="mtel"/>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<form:input path="madress"/>
					</td>
				</tr>
			</table>
			
			<input type="submit" value="가입"/>
		</form:form>
		
	</body>
</html>