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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
		
	</head>
	<body>
		<h5 class="alert alert-success">/xxx.jsp</h5>
		
		<div class="movebutton">
			<!-- 자동차 조종 방향키 -->
			<button class="btn btn-danger btn-sm" id="left">◀</button>
			<button class="btn btn-danger btn-sm" id="right">▶</button>
			<button class="btn btn-danger btn-sm" id="up">▲</button>
			<button class="btn btn-danger btn-sm" id="down">▼</button>
			<button class="btn btn-danger btn-sm" id="stop">■</button>
		</div>
		<div class="ViewBox">
			<img id = "cameraView" style="width:600px; height:399px">					
		</div>
	</body>
	<script type="text/javascript">
		$(function(){
			client = new Paho.MQTT.Client("192.168.3.163", 61614, new Date().getTime().toString());
			client.onMessageArrived = onMessageArrived;
			client.connect({onSuccess:onConnect});
		});
		/* 연결 완료 및 클라이언트 값 구독 */
		function onConnect() {
			client.subscribe("/Camera");
		}
		function onMessageArrived(message) {
			if(message.destinationName == "/Camera") {
				var cameraView = $("#cameraView").attr(
						"src", "data:image/jpg;base64,"+message.payloadString);
			}
		}
	</script>
	<script src="${pageContext.request.contextPath}/resource/script/restaurant_car_control.js"></script>
	
</html>