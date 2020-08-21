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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/test.css">	  
</head>
<body>
   <h5 class="alert alert-success">Object Discrimination</h5>

   <div class="movebutton">
      <!-- 자동차 조종 방향키 -->
      <button class="btn btn-danger btn-sm" id="left">◀</button>
      <button class="btn btn-danger btn-sm" id="right">▶</button>
      <button class="btn btn-danger btn-sm" id="up">▲</button>
      <button class="btn btn-danger btn-sm" id="down">▼</button>
      <button class="btn btn-danger btn-sm" id="stop">■</button>
   </div>
   <div class="ViewBox">
      <div style = "float:left;">
         <img id="cameraView" style="width: 600px; height: 400px">
      </div>
   </div>
   <div style = "clear:left; padding-top : 30px;">
      <input type="button" id="autobutton" onclick="auto()" value="Auto"></input>
      <input type="button" id="recordbutton" onclick="record()" value="Ready"></input>
      <input type="text" id = "powerRemain" value="0"></input>
         스피드 : <input type="text" id = "speed" value="0"></input>
   </div>
	<!-- test 시작 -->
   <form method="post" action="test.do" id="idjoindata" enctype="multipart/form-data" name="idjoindata">
	   <div>
		   <input name="oname" type="text" id="nametextSAVE" readonly="readonly"></input>
		   <input name="odate" type="text" id="datetextSAVE" readonly="readonly"></input>
		   
		   <input type="button" class="btn btn-info btn-sm" id="buttonSAVE" onclick="SAVEFUNCTION(); return false;" value="저장">
	   </div>
   </form>
   
   <div class="btn btn-danger btn-sm">반복 실행</div>
   <!-- test 끝 -->
</body>
<script type="text/javascript">
//JSON.parse(data);
function SAVEFUNCTION(){
    var formData = $("#idjoindata").serialize();

    $.ajax({
        cache : false,
        url : "${pageContext.request.contextPath}/Objectdiscrimination/test.do", // 요기에
        type : 'POST', 
        data : formData, 
        success : function(data) {
            var jsonObj = data;
            console.log("객체 저장 성공!!")
        }, // success 

        error : function(xhr, status) {
        }
    }); // $.ajax */
}//function SAVEFUNCTION
//Z키 누를 때 DB저장 시작-----------------------------------------------------------
var keyValue = {};

// 키를 땟을 때
function stopInterval(action){
    if(keyValue[90]=='up'){
       console.log("저장버튼 off");
       keyValue[87]=''
    }
}
// 키를 눌렀을 때 
setInterval(function(action){
    if(keyValue[90]=='down'){
    	console.log("저장버튼 on");

    	if(nameval != ""){
    		SAVEFUNCTION();
    	}
    	if(nameval == ""){
    		console.log("객체 저장 실패..");
    	}
	 }
}, 1000);

// 키 눌렀을 때 이벤트를 실행하겠다 
document.addEventListener('keydown', function(event) {
   keyValue[event.keyCode] = 'down';
}, true);

// 키 땠을 때 이벤트를 실행하겠다 
document.addEventListener('keyup', function(event) {
   keyValue[event.keyCode] = 'up';
   stopInterval()
}, true);

//Z키 누를 때 DB저장 끝-----------------------------------------------------------
//네임 값 받아서 sql로 전송 시작-----------------------------------------------------
var nameval = "";
function alertgo(){
	nameval = $("#nametextSAVE").val();	
	
}
setInterval(alertgo, 100);

//네임 값 받아서 sql로 전송 끝------------------------------------------------------
setInterval(function(){
   var message = new Paho.MQTT.Message("arrived");
   message.destinationName = "/ControlMoving/Flag";
   client.send(message);
}, 500);


$(function() {
   client = new Paho.MQTT.Client("192.168.3.210", 61614, new Date()
         .getTime().toString());
   client.onMessageArrived = onMessageArrived;
   client.connect({
      onSuccess : onConnect
   });
});

/* 연결 완료 및 클라이언트 값 구독 */
function onConnect() {
   client.subscribe("/Camera");
   client.subscribe("/Message");
   client.subscribe("/CurrentP");
   client.subscribe("/curr_dir");
   client.subscribe("/speed");
   client.subscribe("/ConnectionCheck");
}
function onMessageArrived(message) {

   if (message.destinationName == "/Camera") {
      var cameraView = $("#cameraView").attr("src",
            "data:image/jpg;base64," + message.payloadString);
      
      var message = new Paho.MQTT.Message("arrived");
      message.destinationName = "/ControlMoving/Flag";
      message.qos = 0;
      client.send(message);     
   }//Camera

   if (message.destinationName == "/CurrentP") {
      $("#powerRemain").attr("value", message.payloadString);
   }//CurrentP
   
   if (message.destinationName == "/curr_dir") {
      var dir = JSON.parse(message.payloadString);
   }//curr_dir

   if (message.destinationName == "/Message") {
      var messageKey = Object.keys(JSON.parse(message.payloadString)).length;
      var nametextSAVE1 = $("#nametextSAVE").val();
      
      if(messageKey){
            for(var i = 0; i<messageKey; i++){
               var Num = JSON.parse(message.payloadString)[i];
               var x1 = Num.x1;
               var y1 = Num.y1;
               var x2 = Num.x2;
               var y2 = Num.y2;
               var name = Num.name;
               
               //test 시작----------------------------------------------------------------
               //오늘 날짜	  
			    var nowDate = new Date();
				var nowYear = nowDate.getFullYear();
				var nowMonth = nowDate.getMonth() +1;
				var nowDay = nowDate.getDate();				
				if(nowMonth < 10) { nowMonth = "0" + nowMonth; }
				if(nowDay < 10) { nowDay = "0" + nowDay; }	
				//오늘 날짜 결과
				var todayDate = nowYear + "-" + nowMonth + "-" + nowDay;// 연도는 길어서 제외			    	

                if(name.length > 0){   
		  		    $("#nametextSAVE").attr("value",name);
            	    $("#datetextSAVE").attr("value",todayDate);
                }    
	  		  //test 끝----------------------------------------------------------------
            }//messageKey for문
         }//messageKey if문

      	  //test2 시작
	      if (messageKey == 0){
	    	  $("#nametextSAVE").attr("value", "");
      	      $("#datetextSAVE").attr("value", "");
	      }
      	  //test2 끝
   }//Message
   
   if (message.destinationName == "/carLocation") {
      var messageKey = JSON.parse(message.payloadString).name;
      console.log(messageKey);
   }//carLocation
   
   if (message.destinationName == "/speed") {
      $("#speed").attr("value", message.payloadString);
   }//speed
}//onMessageArrived

var chk = true;
var rchk = true;
function record() {
   console.log(rchk)

   if (rchk == true) {
      document.getElementById("recordbutton").value = "Recording";
      var message = new Paho.MQTT.Message("Record");
      message.destinationName = "/ControlMoving/Recording";
      client.send(message);
      rchk = false;
   }

   else if (rchk == false) {
      document.getElementById("recordbutton").value = "Ready";
      var message = new Paho.MQTT.Message("dismiss");
      message.destinationName = "/ControlMoving/Ready";
      client.send(message);
      rchk = true;
   }
}//record()

function auto() {
   if (chk == true) {
      document.getElementById("autobutton").value = "Manual";
      var message = new Paho.MQTT.Message("ManualChg");
      chk = false;
   }
   
   else if (chk == false) {
      document.getElementById("autobutton").value = "Auto";
      var message = new Paho.MQTT.Message("AutoChg");
      chk = true;
   }
}//auto()
</script>
</html> 