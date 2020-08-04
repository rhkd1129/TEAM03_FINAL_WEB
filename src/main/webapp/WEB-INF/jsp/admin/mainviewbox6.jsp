<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- SMS import -->
<%@ page import="sms.SMS" %>

<!DOCTYPE html>
<html>
<head>
    <title>관리자 페이지</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resource/image/admin/관리자.png">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
    <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>

    <!-- SMS import 1 (필요x?) -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- w3school import -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- w3school import2 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- gage bar import -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- hichart import -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>

    <!-- css import -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mainviewbox6css.css">
	
	<!-- MQTT impoert -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">

</script>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" id="adminmainpage">
	<div class="bodymainbox">
		<!-- /* 메뉴바 bigbox */ ------------------------------------------------------------------------>
		<div class="navbarmain">
			<div class=nav1>
				<img class="nav1img1" src="${pageContext.request.contextPath}/resource/image/admin/관리자.png">
				<div class="nav1text1">Admin Page</div>
			</div>
			<div class=nav2>
				<img class="nav2img1" src="${pageContext.request.contextPath}/resource/image/admin/윤봉길.png">
				<div class="nav2text1">Welcome,</div>
				<div class="nav2text2">Administrator Yoon</div>
			</div>

			<!-- /* Group1 */ -->
			<div class=nav3>
				<div class="nav3text1">Restaurant | Customer</div>

				<div class="btnHome1">
					<img class="btnHomeimg1" src="${pageContext.request.contextPath}/resource/image/admin/list1.png">
					<div class="btnHometext1">List</div>
				</div>

				<div class="btnHome2">
					<img class="btnHomeimg2" src="${pageContext.request.contextPath}/resource/image/admin/data.png">
					<div class="btnHometext2">Data</div>
				</div>

				<div class="btnHome3">
					<img class="btnHomeimg3" src="${pageContext.request.contextPath}/resource/image/admin/map.png">
					<div class="btnHometext3">Map</div>
				</div>

				<div class="btnHome9">
					<img class="btnHomeimg9" src="${pageContext.request.contextPath}/resource/image/admin/message1.png">
					<div class="btnHometext9">SMS</div>
				</div>
			</div>
			<!-- /* Group2 */ -->
			<div class=nav4>
				<div class="nav4text1">Device | Instrument</div>

				<div class="btnHome21">
					<img class="btnHomeimg21" src="${pageContext.request.contextPath}/resource/image/admin/automatic1.png">
					<div class="btnHometext21">Auto</div>
				</div>

				<div class="btnHome24">
					<img class="btnHomeimg24" src="${pageContext.request.contextPath}/resource/image/admin/controller1.png">
					<div class="btnHometext24">Manual</div>
					<img class="ring7" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome22">
					<img class="btnHomeimg22" src="${pageContext.request.contextPath}/resource/image/admin/data.png">
					<div class="btnHometext22">Data</div>
				</div>

				<div class="btnHome23">
					<img class="btnHomeimg23" src="${pageContext.request.contextPath}/resource/image/admin/map.png">
					<div class="btnHometext23">CCTV</div>
				</div>

			</div>
		</div>

		<!-- /* 뷰박스 bigbox */ ------------------------------------------------------------------------>
		<div class="viewmainbox">
			<!-- device controller =================================-->
			<div class="viewbox7"> <!-- 1685 * 937 -->
				<!-- MQTT -->
				<img id="cameraView2">
				<div class="viewbox7databox">
					<a style="color: white; font-size: 20px; font-weight: bold;" 
					href="${pageContext.request.contextPath}/admin/chart.do">실험 페이지로 이동</a>
				
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- pointping box (no position) -->
				<div class="positionbox">
                      <img class="positionbox2" src="${pageContext.request.contextPath}/resource/image/admin/minimap.png">
                      <div class="positionbox4"></div>
				</div>
				
				<!-- Controller box (no position) -->
				<div class="controllerbox">
					<button type="button" class="gostraight" id="gostraight">
						<img class="buttonicon" src="${pageContext.request.contextPath}/resource/image/trafic/전진.png">
					</button>
					<button type="button" class="gostop" id="gostop">■</button>
					<button type="button" class="goback" id="goback">
						<img class="buttonicon" src="${pageContext.request.contextPath}/resource/image/trafic/후진.png">					
					</button>
					<button type="button" class="goleft" id="goleft">
						<img class="buttonicon" src="${pageContext.request.contextPath}/resource/image/trafic/왼쪽.png">					
					</button>
					<button type="button" class="goright" id="goright">
						<img class="buttonicon" src="${pageContext.request.contextPath}/resource/image/trafic/오른쪽.png">				
					</button>	
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
//viewbox7 script start---------------------------------------------------------------
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
		var cameraView = $("#cameraView").attr(
				"src", "data:image/jpg;base64,"+message.payloadString);
		
		var cameraView = $("#cameraView2").attr(
				"src", "data:image/jpg;base64,"+message.payloadString);
	}
	var message = new Paho.MQTT.Message("frame arrived");
	message.destinationName = "/Frame/Flag";
	message.qos = 0;
	client.send(message);
}
/* MQTT end */


