/* 모터 start */
function MotorAccel() {
	var message = new Paho.MQTT.Message("forward");
	message.destinationName = "/ControlMoving/Speed";
	message.qos = 0;

	client.send(message);
	
}

function MotorBrake() {
	var message = new Paho.MQTT.Message("backward");
	message.destinationName = "/ControlMoving/Speed";
	message.qos = 0;

	client.send(message);
	
}

function MoveLeft() {
	var message = new Paho.MQTT.Message("left");
	message.destinationName = "/ControlMoving/Direction";
	message.qos = 0;

	client.send(message);
	
}

function MoveRight() {
	var message = new Paho.MQTT.Message("right");
	message.destinationName = "/ControlMoving/Direction";
	message.qos = 0;

	client.send(message);
	
}

function MotorStop() {
	var message = new Paho.MQTT.Message("stop");
	message.destinationName = "/ControlMoving/Speed";
	message.qos = 0;

	client.send(message);
	
}



/* 키 안에 담는 객체 = 꼭필요 중요★★★★★ --------------------------------------------------------------------- */
var keyValue = {};
   
/* 키를 땟을 때 ----------------------------------------------------------------------- */ 
function stopInterval(action){
	/* 전진 키 땠을때 */
	if(keyValue[87]=='up'){ 
		console.log("앞으로 끝")
		$("#up").css("background-color", "#bd2130");
		$("#up").css("border-color", "#FF0000");
		keyValue[87]=''
	}
	/* 후진 키 땠을때 */
	if(keyValue[83]=='up'){
	   console.log("뒤로 끝")
	   $("#down").css("background-color","#bd2130");
	   $("#down").css("border-color", "#FF0000");
	   keyValue[83]=''
	}
	/* 우회전 키 땠을때 */
	if(keyValue[68]=='up'){
	   console.log("우회전 끝")
	   $("#right").css("background-color", "#bd2130");
	   $("#right").css("border-color", "#FF0000");
	   keyValue[68]=''
	}
	/* 좌회전 키 땠을때 */
	if(keyValue[65]=='up'){
	   console.log("좌회전 끝")
	   $("#left").css("background-color", "#bd2130");
	   $("#left").css("border-color", "#FF0000");
	   keyValue[65]=''
	}
	/* 정지 키 땠을때 */
	if(keyValue[32]=='up'){
	   console.log("정지 스탑")
	   $("#stop").css("background-color", "#bd2130");
	   $("#stop").css("border-color", "#FF0000");
		}
  
	}
	/* 키를 눌렀을 때 ------------------------------------------------- */
	setInterval(function(action){
	/* 전진 키 눌렀을때 */
	if(keyValue[87]=='down'){
	   console.log("앞으로")
	   $("#up").css("background-color", "#2E64FE");
	   $("#up").css("border-color", "#0040FF");
	   MotorAccel();
	}
	/* 후진 키 눌렀을때 */
	if(keyValue[83]=='down'){
	   console.log("뒤로")
	   $("#down").css("background-color", "#2E64FE");
	   $("#down").css("border-color", "#0040FF");
	   MotorBrake();
	}
	/* 우회전 키 눌렀을때 */
	if(keyValue[68]=='down'){
		console.log("우회전")
		$("#right").css("background-color", "#2E64FE");
		$("#right").css("border-color", "#0040FF");
		MoveRight()
	}   
	/* 좌회전 키 눌렀을때 */
	if(keyValue[65]=='down'){
		console.log("좌회전")
		$("#left").css("background-color", "#2E64FE");
		$("#left").css("border-color", "#0040FF");
		MoveLeft()
	}
	/* 정지 키 눌렀을때 */
	if(keyValue[32]=='down'){
		console.log("정지")
		$("#stop").css("background-color", "#2E64FE");
		$("#stop").css("border-color", "#0040FF");
		MotorStop();
	}
}, 30);
/* 키 눌렀을 때 이벤트를 실행하겠다 */
document.addEventListener('keydown', function(event) {
   //event.preventDefault();
   keyValue[event.keyCode] = 'down';
}, true);
/* 키 땠을 때 이벤트를 실행하겠다 */
document.addEventListener('keyup', function(event) {   
//event.preventDefault();
   keyValue[event.keyCode] = 'up';
   stopInterval()
}, true);