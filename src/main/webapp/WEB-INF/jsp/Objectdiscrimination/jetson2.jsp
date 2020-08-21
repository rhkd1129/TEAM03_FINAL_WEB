<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jetson</title>
	<link rel="icon" href="${pageContext.request.contextPath}/resource/img/hud2/zzz.png">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
   <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
   <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
   <!-- MQTT -->   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
   
   <!-- 탐지 css -->   
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/jetson2.css">

</head>
<body>

<!-- ------------------------------------------------------------------------------------------------------------- -->

<!-- Controller box -->
<div class="controllerbox">
	<button type="button" class="gostraight" id="gostraight">
		<img class="buttonicon" src="${pageContext.request.contextPath}/resource/image/hud2/전진.png">
	</button>
	<button type="button" class="gostop" id="gostop">■</button>
	<button type="button" class="goback" id="goback">
		<img class="buttonicon" src="${pageContext.request.contextPath}/resource/image/hud2/후진.png">
	</button>
	<button type="button" class="goleft" id="goleft">
		<img class="buttonicon" src="${pageContext.request.contextPath}/resource/image/hud2/왼쪽.png">
	</button>
	<button type="button" class="goright" id="goright">
		<img class="buttonicon" src="${pageContext.request.contextPath}/resource/image/hud2/오른쪽.png">
	</button>
</div>

<!-- ------------------------------------------------------------------------------------------------------------- -->

<div class="hoverbox location" id="hoverbox">
    <div class="screen">
       <img   class="hud01" src="${pageContext.request.contextPath}/resource/image/hud3/hover01.png">
       <img   class="hud02" src="${pageContext.request.contextPath}/resource/image/hud3/hover02.png">         
       <img   class="hud03" src="${pageContext.request.contextPath}/resource/image/hud3/hover03.png">
       <img   class="hud04" src="${pageContext.request.contextPath}/resource/image/hud3/hover04.png">
       <img   class="hud05" src="${pageContext.request.contextPath}/resource/image/hud3/hover05.png">              
    </div>
</div>
<!-- canvas 드로잉 판 -->
<div id = "total">
  <!-- 카메라 캔버스 -->
   <canvas id="cameraLayer"></canvas>
   
   <!-- 탐지 css 설명 캔버스 -->
   <div class="catchlist" id="catchlist">    	
   </div>     
 </div>

<!-- ------------------------------------------------------------------------------------------------------------- -->

<!-- Left Menu -->
<div id="leftmenu">
  
  <div id="date_time">
    <div id="date" class="semi_arc e4">
      <div class="semi_arc_2 e4_1">
        <div class="counterspin4"></div>
      </div>
        <div style="font-size: 40px; margin-top: 15px;" id="monthbox">04</div>
        <div style="font-size: 25px;" id="monthboxEK">January</div>
    </div>
    
    <div id="time" class="arc e1">
        <div style="font-size: 23px; margin-left: 3px; margin-top: 15px;" id="nowtime">23:41</div>
        <div style="font-size: 17px; margin-top: 0px;" id="nowday">Tuesday</div>
    </div>
  </div>
  
  <p class="title">Performance</p>
  <div class="hline title_underline"></div>
  
  <span class="menuitem entypo-gauge">
    <p id="cpu" class="caption" >Speed: --km/h</p>
  </span> <br/>
  
  <span class="menuitem entypo-chart-area">
    <p id="ram" class="caption" >MQTT: Wifi</p>
  </span> <br/>
  
  <span class="menuitem entypo-chart-pie">
    <p id="proc" class="caption">Battery: --%</p>
  </span>
  
  <p class="title">Management</p>
  <div class="hline title_underline"></div> 
  
  <div class="menu">
    <button class="menuitem Main"> <span class="entypo-right-open"></span> <p class="caption">Main</p> </button>
    <button class="menuitem CCTV"> <span class="entypo-right-open"></span> <p class="caption">CCTV</p> </button>
    <button class="menuitem Computer"> <span class="entypo-right-open"></span> <p class="caption">Computer</p> </button>
    <button class="menuitem Control"> <span class="entypo-right-open"></span> <p class="caption">Control Panel</p> </button>
    
    <hr style="border-color: transparent; margin: 0;"/>
    <div class="hline" style="margin-top: 5px; margin-bottom: 5px;"></div>
    
    <button class="menuitem Jetson1"> <span class="entypo-right-open"></span> <p class="caption">Jetson Car 1</p> </button>
    <button class="menuitem Jetson2"> <span class="entypo-right-open"></span> <p class="caption">Jetson Car 2</p> </button>
    <button class="menuitem Jetson3"> <span class="entypo-right-open"></span> <p class="caption">Jetson Car 3</p> </button>
  </div>
  
  <p class="title">Control</p>
  <div class="hline title_underline"></div>
  <div class="controlbox1">
	  <div class="app_icon entypo-shuffle"></div>
      <div class="controlbox1-1">Manual Mode</div>
  </div>
  <div class="controlbox2">
	  <div class="app_icon entypo-lock"></div> 
      <div class="controlbox2-1">Lock on</div>	  
  </div>	  
  <div class="controlbox3">
	  <div class="app_icon entypo-logout"></div>
      <div class="controlbox3-1">Logout</div>	  
  </div>	  