/* 키 안에 담는 객체 = 꼭필요 중요★★★★★ --------------------------------------------------------------------- */
var keyValue = {};

  /* 키를 땟을 때 ----------------------------------------------------------------------- */
  function stopInterval(action){
   /* 전진 키 땠을때 */
      if(keyValue[87]=='up')
      {
    	 console.log(keyValue[2]);
         console.log("앞으로 끝")
         $(".gostraight").css("border-color", "#FF0000");
         $(".gostraight").css("background-color", "#FA5858");
         keyValue[87]=''
      }
      /* 후진 키 땠을때 */
      if(keyValue[83]=='up')
      {
         console.log("뒤로 끝")
         $(".goback").css("border-color", "#FF0000");
         $(".goback").css("background-color", "#FA5858");
         keyValue[83]=''
      }
      /* 우회전 키 땠을때 */
      if(keyValue[68]=='up')
      {
         console.log("우회전 끝")
         $(".goright").css("border-color", "#FF0000");
         $(".goright").css("background-color", "#FA5858");
         keyValue[68]=''
      }
      /* 좌회전 키 땠을때 */
      if(keyValue[65]=='up')
      {
         console.log("좌회전 끝")
         $(".goleft").css("border-color", "#FF0000");
         $(".goleft").css("background-color", "#FA5858");
         keyValue[65]=''
      }
      /* 정지 키 땠을때 */
      if(keyValue[32]=='up')
      {
         console.log("정지 스탑")
         $(".gostop").css("border-color", "#FF0000");
         $(".gostop").css("background-color", "#FA5858");
      }
  }

  /* 키를 눌렀을 때 ------------------------------------------------- */
  setInterval(function(action){
   /* 전진 키 눌렀을때 */
      if(keyValue[87]=='down')
      {
         console.log("앞으로")
         $(".gostraight").css("border-color", "#31B404");
         $(".gostraight").css("background-color", "#3e8e41");
         document.getElementById("gostraight").click();
  	 }
      /* 후진 키 눌렀을때 */
      if(keyValue[83]=='down')
      {
         console.log("뒤로")
         $(".goback").css("border-color", "#31B404");
         $(".goback").css("background-color", "#3e8e41");
         document.getElementById("goback").click();
      }

      /* 우회전 키 눌렀을때 */
      if(keyValue[68]=='down')
      {
         console.log("우회전")
         $(".goright").css("border-color", "#31B404");
         $(".goright").css("background-color", "#3e8e41");
         document.getElementById("goright").click();
      }
      /* 좌회전 키 눌렀을때 */
      if(keyValue[65]=='down')
      {
         console.log("좌회전")
         $(".goleft").css("border-color", "#31B404");
         $(".goleft").css("background-color", "#3e8e41");
         document.getElementById("goleft").click();
      }
      /* 정지 키 눌렀을때 */
      if(keyValue[32]=='down')
      {
         console.log("정지")
         $(".gostop").css("border-color", "#31B404");
         $(".gostop").css("background-color", "#3e8e41");
         document.getElementById("gostop").click();
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

// viewbox7 script end---------------------------------------------------------------
/* 회원 리스트 페이지 이동 Ajax */
$(".btnHome1").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox1_1.do";
});

/* 가게 차트 페이지 이동 Ajax */
$(".btnHome2").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox2.do";
});

/* 지도 페이지 이동 Ajax */
$(".btnHome3").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox3.do";
});

/* 문자 페이지 이동 Ajax */
$(".btnHome9").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox4.do";
});

/* 오토모드 페이지 이동 Ajax */
$(".btnHome21").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox5.do";
});

/* 차트 페이지 이동 Ajax */
$(".btnHome22").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox7.do";
});

/* CCTV 페이지 이동 Ajax */
$(".btnHome23").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox8.do";
});
</script>
</html>