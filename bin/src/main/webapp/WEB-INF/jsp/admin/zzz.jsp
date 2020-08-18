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
      
      <!-- css import -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/zzz.css">
      	
	 <!-- MQTT impoert -->	 
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
  
</head>
<body>
<!-- 도로 차선 container -->
<div id='container'> 
    <div id='landscape'>
      <div id='road'>
          <div class='center'>   
                 
          		<!-- 좌측 차선 -->
          		<div class="leftcarline"></div>
          		<!-- 우측 차선 -->
          		<div class="rightcarline"></div>          		
          		
             <div id='line'>test</div>
          </div>
      </div>
    </div> 
</div>

<!-- 방지턱 예제 -->
<!-- <div class="speedbump"> -->
<!--     <div class="realspeedbump"> -->
<!--      	<div class="realspeedbump2"></div> -->
<!--     </div> -->
<!-- </div> -->

<!-- 데이터 페이지 -->
<div class="datapage"></div>

<!-- Jetson 이미지 -->
<%-- <img class="jetsoncar" src="${pageContext.request.contextPath}/resource/image/trafic/jetsoncar.png"> --%>

<!-- 표지판 이미지 -->
<div class="traficboard">
	<div class="traficimagebox">
		<img class="crosswalkimage" id="crosswalkimage" src="${pageContext.request.contextPath}/resource/image/trafic/횡단보도.png">
	</div>
	<div class="traficstick"></div>
</div>	



<!-- MQTT 연동 -->
<img id="cameraView9">


</body>

<script type="text/javascript">
/* 무작위로 이미지 띄우기 */	
var Numrandom = 2;
setInterval(function(action){	
	Numrandom = Math.floor(Math.random() * 100); 	
	console.log(Numrandom);
	/* 객체 인식이 없을 때 */
	if(Numrandom >= 0 && Numrandom < 26){
		$(".traficboard").css('-webkit-animation-name','iteration-count');
		$(".traficboard").css("display","none");	
		
		$("#road").css("-webkit-animation","drive 300s infinite linear");	
		$("#road").css("-moz-animation","drive 300s infinite linear");	
		$("#road").css("-ms-animation","drive 200s infinite linear");	
		$("#road").css("-o-animation","drive 300s infinite linear");	
		$("#road").css("animation","drive 300s infinite linear");	
	}				
	
	/* 횡단보도가 인식 되었을 때 */
	if(Numrandom >= 26 && Numrandom < 61){
		$(".traficboard").css("display","block");
		$(".traficboard").css('-webkit-animation-name','iteration-count');
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/횡단보도.png";			
		
		$("#road").css("-webkit-animation","drive 3s infinite linear");	
		$("#road").css("-moz-animation","drive 3s infinite linear");	
		$("#road").css("-ms-animation","drive 2s infinite linear");	
		$("#road").css("-o-animation","drive 3s infinite linear");	
		$("#road").css("animation","drive 3s infinite linear");	
	}				
			
	/* 신호등이 인식 되었을 때 */
	if(Numrandom >= 61 && Numrandom < 100){
		$(".traficboard").css("display","block");
		$(".traficboard").css('-webkit-animation-name','iteration-count');
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/신호등.png";				
		
		$("#road").css("-webkit-animation","drive 3s infinite linear");	
		$("#road").css("-moz-animation","drive 3s infinite linear");	
		$("#road").css("-ms-animation","drive 2s infinite linear");	
		$("#road").css("-o-animation","drive 3s infinite linear");	
		$("#road").css("animation","drive 3s infinite linear");	
	}	
	
// 	/* 방지턱 인식 되었을 때 */
// 	if(Numrandom >= 61 && Numrandom < 100){
// 		$(".realspeedbump2").css("display","block");
// 		$(".realspeedbump2").css('-webkit-animation-name','iteration-count1');				
		
// 		$("#road").css("-webkit-animation","drive 3s infinite linear");	
// 		$("#road").css("-moz-animation","drive 3s infinite linear");	
// 		$("#road").css("-ms-animation","drive 2s infinite linear");	
// 		$("#road").css("-o-animation","drive 3s infinite linear");	
// 		$("#road").css("animation","drive 3s infinite linear");	
// 	}	
	
}, 9000); 


/* MQTT start */
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
		var cameraView = $("#cameraView9").attr(
				"src", "data:image/jpg;base64,"+message.payloadString);
	}
	var message = new Paho.MQTT.Message("frame arrived");
	message.destinationName = "/Frame/Flag";
	message.qos = 0;
	client.send(message);
}
/* MQTT end */
</script>
</html>