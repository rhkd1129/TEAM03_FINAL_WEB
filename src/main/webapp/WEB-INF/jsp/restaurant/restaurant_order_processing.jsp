<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/restaurant_order_queuecss.css">
	</head>
	<body>
		<div class="orderlist" >
			<c:forEach var="orderReceipt" items="${processingList}">
			<div class="order">
				<table>
					<tr>
						<td class="oredertime">	
							<fmt:formatDate value="${orderReceipt.odate}" pattern="HH:mm"/>
						</td>
						<td class="orederdetail">
							${orderReceipt.ototalprice}원 <br>
							${orderReceipt.osummary} <br>
							${orderReceipt.ofulladdr} 
							${orderReceipt.odetailaddr}
						</td>
						<td class="orederstatus">
							<button>배달중</button>
						</td>
					</tr>
				</table>
			</div>
			</c:forEach>
		</div>
	</body>
</html>