</div>


<!-- Right Menu -->
<article>
<div id="rightmenu">
    <p id="headline" class="title" style="text-align: left; margin-left: 10px;">Detection Object List</p>
    <div id="particle10" class="hline"></div>
    <div id="particle11" class="hline"></div>
    <div id="particle12" class="vline"></div>
  
	<div id="text">
		<div id="checkelement">
			<img id="textboximg" src="${pageContext.request.contextPath}/resource/image/도로사진/admin2.png">
			<div id="textboxline">List Name : --</div>
		</div>
	</div>
</div>
</article>

<!-- Particles -->
<!-- Left Menu Particles -->
<canvas id="particle1" width="20" height="500"></canvas> 


<div id="particle2">▶<br/>▶<br/>▶</div>
<div id="particle3" class="vline"></div>
<div id="particle4" class="vline"></div>
<div id="particle5" class="vline"></div>
<div id="particle6" class="vline"></div>
<div id="particle7" class="vline"></div>
<div id="particle8" class="vline"></div>
<div id="particle9" class="vline"></div>

<!-- Map canvas box -->
<div class="mapcanvasbox">
	<canvas class="map"></canvas>
    <canvas class="car" style="border: 1px solid black;"></canvas>
</div>

<!-- MINI Map canvas box -->
<canvas class="hud"></canvas>
<canvas class="hud"></canvas>

<!-- Radar box -->
<div class="Radarbox">
	<div class="radar">
	  <div class="pointer"></div>
	  <div class="shadow"></div>
	</div>
</div>

<canvas id="arrowcanvas" width="1200" height="400"></canvas>

<div class="backgroundbox"></div>
<div class="backgroundbox2"></div>

<!-- Main 모달창 -->
<div id="box_modal1">
	<div id="modaltext1">
		----Four team----<br/>
		Producer Jeon Young-Jae<br/>
		[Someone who helped] <br/>
		Canvas : Park Sung-Jin,<br/> 
		Canvas : Jin Sang-Woo,<br/>  
		Canvas : Choi Young-su,<br/>               
		Pyhton : Han Sang-Min
	</div>
</div>
<!-- CCTV 모달창 -->
<div id="box_modal2">
	<div id="modaltext2">
		<div class="Camimg1"></div>
		<div class="Camimg2"></div>
		<div class="Camimg3"></div>		
		<div class="Camimg4"></div>		
	</div>
</div>
<!-- Computer 모달창 -->
<div id="box_modal3">
	<div id="modaltext3">Computer
	
	</div>
</div>
<!-- Control 모달창 -->
<div id="box_modal4">
	<div id="modaltext4">Control
	
	</div>
</div>

<!-- ------------------------------------------------------------------------------------------------------------- -->
<!-- Jarvis Canvas Script -->
<script>
$(".Jetson1").click(function(){
	location.href="${pageContext.request.contextPath}/Objectdiscrimination/fixlayout.do";
});
$(".Jetson3").click(function(){
	location.href="${pageContext.request.contextPath}/Objectdiscrimination/jetson3.do";
});

$("#box_modal1").hide();
$("#box_modal2").hide();
$("#box_modal3").hide();
$("#box_modal4").hide();

