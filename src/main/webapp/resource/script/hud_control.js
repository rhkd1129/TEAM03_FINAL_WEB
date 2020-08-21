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
function AutoChange() {
   var message = new Paho.MQTT.Message("Auto");
   message.destinationName = "/ControlMoving/AutoChg";
   message.qos = 0;

   client.send(message);
   
}
function ManualChange() {
   var message = new Paho.MQTT.Message("Manual");
   message.destinationName = "/ControlMoving/ManualChg";
   message.qos = 0;

   client.send(message);
   
}

function LineChange() {
   var message = new Paho.MQTT.Message("Linechange");
   message.destinationName = "/ControlMoving/LineChg";
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
      $("#gostraight").css("background-color", "#81DAF5");
      $("#gostraight").css("border-color", "#00BFFF");
      keyValue[87]=''
   }
   /* 후진 키 땠을때 */
   if(keyValue[83]=='up'){
      console.log("뒤로 끝")
      $("#goback").css("background-color","#81DAF5");
      $("#goback").css("border-color", "#00BFFF");
      keyValue[83]=''
   }
   /* 우회전 키 땠을때 */
   if(keyValue[68]=='up'){
      console.log("우회전 끝")
      $("#goright").css("background-color", "#81DAF5");
      $("#goright").css("border-color", "#00BFFF");
      keyValue[68]=''
   }
   /* 좌회전 키 땠을때 */
   if(keyValue[65]=='up'){
      console.log("좌회전 끝")
      $("#goleft").css("background-color", "#81DAF5");
      $("#goleft").css("border-color", "#00BFFF");
      keyValue[65]=''
   }
   /* 정지 키 땠을때 */
   if(keyValue[32]=='up'){
      console.log("정지 스탑")
      $("#gostop").css("background-color", "#81DAF5");
      $("#gostop").css("border-color", "#00BFFF");
      keyValue[32]=''
      }
   if(keyValue[79]=='up'){ 
      console.log("오토 종료")
      keyValue[79]=''
   }
   if(keyValue[80]=='up'){ 
      console.log("매뉴얼 종료")
      keyValue[80]=''
   }
   
   if(keyValue[72]=='up'){ 
      console.log("방향전환 종료")
      keyValue[72]=''
   }
  
  
   }
   /* 키를 눌렀을 때 ------------------------------------------------- */
   setInterval(function(action){
   /* 전진 키 눌렀을때 */
   if(keyValue[87]=='down'){
      console.log("앞으로")
      $("#gostraight").css("background-color", "#2E64FE");
      $("#gostraight").css("border-color", "#0040FF");
      MotorAccel();
   }
   /* 후진 키 눌렀을때 */
   if(keyValue[83]=='down'){
      console.log("뒤로")
      $("#goback").css("background-color", "#2E64FE");
      $("#goback").css("border-color", "#0040FF");
      MotorBrake();
   }
   /* 우회전 키 눌렀을때 */
   if(keyValue[68]=='down'){
      console.log("우회전")
      $("#goright").css("background-color", "#2E64FE");
      $("#goright").css("border-color", "#0040FF");
      MoveRight()
   }   
   /* 좌회전 키 눌렀을때 */
   if(keyValue[65]=='down'){
      console.log("좌회전")
      $("#goleft").css("background-color", "#2E64FE");
      $("#goleft").css("border-color", "#0040FF");
      MoveLeft()
   }
   /* 정지 키 눌렀을때 */
   if(keyValue[32]=='down'){
      console.log("정지")
      $("#gostop").css("background-color", "#2E64FE");
      $("#gostop").css("border-color", "#0040FF");
      MotorStop();
   }
   if(keyValue[79]=='down'){
      console.log("오토");
      AutoChange();
   }
   if(keyValue[80]=='down'){
      console.log("메뉴얼");
      ManualChange();
   }
   
   if(keyValue[72]=='down'){
      console.log("방향전환");
      LineChange();
   }
}, 50);
/* 키 눌렀을 때 이벤트를 실행하겠다 */
document.addEventListener('keydown', function(event) {
//   event.preventDefault();
   keyValue[event.keyCode] = 'down';
}, true);
/* 키 땠을 때 이벤트를 실행하겠다 */
document.addEventListener('keyup', function(event) {   
//event.preventDefault();
   keyValue[event.keyCode] = 'up';
   stopInterval()
}, true);