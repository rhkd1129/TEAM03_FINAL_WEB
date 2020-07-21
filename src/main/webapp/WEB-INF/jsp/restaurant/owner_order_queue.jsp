<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/owner_order_queuecss.css">
	</head>
	<body>
		<div class="orderlist" >
			<div class="order">
				<table>
					<tr>
						<td class="oredertime">	
							13:22
						</td>
						<td class="orederdetail">
							<img src="${pageContext.request.contextPath}/resource/image/restaurant/order_temp.png">
						</td>
						<td class="orederstatus">
							<button>접수하기</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="order">
				<table>
					<tr>
						<td class="oredertime">	
							13:22
						</td>
						<td class="orederdetail">
							<img src="${pageContext.request.contextPath}/resource/image/restaurant/order_temp.png">
						</td>
						<td class="orederstatus">
							<button>접수하기</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="order">
				<table>
					<tr>
						<td class="oredertime">	
							13:22
						</td>
						<td class="orederdetail">
							<img src="${pageContext.request.contextPath}/resource/image/restaurant/order_temp.png">
						</td>
						<td class="orederstatus">
							<button>접수하기</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>