$(".Main").click(function(){
	$("#box_modal1").slideToggle(800);
	$("#box_modal2").hide();
	$("#box_modal3").hide();
	$("#box_modal4").hide();
})
$(".CCTV").click(function(){
	$("#box_modal2").slideToggle(800);
	$("#box_modal1").hide();
	$("#box_modal3").hide();
	$("#box_modal4").hide();
})
$(".Computer").click(function(){
	$("#box_modal3").slideToggle(800);
	$("#box_modal1").hide();
	$("#box_modal2").hide();
	$("#box_modal4").hide();
})
$(".Control").click(function(){
	$("#box_modal4").slideToggle(800);
	$("#box_modal1").hide();
	$("#box_modal2").hide();
	$("#box_modal3").hide();
})
/* 모달창 esc로 제거 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 27) {
		$("#box_modal1").slideUp(800);
		$("#box_modal2").slideUp(800);
		$("#box_modal3").slideUp(800);
		$("#box_modal4").slideUp(800);
	}
}, true);


var canvas = document.getElementById('particle1');
var context = canvas.getContext('2d');

context.beginPath();
context.moveTo(0, 0);
context.lineTo(0, 70);
context.lineTo(10, 85);
context.lineTo(10, 135);
context.lineTo(0, 150);
context.lineTo(0, 480);
context.lineTo(5, 490);
context.lineTo(10, 490);
context.lineTo(20, 490);
context.lineTo(20, 250);
context.lineTo(10, 235);
context.lineTo(10, 185);
context.lineTo(20, 170);
context.lineTo(20, 40);
context.lineTo(10, 30);
context.lineTo(10, 20);

context.closePath();
context.lineWidth = 1;
context.fillStyle = '#FF3535';
context.fill();
context.strokeStyle = 'transparent';
context.stroke();
</script>

<canvas id="particle1_1" width="40" height="510"></canvas> 
<script>
var canvas = document.getElementById('particle1_1');
var context = canvas.getContext('2d');

context.beginPath();
context.lineTo(0, 0);
context.lineTo(10, 15);
context.lineTo(10, 65);
context.lineTo(0, 80);
context.lineTo(0, 0);

context.closePath();
context.lineWidth = 1;
context.fillStyle = '#FF3535';
context.fill();
context.strokeStyle = 'transparent';
context.stroke();
</script>

<canvas id="particle1_2" width="40" height="510"></canvas> 
<script>
var canvas = document.getElementById('particle1_2');
var context = canvas.getContext('2d');

context.beginPath();
context.lineTo(10, 80);
context.lineTo(0, 65);
context.lineTo(0, 15);
context.lineTo(10, 0);
context.lineTo(10, 80);

context.closePath();
context.lineWidth = 1;
context.fillStyle = '#FF3535';
context.fill();
context.strokeStyle = 'transparent';
context.stroke();

// MQTT 통신 Script ----------------------------------------------------------------------------
var   centerx = 0;
var   centery = 0;
var   x1 = 0;
var   y1 = 0;
var   x2 = 0;
var   y2 = 0;
var   totalnum = 0;

//--------------------------------------------------------------------------------------------
//MQTT new client
$(function(){
   client = new Paho.MQTT.Client("192.168.3.210", 61614, new Date().getTime().toString());
   client.onMessageArrived = onMessageArrived;
   client.connect({onSuccess:onConnect});
});

//MQTT onConnect
function onConnect() {
   client.subscribe("/Camera");
   client.subscribe("/Message");
   client.subscribe("/CurrentP");
   client.subscribe("/curr_dir");
   client.subscribe("/speed");
}

//MQTT onMessageArrived
function onMessageArrived(message) {
	  if (message.destinationName == "/speed") {		 
		  var speed = JSON.parse(message.payloadString);
		  
          realspeed = speed * 100 * -1;
          realspeed = realspeed.toFixed(0); //소수점 제거
          
          $("#cpu").text("Speed: " + String(realspeed) + "km/h");       
      }
	
	  if (message.destinationName == "/curr_dir") {
	         var dir = JSON.parse(message.payloadString);
// 	         console.log(dir);
	         var arrowNum = JSON.parse(message.payloadString);
	         var pointx = arrowNum.center_x;
	         var pointy = arrowNum.center_y;
	         var pointX = arrowNum.val_centerX;
	         var pointY = arrowNum.val_centerY;

	         //초록 좌표
			 pointx1 = parseInt(Number(pointx) * 3.75);
			 pointy1 = parseInt(Number(pointy) * 3.75);
			 //파란 좌표
		 	 pointX1 = parseInt(Number(pointX) * 3.75);
		 	 pointY1 = parseInt(Number(pointY) * 3.75); 	 	 
		 	 
		 	var arrowline = document.querySelector('#arrowcanvas');

		 	function arrowmap () {
		 		var arrowctx = arrowline.getContext('2d');
		 		arrowctx.clearRect(0, 0, arrowline.width, arrowline.height);
		 		
		 		arrowctx.beginPath();
		 		arrowctx.moveTo(600, 400);
		 		arrowctx.quadraticCurveTo(600, 200, pointX1, 120);
		 		
		 		arrowctx.strokeStyle = "#FF3535";    // 선색 변경
		 		arrowctx.lineWidth = 10;             // 선 두깨 설정
		 		arrowctx.shadowOffsetX = 0;
		 		arrowctx.shadowOffsetY = 0;
		 		arrowctx.shadowBlur = 20;
		 		arrowctx.shadowColor = "#FF3535";
		 		
		 		arrowctx.stroke();
		 	}
		 	setInterval(arrowmap, 20) 	 
	  }
	
      if(message.destinationName =="/Camera") {
         image.src="data:image/jpg;base64,"+ message.payloadString;          
      }
	  
      if (message.destinationName == "/CurrentP") {
          var batterylog = JSON.parse(message.payloadString);     
          $("#proc").text("Battery: " + String(message.payloadString) + "%");          
       }
      
      if (message.destinationName == "/Message") {        
//     	console.log("Message type : "+ JSON.parse(message.payloadString)); 
    	console.log("Message length : "+ Object.keys(JSON.parse(message.payloadString)).length); 
    	
        var messageKey = Object.keys(JSON.parse(message.payloadString)).length;

        if (messageKey == 0){
        	$("#total").children().remove(".hoverbox");
        }
    	
        var hoverone = document.getElementById("hoverbox");   
        var textboxlineone = document.getElementById("textboxline");

        if(Object.keys(JSON.parse(message.payloadString)).length == 0){
			console.log("----");	
			$("#textboxline").css("color","#FE2E2E");
			document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/admin2.png";
			$("#textboximg").css("box-shadow","0 0 0px #FF3535, 0 0 0px #FF3535");
			$("#textboximg").css("border","3px solid #FE2E2E");
			$("#textboxline").text("List Name : --");	
		}
        
		for (var i = 0; i < messageKey; i++) {	
			if (totalnum > messageKey) {
				for (var j = messageKey; j < totalnum; j++) {
					$("#hoverbox" + j).remove();
				}
			}		
			
			totalnum = messageKey
			var chk = document.getElementById("hoverbox" + i);
			var textboxlinechk = document.getElementById("textboxline");
			
			if (chk == null) {
				var hoverchild = hoverone.cloneNode(true);
				hoverchild.setAttribute("id", "hoverbox" + i);
				$("#total").append(hoverchild);
			}
			
			var Num = JSON.parse(message.payloadString)[i];
			var x1 = Num.x1;
			var y1 = Num.y1;
			var x2 = Num.x2;
			var y2 = Num.y2;
			var name = Num.name;											
			
			if(name.length != 0){								
				$("#textboxline").remove();
				var textboxlinechild = textboxlineone.cloneNode(true);
				textboxlinechild.setAttribute("id", "textboxline");
				$("#checkelement").append(textboxlinechild);	
				
				if(changenum != name){
					if(name.length == 1){
						console.log("지점 감지");
						$("#textboxline").text("Current Location : " + "[" + name + "]");	
						$("#textboxline").css("color","#FE2E2E");
						$("#textboximg").css("box-shadow","0 0 10px #FF3535, 0 0 10px #FF3535");
						$("#textboximg").css("border","3px solid #FF3535");
						if(name == "A"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/a.jpg";
						}else if(name == "B"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/b.jpg";
						}else if(name == "C"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/c.jpg";
						}else if(name == "D"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/d.jpg";
						}else if(name == "E"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/e.jpg";
						}else if(name == "F"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/f.jpg";
						}else if(name == "H"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/h.jpg";
						}else if(name == "I"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/i.jpg";
						}else if(name == "J"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/j.jpg";
						}else if(name == "K"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/k.jpg";
						}else if(name == "M"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/m.jpg";
						}else if(name == "N"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/n.jpg";
						}else if(name == "P"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/p.jpg";
						}else if(name == "S"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/s.jpg";
						}else if(name == "T"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/imgage/도로사진/t.jpg";
						}
					}else if(name.length > 1){				
						console.log("객체 감지");
						$("#textboxline").text("Object Detection : " + "[" + name + "]");
						$("#textboxline").css("color","#FE2E2E");
						$("#textboximg").css("box-shadow","0 0 10px #FF3535, 0 0 10px #FF3535");
						$("#textboximg").css("border","3px solid #FF3535");
						if(name == "unlabeled"){
							document.getElementById("textboximg").src="";
						}else if(name == "red"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/traficlight.jpg";
						}else if(name == "green"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/traficlight.jpg";
						}else if(name == "yellow"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/traficlight.jpg";
						}else if(name == "crosswalk"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/crosswalk.jpg";
						}else if(name == "schoolzone"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/schoolzone.jpg";
						}else if(name == "stop"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/stop.jpg";
						}else if(name == "60"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/60.jpg";
						}else if(name == "100"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/100.jpg";
						}else if(name == "speed"){
							document.getElementById("textboximg").src="";
						}else if(name == "car"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/jetson.png";
						}else if(name == "cone"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/cone.jpg";
						}else if(name == "bump"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/bump.jpg";
						}else if(name == "curve"){
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/curve.jpg";
						}
					}				
				}
			var changenum = name;							
			}
			
			x1 = parseInt(Number(x1) * 3.75 + 320);
			y1 = parseInt(Number(y1) * 3.75 + 0);
			x2 = parseInt(Number(x2) * 3.75 + 320);
			y2 = parseInt(Number(y2) * 3.75 + 0);

			centerx = parseInt((x2 - x1) / 2 + x1);
			centery = parseInt((y2 - y1) / 2 + y1);

			$("#hoverbox" + i).css("margin-top", centery + "px");
			$("#hoverbox" + i).css("margin-left", centerx + "px");

			image.onload(centerx, centery, messageKey);
				
				
            var location = name;
            var x;
            var y;
            if(location == "A") {
               x = carLocation.A[0];
               y = carLocation.A[1];
            }else if(location == "B") {
               x = carLocation.B[0];
               y = carLocation.B[1];
            }else if(location == "C") {
               x = carLocation.C[0];
               y = carLocation.C[1];
            }else if(location == "D") {
               x = carLocation.D[0];
               y = carLocation.D[1];
            }else if(location == "E") {
               x = carLocation.E[0];
               y = carLocation.E[1];
            }else if(location == "F") {
               x = carLocation.F[0];
               y = carLocation.F[1];
            }else if(location == "H") {
               x = carLocation.H[0];
               y = carLocation.H[1];
            }else if(location == "I") {
               x = carLocation.I[0];
               y = carLocation.I[1];
            }else if(location == "J") {
               x = carLocation.J[0];
               y = carLocation.J[1];
            }else if(location == "K") {
               x = carLocation.K[0];
               y = carLocation.K[1];
            }else if(location == "M") {
               x = carLocation.M[0];
               y = carLocation.M[1];
            }else if(location == "N") {
               x = carLocation.N[0];
               y = carLocation.N[1];
            }else if(location == "P") {
               x = carLocation.P[0];
               y = carLocation.P[1];
            }else if(location == "S") {
               x = carLocation.S[0];
               y = carLocation.S[1];
            }else if(location == "T") {
               x = carLocation.T[0];
               y = carLocation.T[1];
            }
            mapArea.setCarLocation(x, y);
            mapArea.drawCar();
            
            imgMap.src = canvasMap.toDataURL();
            imgCar.src = canvasCar.toDataURL();
            
           carLocX = mapArea.getCarLocX();
           carLocY = mapArea.getCarLocY();
			//map 추가2 end
		}// for문

	}//message publish end		
}

var canvas1stfloor;
var ctx;	

$(function() {
	canvas1stfloor = document.createElement("canvas")
	canvas1stfloor.width = "1200";
	canvas1stfloor.height = "900";
	ctx1stfloor = canvas1stfloor.getContext("2d");
	document.body.appendChild(canvas1stfloor);
});	

var image = new Image();

image.onload = function(centerx, centery, messageKey) {	
	ctx1stfloor.drawImage(image, 0, 0, 1200, 900);			
};
image.src = "";
// -------------------------------------------------------------------------------------------------------------
/* Note Matrics Script */	
function WordShuffler(holder,opt){
  var that = this;
  var time = 0;
  
  this.now;
  this.then = Date.now();
  this.delta;
  this.currentTimeOffset = 0;
  this.word = null;
  this.currentWord = null;
  this.currentCharacter = 0;
  this.currentWordLength = 0;
  
  var options = {
    fps : 20,
    timeOffset : 5,
    textColor : '#FF3535',
    fontSize : "50px",
    useCanvas : false,
    mixCapital : false,
    mixSpecialCharacters : false,
    needUpdate : true,
    colors : [
      '#FF3535'
    ]
  }

  if(typeof opt != "undefined"){
    for(key in opt){
      options[key] = opt[key];
    }
  }

  this.needUpdate = true;
  this.fps = options.fps;
  this.interval = 1000/this.fps;
  this.timeOffset = options.timeOffset;
  this.textColor = options.textColor;
  this.fontSize = options.fontSize;
  this.mixCapital = options.mixCapital;
  this.mixSpecialCharacters = options.mixSpecialCharacters;
  this.colors = options.colors;

   this.useCanvas = options.useCanvas;
  
  this.chars = [
    'A','B','C','D',
    'E','F','G','H',
    'I','J','K','L',
    'M','N','O','P',
    'Q','R','S','T',
    'U','V','W','X',
    'Y','Z'
  ];
  this.specialCharacters = [
    '!','§','$','%',
    '&','/','(',')',
    '=','?','_','<',
    '>','^','°','*',
    '#','-',':',';',
    'a','b','c','d',
    'e','f','g','h',
    'I','j','K','l',
    'm','n','o','p',
    'q','r','s','t',
    'u','v','w','x',
    'y','z'
  ]

  if(this.mixSpecialCharacters){
    this.chars = this.chars.concat(this.specialCharacters);
  }

  this.getRandomColor = function () {
    var randNum = Math.floor( Math.random() * this.colors.length );
    return this.colors[randNum];
  }

  //if Canvas
 
  this.position = {
    x : 0,
    y : 50
  }

  //if DOM
  if(typeof holder != "undefined"){
    this.holder = holder;
  }

  if(!this.useCanvas && typeof this.holder == "undefined"){
    console.warn('Holder must be defined in DOM Mode. Use Canvas or define Holder');
  }


  this.getRandCharacter = function(characterToReplace){    
    if(characterToReplace == " "){
      return ' ';
    }
    var randNum = Math.floor(Math.random() * this.chars.length);
    var lowChoice =  -.5 + Math.random();
    var picketCharacter = this.chars[randNum];
    var choosen = picketCharacter.toLowerCase();
    if(this.mixCapital){
      choosen = lowChoice < 0 ? picketCharacter.toLowerCase() : picketCharacter;
    }
    return choosen;
    
  }

  this.writeWord = function(word){
    this.word = word;
    this.currentWord = word.split('');
    this.currentWordLength = this.currentWord.length;

  }

  this.generateSingleCharacter = function (color,character) {
    var span = document.createElement('span');
    span.style.color = color;
    span.innerHTML = character;
    return span;
  }

  this.updateCharacter = function (time) {
    
      this.now = Date.now();
      this.delta = this.now - this.then;

       

      if (this.delta > this.interval) {
        this.currentTimeOffset++;
      
        var word = [];

        if(this.currentTimeOffset === this.timeOffset && this.currentCharacter !== this.currentWordLength){
          this.currentCharacter++;
          this.currentTimeOffset = 0;
        }
        for(var k=0;k<this.currentCharacter;k++){
          word.push(this.currentWord[k]);
        }

        for(var i=0;i<this.currentWordLength - this.currentCharacter;i++){
          word.push(this.getRandCharacter(this.currentWord[this.currentCharacter+i]));
        }


        if(that.useCanvas){
          c.clearRect(0,0,stage.x * stage.dpr , stage.y * stage.dpr);
          c.font = that.fontSize + " sans-serif";
          var spacing = 0;
          word.forEach(function (w,index) {
            if(index > that.currentCharacter){
              c.fillStyle = that.getRandomColor();
            }else{
              c.fillStyle = that.textColor;
            }
            c.fillText(w, that.position.x + spacing, that.position.y);
            spacing += c.measureText(w).width;
          });
        }else{

          if(that.currentCharacter === that.currentWordLength){
            that.needUpdate = false;
          }
          this.holder.innerHTML = '';
          word.forEach(function (w,index) {
            var color = null
            if(index > that.currentCharacter){
              color = that.getRandomColor();
            }else{
              color = that.textColor;
            }
            that.holder.appendChild(that.generateSingleCharacter(color, w));
          }); 
        }
        this.then = this.now - (this.delta % this.interval);
      }
  }

  this.restart = function () {
    this.currentCharacter = 0;
    this.needUpdate = true;
  }

  function update(time) {
    time++;
    if(that.needUpdate){
      that.updateCharacter(time);
    }
    requestAnimationFrame(update);
  }

  this.writeWord(this.holder.innerHTML);
  update(time);
}

