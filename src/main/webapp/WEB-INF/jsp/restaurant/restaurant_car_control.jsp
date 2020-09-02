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
		<div class="movebutton">
			<button class="btn btn-danger btn-sm" id="left">◀</button>
			<button class="btn btn-danger btn-sm" id="right">▶</button>
			<button class="btn btn-danger btn-sm" id="up">▲</button>
			<button class="btn btn-danger btn-sm" id="down">▼</button>
			<button class="btn btn-danger btn-sm" id="stop">■</button>
		</div>
		<div class="ViewBox">
			<img id = "cameraView" style="width:600px; height:399px">					
		</div> 
		<div>
			<table>
				<tr>
					<td>위치</td><td id="location"></td>
				</tr>			
				<tr>
					<td>신호등</td><td id="traffic_light"></td>
				</tr>
				<tr>
					<td>제한속도</td><td id="speed"></td>
				</tr>
				<tr>
					<td>표지판</td><td id="sign"></td>
				</tr>
				<tr>
					<td>사물</td><td id="road_thing"></td>
				</tr>
			</table>
		</div>
	</body>
	<script src="${pageContext.request.contextPath}/resource/script/index.js"></script>
	
	<script type="text/javascript">
		var stopCnt = 0
	
		$(function(){
			client = new Paho.MQTT.Client("192.168.3.163", 61614, new Date().getTime().toString());
			client.onMessageArrived = onMessageArrived;
			client.connect({onSuccess:onConnect});
		});
		/* 연결 완료 및 클라이언트 값 구독 */
		function onConnect() {
			client.subscribe("/camerapub");
			client.subscribe("/Message/#");
		}
		
		function onMessageArrived(message) {
			if(message.destinationName == "/camerapub") {
				var cameraView = $("#cameraView").attr(
						"src", "data:image/jpg;base64," + message.payloadString);
				
			}
			
			/* if(message.destinationName == "/Message") {
				var location = JSON.parse(message.payloadString).location
				var traffic_light = JSON.parse(message.payloadString).traffic_light
				var speed = JSON.parse(message.payloadString).speed
				var sign = JSON.parse(message.payloadString).sign
				var road_thing = JSON.parse(message.payloadString).road_thing
				
				$('#location').text(location);
				$('#traffic_light').text(traffic_light);
				$('#speed').text(speed);
				$('#sign').text(sign);
				$('#road_thing').text(road_thing);
				
				if (sign == 'stop') {
					if (stopCnt < 50) {
						MotorStop()
						stopCnt = stopCnt + 1

					} else {
						MotorAccel()
						stopCnt = 0
					}
					
				}
				
			} */
			
			
			/* if(message.destinationName == "/Message/Detection") {
				var detectedList = message.payloadString
				console.log(detectedList)
			}
			
			if(message.destinationName == "/Message/Status") {
				var ono = JSON.parse(message.payloadString).ono
				var status = JSON.parse(message.payloadString).status
				$('#status').text("status:" + status);
				$('#ono').text("ono:" + ono);
			} */
			/* var message = new Paho.MQTT.Message("frame arrived");
			message.destinationName = "/Frame/Flag";
			message.qos = 0;
			client.send(message); */
		}
	</script>
	<script src="${pageContext.request.contextPath}/resource/script/restaurant_car_control.js"></script>
</html>