var headline = document.getElementById('headline');

var headText = new WordShuffler(headline,{
  textColor : '#FF3535',
  timeOffset : 5,
  mixCapital : true,
  mixSpecialCharacters : true
});
// -------------------------------------------------------------------------------------------------------------
/* 오늘 날짜 및 변환  */
var nowDate = new Date();
var nowYear = nowDate.getFullYear();
var nowMonth = nowDate.getMonth() +1;
var nowDay = nowDate.getDate();
var week = new Array('일','월','화','수','목','금','토');
var totaynow = week[nowDate.getDay()]
var hournow = nowDate.getHours();
var minutenow = nowDate.getMinutes();
if(nowMonth < 10) { nowMonth = "0" + nowMonth; }
if(nowDay < 10) { nowDay = "0" + nowDay; }

//현재 달(숫자)
$('#monthbox').text(String(nowMonth));	

//현재 달(영문)
if(String(nowMonth) == "01"){
	$('#monthboxEK').text("January");
}else  if(String(nowMonth) == "02"){
	$('#monthboxEK').text("February");
}else  if(String(nowMonth) == "03"){
	$('#monthboxEK').text("March");
}else  if(String(nowMonth) == "04"){
	$('#monthboxEK').text("April");
}else  if(String(nowMonth) == "05"){
	$('#monthboxEK').text("May");
}else  if(String(nowMonth) == "06"){
	$('#monthboxEK').text("June");
}else  if(String(nowMonth) == "07"){
	$('#monthboxEK').text("July");
}else  if(String(nowMonth) == "08"){
	$('#monthboxEK').text("August");
}else  if(String(nowMonth) == "09"){
	$('#monthboxEK').text("September");
}else  if(String(nowMonth) == "10"){
	$('#monthboxEK').text("October");
}else  if(String(nowMonth) == "11"){
	$('#monthboxEK').text("November");
}else  if(String(nowMonth) == "12"){
	$('#monthboxEK').text("December");
}; 
	
//현재 시각(숫자)	
$('#nowtime').text(String(hournow + ":" + minutenow));

//현재 날짜(숫자)		
if(String(nowDay) == "01"){
	$('#nowday').text("January");
}else  if(String(totaynow) == "일"){
	$('#nowday').text("Sunsay");
}else  if(String(totaynow) == "월"){
	$('#nowday').text("Monday");
}else  if(String(totaynow) == "화"){
	$('#nowday').text("Tuesday");
}else  if(String(totaynow) == "수"){
	$('#nowday').text("Wednesday");
}else  if(String(totaynow) == "목"){
	$('#nowday').text("Thursday");
}else  if(String(totaynow) == "금"){
	$('#nowday').text("Friday");
}else  if(String(totaynow) == "토"){
	$('#nowday').text("Saturday");
};

/* 오토모드 수동모드 선택 */
$(".controllerbox").hide();

var automanual = 0;
$(".controlbox1").click(function(){
	automanual += 1;
	if(automanual %2 == 0){
// 		alert("오토 모드로 변경");
		$('.controlbox1-1').text("Manual Mode");
		$(".controllerbox").hide();	//현재 오토 모드이기 때문에 hide
		var message = new Paho.MQTT.Message("Auto");
		message.destinationName = "/ControlMoving/AutoChg";
		message.qos = 0;
		$('#arrowcanvas').css("opacity","1");
		client.send(message);	
	}
	if(automanual %2 == 1){
// 		alert("수동 모드로 변경");
		$('.controlbox1-1').text("Auto Mode");
		$(".controllerbox").show(); //현재 수동 모드이기 때문에 show
		var message = new Paho.MQTT.Message("Manual");
		message.destinationName = "/ControlMoving/ManualChg";
		message.qos = 0;
		$('#arrowcanvas').css("opacity","0.4");		
		client.send(message);	
	}
});
//-------------------------------------------------------------------------------------------------------------
//map 추가3 start
var imgMap = new Image();
var imgCar = new Image();
    
var carLocX;
var carLocY;      

/* 지도와 자동차 위치 그리기 */
var canvasMap = document.querySelector(".map");
var canvasCar = document.querySelector(".car");
   
canvasMap.width = 330;
canvasMap.height = 330;
canvasMap.style.position = "absolute";
canvasCar.width = 330;
canvasCar.height = 330;
canvasCar.style.position = "absolute";  
   
var carLocation = {
         A: [270, 20],
         B: [205, 20],
         C: [140, 20],
         D: [75, 20],
         E: [50, 50],
         F: [50, 90],
         H: [35, 170],
         I: [30, 250],
         J: [60, 280],
         K: [105, 305],
         M: [180, 310],
         N: [270, 310],
         P: [310, 250],
         S: [310, 160],
         T: [310, 70]
      };

var ctxMap = canvasMap.getContext("2d");
var ctxCar = canvasCar.getContext("2d");

var mapArea = new mapArea(ctxMap, ctxCar, 0, 0);
mapArea.readyDrawCar("#FF3535", 7);

mapArea.drawTrack(); 

function mapArea(ctxMap, ctxCar, x, y) {
   this.ctxMap = ctxMap;   // 맵 그리기용 ctx
   this.ctxCar = ctxCar;   // 자동차 위치 그리기용 ctx
     this.x = x;
     this.y = y;
     
     this.mapWidth = 330;
     this.mapHeight = 330;   
     
     this.carLocX;   // 자동차위치 x좌표
     this.carLocY;   // 자동차위치 y좌표
     this.carColor;
     this.carRadius;
     
     // 맵을 그리는 메소드
     this.drawTrack = function() {
        var lineWidthList = ["30", "27", "3"];
        var strokeStyleList = ["#FF3535", "black", "#FF3535"];

        for(i=0; i<=2; i++) {
            this.ctxMap.beginPath();
            this.ctxMap.lineWidth = lineWidthList[i];
            this.ctxMap.strokeStyle = strokeStyleList[i];
            if(i==2) {
              this.ctxMap.setLineDash([20, 10]);
            }//x y
            this.ctxMap.moveTo(70, 20);	//상부 직선 도로1
            this.ctxMap.lineTo(280, 20);  //상부 직선도로2
            this.ctxMap.arcTo(310, 20, 310, 90, 20); //상부 우측 곡선 도로
           
            this.ctxMap.lineTo(310, 250); //우측 직선 도로1
            this.ctxMap.arcTo(310, 310, 250, 310, 20); //우측 하단 곡선 도로

            this.ctxMap.lineTo(120, 310);//하부 직선도로 1
            this.ctxMap.bezierCurveTo(90, 310, 110, 280, 80, 280);//S자
            this.ctxMap.arcTo(30, 280, 30, 250, 30);

            this.ctxMap.lineTo(30, 190);//좌측 직선1
            this.ctxMap.lineTo(50, 100);//좌측 직선2
            this.ctxMap.lineTo(50, 50);//좌측 직선3
            this.ctxMap.arcTo(50, 20, 100, 20, 20);//상부 좌측 곡선
             
            this.ctxMap.stroke();
        }
        this.ctxMap.setLineDash([]);
     }
        
    // 자동차 색깔과 크기 설정
    this.readyDrawCar = function(color, radius) {
       this.carColor = color;
       this.carRadius = radius;
    }

    // 자동차 위치 얻기
    this.setCarLocation = function(carLocX, carLocY) {
       this.carLocX = carLocX;
       this.carLocY = carLocY;
    }
   
    // 자동차 그리기
    this.drawCar = function() {
       this.ctxCar.clearRect(this.x, this.y, this.mapWidth, this.mapHeight);
       this.ctxCar.beginPath();
       this.ctxCar.fillStyle = this.carColor;
       this.ctxCar.arc(this.carLocX, this.carLocY, this.carRadius, 0, 2*Math.PI);
       this.ctxCar.fill();
       this.ctxCar.stroke();
    }
   
    this.getCarLocX = function() {
       return this.carLocX;
    }
   
    this.getCarLocY = function() {
       return this.carLocY;
    }        

}
   
var hud = document.querySelectorAll(".hud");

for(i=0; i<hud.length; i++) {
    hud[i].width = 104;
    hud[i].height = 104;
    hud[i].style.position = "absolute";
    hud[i].style.zIndex  = i+6000;
}

var canvas1 = hud[0];
var canvas2 = hud[1];

// HUD에 맵의 일부분을 그리기
function minimap () {
 ctx1map = canvas1.getContext("2d");
  ctx2map = canvas2.getContext("2d");
 
  ctx1map.clearRect(0, 0, canvas1.width, canvas1.height);
    ctx2map.clearRect(0, 0, canvas2.width, canvas2.height);
    
    ctx1map.drawImage(imgMap, carLocX-50, carLocY-50, 100, 100, 2, 2, 100, 100);
    ctx2map.drawImage(imgCar, carLocX-50, carLocY-50, 100, 100, 2, 2, 100, 100);
}

setInterval(minimap, 20)
//map 추가3 end
//-----------------------------------------------------------------------------------
function clickevent(){ 
	location.reload();
}

setInterval(clickevent, 5000);
</script>
<!-- MQTT Jetson 조작 시 필요 js 소환 -->
<script src="${pageContext.request.contextPath}/resource/script/restaurant_car_control.js"></script>
</body>
</html>