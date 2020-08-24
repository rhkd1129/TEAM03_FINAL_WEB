<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="sms.SMS" %>
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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/fixlayout.css">

</head>
<body id="fixlayoutpage">

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
       <img   class="hud01" src="${pageContext.request.contextPath}/resource/image/hud2/hover01.png">
       <img   class="hud02" src="${pageContext.request.contextPath}/resource/image/hud2/hover02.png">         
       <img   class="hud03" src="${pageContext.request.contextPath}/resource/image/hud2/hover03.png">
       <img   class="hud04" src="${pageContext.request.contextPath}/resource/image/hud2/hover04.png">
       <img   class="hud05" src="${pageContext.request.contextPath}/resource/image/hud2/hover05.png">              
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
		<div class="Camimg1">
			<img class="Camimg1-1" src="${pageContext.request.contextPath}/resource/image/hud2/풀사진(최종).png">
		</div>
		<div class="Camimg2">
			<img class="Camimg2-1" src="${pageContext.request.contextPath}/resource/image/hud2/오토모드.png">
		</div>
		<div class="Camimg3">
			<img class="Camimg3-1" src="${pageContext.request.contextPath}/resource/image/hud2/차선인지영역.png">
		</div>		
		<div class="Camimg4">
			<img class="Camimg4-1" src="${pageContext.request.contextPath}/resource/image/hud2/차선인지변환사진.png">
		</div>		
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

<!-- 거리감지 Canvas -->
<canvas id="distancesensing1" width="1200" height="900"></canvas>
<canvas id="distancesensing2" width="1200" height="900"></canvas>
<canvas id="distancesensing3" width="1200" height="900"></canvas>
<canvas id="distancesensing4" width="1200" height="900"></canvas>
<canvas id="distancesensing5" width="1200" height="900"></canvas>

<!-- hidden input 박스 -->
<div class="inputboxhidden">
   <form method="post" action="fixlayout.do" id="idjoindata" enctype="multipart/form-data" name="idjoindata">
	   <div>
		   <input name="oname" type="text" id="nametextSAVE" readonly="readonly"></input>
		   <input name="odate" type="text" id="datetextSAVE" readonly="readonly"></input>
		   
		   <input type="button" class="btn btn-info btn-sm" id="buttonSAVE" onclick="SAVEFUNCTION(); return false;" value="저장">
	   </div>
   </form>
   
	<div class="btn btn-danger btn-sm">반복 실행</div>
</div>

<!-- 객체 리스트 박스 -->
<div class="objectlistbox">
<!-- 	<div class="listtrbox"> -->
<!-- 		<div class="objectlistidbox">Id</div> -->
<!-- 		<div class="objectlistnamebox">Name</div> -->
<!-- 		<div class="objectlistdatebox">Date</div>	 -->
<!-- 	</div> -->
	
	<div class="listtdbox">
		<!-- Omember List -->
		<table class="listtable">
			<c:forEach var="omember" items="${omemberlist}">
				<tr class="olistTR">
					<td class="olistidTD">${omember.oid}</td>
					<td class="olistnameTD">${omember.oname}</td>
					<td class="olistdateTD">${omember.odate}</td>
				</tr>
			</c:forEach>
		</table>
		<table class="pagepage1">
			<tr>
				<td colspan="6">
					<a class="firstbtn" onclick="viewPaging(1)">처음</a>

					<c:if test="${pager.groupNo > 1}">
						<a class="lastbtn" onclick="viewPaging('${pager.startPageNo-pager.pagesPerGroup}')">이전</a>
					</c:if>

					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
						<!-- 현재 페이지와 ${i}와 같다면 색을 변경 -->
							<a class="numbtn" onclick="viewPaging('${i}')"> ${i}</a>
						</c:if>

						<c:if test="${pager.pageNo == i}">
							<a class="numbtn" onclick="viewPaging('${i}')"> ${i}</a>
						</c:if>
					</c:forEach>

					<c:if test="${pager.groupNo < pager.totalGroupNo}">
						<a class="nextbtn" onclick="viewPaging('${pager.endPageNo+1}')">다음</a>
					</c:if>
					<a class="endbtn" onclick="viewPaging('${pager.totalPageNo}')">맨끝</a>
				</td>
			</tr>
		</table>
	</div>
</div>

<!-- 핑 위치 배달 설정 -->
<div class="backgroundopacitybox"></div>
<div class="pointdeliverybox">
	<div class="A boxpoint" style="margin-top:20px; margin-left:240px;">A</div>
	<div class="B boxpoint" style="margin-top:20px; margin-left:185px;">B</div>
	<div class="C boxpoint" style="margin-top:20px; margin-left:130px;">C</div>
	<div class="D boxpoint" style="margin-top:20px; margin-left:75px;">D</div>
	<div class="E boxpoint" style="margin-top:40px; margin-left:41px;">E</div>
	<div class="F boxpoint" style="margin-top:80px; margin-left:41px;">F</div>
	<div class="H boxpoint" style="margin-top:180px; margin-left:21px;">H</div>
	<div class="I boxpoint" style="margin-top:220px; margin-left:21px;">I</div>
	<div class="J boxpoint" style="margin-top:247px; margin-left:55px;">J</div>
	<div class="K boxpoint" style="margin-top:274px; margin-left:100px;">K</div>
	<div class="M boxpoint" style="margin-top:274px; margin-left:170px;">M</div>
	<div class="N boxpoint" style="margin-top:274px; margin-left:240px;">N</div>
	<div class="P boxpoint" style="margin-top:230px; margin-left:268px;">P</div>
	<div class="S boxpoint" style="margin-top:135px; margin-left:268px;">S</div>
	<div class="T boxpoint" style="margin-top:60px; margin-left:268px;">T</div>
	
	<div id="pointstext"></div>
	<div id="points">Delivery</div>
</div>

<div class="box_modal4">
	<div class="modaltext4">Move Point [--]</div>
</div>

<!-- SMS Send Page =================================-->
<div class="viewbox9" style="position: absolute; z-index: 9999;">
	<div class="container" id="SMSCONTAINER">
    <form method="post" name="smsForm" action="smssend.do">
    	<table class="table table-striped" id="SMSTABLE" style="text-align: center; border: 1px solid #dddddd">
    		<thead>
    			<tr>
    				<td style="text-align: center; font-weight: bold;">문자 전송 양식</td>
    			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td>
    					<!-- 받는 사람 이름 설정 필요! -->
      					<textarea id="SMStextarea" class="form-control" maxlength="45" name="msg" readonly="readonly">
안녕하세요 고객님 즈기요입니다.
주문하신 음식이 --로 
출발하였습니다.♬
      					</textarea>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<!-- 받는 사람 전화번호 설정 필요! -->
						<input id="SMSinput" class="form-control" type="text" name="rphone" value="010-8832-7217" readonly="readonly">
    				</td>
    			</tr>
    			<tr>
    				<td>
						주의 사항 : 『문자는 신중하게!』 『전송은 빠르게!』 『내용은 안전하게!』
    				</td>
    			</tr>
    			<tr>
    				<td>
						남은 문자 잔여량 : <%= new SMS().getCount() %>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<input type="hidden" name="action" value="go">
				        <input type="hidden" name="sphone1" value="010">
				        <input type="hidden" name="sphone2" value="8832">
				        <input type="hidden" name="sphone3" value="7217">
				        <input class="btn btn-primary pull-right" id="sendmessage" type="submit" value="전송">
    				</td>
    			</tr>
    		</tbody>
    	</table>

    </form>	<!-- SMS form  -->
    </div>	<!-- container div -->
</div>

<div class="warningbox">
	<div class="warningbox2">
		Detection of objects 20cm ahead
	</div>
</div>
<!-- ------------------------------------------------------------------------------------------------------------- -->
<!-- Jarvis Canvas Script -->
<script>
$(".warningbox").hide();

/* 목적지 설정 및 문자 전송 */
$(".viewbox9").hide();
var pointtextex = $("#pointstext").html();

$(".A").click(function(){
	$("#pointstext").text("Point A");
	$(".A").css("background-color","rgba(47,138,241,0.3)");
});
$(".B").click(function(){
	$("#pointstext").text("Point B");
	$(".B").css("background-color","rgba(47,138,241,0.3)");
});
$(".C").click(function(){
	$("#pointstext").text("Point C");
	$(".C").css("background-color","rgba(47,138,241,0.3)");
});
$(".D").click(function(){
	$("#pointstext").text("Point D");
	$(".D").css("background-color","rgba(47,138,241,0.3)");
});
$(".E").click(function(){
	$("#pointstext").text("Point E");
	$(".E").css("background-color","rgba(47,138,241,0.3)");
});
$(".F").click(function(){
	$("#pointstext").text("Point F");
	$(".F").css("background-color","rgba(47,138,241,0.3)");
});
$(".H").click(function(){
	$("#pointstext").text("Point H");
	$(".H").css("background-color","rgba(47,138,241,0.3)");
});
$(".I").click(function(){
	$("#pointstext").text("Point I");
	$(".I").css("background-color","rgba(47,138,241,0.3)");
});
$(".J").click(function(){
	$("#pointstext").text("Point J");
	$(".J").css("background-color","rgba(47,138,241,0.3)");
});
$(".K").click(function(){
	$("#pointstext").text("Point K");
	$(".K").css("background-color","rgba(47,138,241,0.3)");
});
$(".M").click(function(){
	$("#pointstext").text("Point M");
	$(".M").css("background-color","rgba(47,138,241,0.3)");
});
$(".N").click(function(){
	$("#pointstext").text("Point N");
	$(".N").css("background-color","rgba(47,138,241,0.3)");
});
$(".P").click(function(){
	$("#pointstext").text("Point P");
	$(".P").css("background-color","rgba(47,138,241,0.3)");
});
$(".S").click(function(){
	$("#pointstext").text("Point S");
	$(".S").css("background-color","rgba(47,138,241,0.3)");
});
$(".T").click(function(){
	$("#pointstext").text("Point T");
	$(".T").css("background-color","rgba(47,138,241,0.3)");
});

$("#points").click(function(){
	pointtextex = $("#pointstext").html();
	
	if(pointtextex == "" || pointtextex == null){
		console.log("[Error]선택된 지점이 없습니다.");	
		$(".boxpoint").css("background-color","")
	}
	if(pointtextex != ""){
		$(".modaltext4").text("Move Point ["+pointtextex+"]");
		$(".boxpoint").css("background-color","")
		$("#SMStextarea").text("안녕하세요 고객님! 배달업체 즈기요입니다. 주문하신 음식이 "+pointtextex+"로 출발하였습니다.♬");
		$("#sendmessage").trigger("click");
	}
})

/* 페이져  시작*/
function viewPaging(pageNo) {
	   var pageNo = pageNo;
	   $.ajax({
	      type : "get", // get방식으로 자료를 전달
	      url : "${pageContext.request.contextPath}/Objectdiscrimination/fixlayout.do?pageNo=" +pageNo,
	      success : function(result) { // 자료를 보내는것이 성공했을때 출력되는 메시지
	         // 댓글목록을 실행한 결과를 가져온다.
	         $("#fixlayoutpage").html(result);
      }
   });
};
/* 페이져  끝*/

$(".inputboxhidden").hide();

//객체 명단 저장 시작
function SAVEFUNCTION(){
    var formData = $("#idjoindata").serialize();

    $.ajax({
        cache : false,
        url : "${pageContext.request.contextPath}/Objectdiscrimination/fixlayout.do", // 요기에
        type : 'POST', 
        data : formData, 
        success : function(data) {
            var jsonObj = data;
            console.log("Save Success")
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
       console.log("Press off");
       keyValue[87]=''
    }
}
// 키를 눌렀을 때 
setInterval(function(action){
    if(keyValue[90]=='down'){
    	console.log("Press on");

    	if(nameval != ""){
    		SAVEFUNCTION();
    	}
    	if(nameval == ""){
    		console.log("Save Fail");
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
//객체 명단 저장 끝
$(".Jetson2").click(function(){
	location.href="${pageContext.request.contextPath}/Objectdiscrimination/jetson2.do";
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
context.fillStyle = 'rgba(2,254,255,0.3)';
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
context.fillStyle = 'rgba(2,254,255,0.3)';
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
context.fillStyle = 'rgba(2,254,255,0.3)';
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
		 		
		 		arrowctx.strokeStyle = "#05E5EE";    // 선색 변경
		 		arrowctx.lineWidth = 10;             // 선 두깨 설정
		 		arrowctx.shadowOffsetX = 0;
		 		arrowctx.shadowOffsetY = 0;
		 		arrowctx.shadowBlur = 20;
		 		arrowctx.shadowColor = "#05E5EE";
		 		
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
        var messageKey = Object.keys(JSON.parse(message.payloadString)).length;
        var nametextSAVE1 = $("#nametextSAVE").val();
        
        if (messageKey == 0){
        	$("#total").children().remove(".hoverbox");
        	$("#nametextSAVE").attr("value", "");
    	    $("#datetextSAVE").attr("value", "");
        }
    	
        var hoverone = document.getElementById("hoverbox");   
        var textboxlineone = document.getElementById("textboxline");

        if(Object.keys(JSON.parse(message.payloadString)).length == 0){	
			$("#textboxline").css("color","rgba(2, 255, 255, 0.6)");
			document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/admin2.png";
			$("#textboximg").css("box-shadow","0 0 0px #05E5EE, 0 0 0px #05E5EE");
			$("#textboximg").css("border","3px solid rgba(2, 255, 255, 0.6)");
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
			
			/* 거리 감지 script start */		
				var sensing1 = document.getElementById("distancesensing1");
				var sensing2 = document.getElementById("distancesensing2");
				var sensing3 = document.getElementById("distancesensing3");
				var sensing4 = document.getElementById("distancesensing4");
				var sensing5 = document.getElementById("distancesensing5");
				
				var sensing1ctx = sensing1.getContext("2d");
				var sensing2ctx = sensing2.getContext("2d");
				var sensing3ctx = sensing3.getContext("2d");
				var sensing4ctx = sensing4.getContext("2d");
				var sensing5ctx = sensing5.getContext("2d");			
				
				sensing1ctx.clearRect(0, 0, sensing1.width, sensing1.height);
				sensing2ctx.clearRect(0, 0, sensing2.width, sensing2.height);
				sensing3ctx.clearRect(0, 0, sensing3.width, sensing3.height);
				sensing4ctx.clearRect(0, 0, sensing4.width, sensing4.height);
				sensing5ctx.clearRect(0, 0, sensing5.width, sensing5.height);
				
				//배경 사다리꼴
				sensing1ctx.moveTo(450, 400);
				sensing1ctx.lineTo(750, 400);
				sensing1ctx.lineTo(1000, 800);
				sensing1ctx.lineTo(200, 800);
				sensing1ctx.fillStyle = "";
				sensing1ctx.fill();
				
				//1차 사다리꼴
				sensing2ctx.moveTo(452, 402);//배경선 보이게 하기 위함
				sensing2ctx.lineTo(748, 402);
				sensing2ctx.lineTo(810, 500);
				sensing2ctx.lineTo(390, 500);
				
				sensing2ctx.fillStyle = "#05E5EE";
				sensing2ctx.lineWidth = 10;             // 선 두깨 설정
				sensing2ctx.shadowOffsetX = 0;
				sensing2ctx.shadowOffsetY = 0;
				sensing2ctx.shadowBlur = 20;
				sensing2ctx.shadowColor = "#05E5EE";
				sensing2ctx.fill();
				
				//2차 사다리꼴
				sensing3ctx.moveTo(390, 502);//배경선 보이게 하기 위함
				sensing3ctx.lineTo(810, 502);
				sensing3ctx.lineTo(873, 600);
				sensing3ctx.lineTo(327, 600);
				
				sensing3ctx.fillStyle = "#05E5EE";
				sensing3ctx.lineWidth = 10;             // 선 두깨 설정
				sensing3ctx.shadowOffsetX = 0;
				sensing3ctx.shadowOffsetY = 0;
				sensing3ctx.shadowBlur = 20;
				sensing3ctx.shadowColor = "#05E5EE";
				sensing3ctx.fill();
				
				//3차 사다리꼴
				sensing4ctx.moveTo(327, 602);//배경선 보이게 하기 위함
				sensing4ctx.lineTo(873, 602);
				sensing4ctx.lineTo(936, 700);
				sensing4ctx.lineTo(264, 700);
				
				sensing4ctx.fillStyle = "#05E5EE";
				sensing4ctx.lineWidth = 10;             // 선 두깨 설정
				sensing4ctx.shadowOffsetX = 0;
				sensing4ctx.shadowOffsetY = 0;
				sensing4ctx.shadowBlur = 20;
				sensing4ctx.shadowColor = "#05E5EE";
				sensing4ctx.fill();
				
				//4차 사다리꼴
				sensing5ctx.moveTo(264, 702);//배경선 보이게 하기 위함
				sensing5ctx.lineTo(936, 702);
				sensing5ctx.lineTo(997, 798);
				sensing5ctx.lineTo(203, 798);
				
				sensing5ctx.fillStyle = "#05E5EE";
				sensing5ctx.lineWidth = 10;             // 선 두깨 설정
				sensing5ctx.shadowOffsetX = 0;
				sensing5ctx.shadowOffsetY = 0;
				sensing5ctx.shadowBlur = 20;
				sensing5ctx.shadowColor = "#05E5EE";
				sensing5ctx.fill();			
				
				/* 거리감지 script end 908|480*/
				if(centerx >= 710 && centerx <= 1103 && centery >= 402 && centery <= 500){
					console.log("1차@@@@")					
					sensing2ctx.fillStyle = "#FFFFFF";
					sensing2ctx.shadowColor = "#FFFFFF";
					sensing2ctx.fill();
					$(".warningbox").show();
					$(".warningbox2").text("Detection of objects 20cm ahead");
				}
				else if(centerx >= 647 && centerx <= 1193 && centery >= 502 && centery <= 600){
					console.log("2차@@@@")
					sensing2ctx.fillStyle = "#FFFFFF";
					sensing2ctx.shadowColor = "#FFFFFF";
					sensing3ctx.fillStyle = "#FFFFFF";
					sensing3ctx.shadowColor = "#FFFFFF";
					sensing2ctx.fill();
					sensing3ctx.fill();
					$(".warningbox").show();
					$(".warningbox2").text("Detection of objects 15cm ahead");
				}
				else if(centerx >= 494 && centerx <= 1256 && centery >= 602 && centery <= 700){
					console.log("3차@@@@")
					sensing2ctx.fillStyle = "#FFFFFF";
					sensing2ctx.shadowColor = "#FFFFFF";
					sensing3ctx.fillStyle = "#FFFFFF";
					sensing3ctx.shadowColor = "#FFFFFF";
					sensing4ctx.fillStyle = "#FFFFFF";
					sensing4ctx.shadowColor = "#FFFFFF";
					sensing2ctx.fill();
					sensing3ctx.fill();
					sensing4ctx.fill();
					$(".warningbox").show();
					$(".warningbox2").text("Detection of objects 10cm ahead");
				}
				else if(centerx >= 523 && centerx <= 1317 && centery >= 702 && centery <= 798){
					console.log("4차@@@@")
					sensing2ctx.fillStyle = "#FFFFFF";
					sensing2ctx.shadowColor = "#FFFFFF";
					sensing3ctx.fillStyle = "#FFFFFF";
					sensing3ctx.shadowColor = "#FFFFFF";
					sensing4ctx.fillStyle = "#FFFFFF";
					sensing4ctx.shadowColor = "#FFFFFF";
					sensing5ctx.fillStyle = "#FFFFFF";
					sensing5ctx.shadowColor = "#FFFFFF";
					sensing2ctx.fill();
					sensing3ctx.fill();
					sensing4ctx.fill();
					sensing5ctx.fill();
					$(".warningbox").show();
					$(".warningbox2").text("Detection of objects 5cm ahead");
				}
				
				else{
					console.log("@@@@")
					$(".warningbox").hide();
					$(".warningbox2").text("");
				}
				
			
			if(name.length != 0){								
				$("#textboxline").remove();
				var textboxlinechild = textboxlineone.cloneNode(true);
				textboxlinechild.setAttribute("id", "textboxline");
				$("#checkelement").append(textboxlinechild);	
				
				if(changenum != name){
					if(name.length == 1){
						$("#textboxline").text("Current Location : " + "[" + name + "]");	
						$("#textboxline").css("color","#02feff");
						$("#textboximg").css("box-shadow","0 0 10px #05E5EE, 0 0 10px #05E5EE");
						$("#textboximg").css("border","3px solid #05E5EE");
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
							document.getElementById("textboximg").src="${pageContext.request.contextPath}/resource/image/도로사진/t.jpg";
						}
					}else if(name.length > 1){				
						$("#textboxline").text("Object Detection : " + "[" + name + "]");
						$("#textboxline").css("color","#02feff");
						$("#textboximg").css("box-shadow","0 0 10px #05E5EE, 0 0 10px #05E5EE");
						$("#textboximg").css("border","3px solid #05E5EE");
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
			
           //오늘 날짜	  
		    var nowDate1 = new Date();
			var nowYear1 = nowDate1.getFullYear();
			var nowMonth1 = nowDate1.getMonth() +1;
			var nowDay1 = nowDate1.getDate();				
			if(nowMonth1 < 10) { nowMonth1 = "0" + nowMonth1; }
			if(nowDay1 < 10) { nowDay1 = "0" + nowDay1; }	
			//오늘 날짜 결과
			var todayDate1 = nowYear1 + "-" + nowMonth1 + "-" + nowDay1;// 연도는 길어서 제외			    	

           if(name.length > 0){   
	  		    $("#nametextSAVE").attr("value",name);
       	    $("#datetextSAVE").attr("value",todayDate1);
           } 	
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
    textColor : '#05E5EE',
    fontSize : "50px",
    useCanvas : false,
    mixCapital : false,
    mixSpecialCharacters : false,
    needUpdate : true,
    colors : [
      '#05E5EE'
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
  textColor : '#05E5EE',
  timeOffset : 3,
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

/* 락온 모드 */
$(".backgroundopacitybox").hide();

$(".controlbox2").click(function(){
	$(".backgroundopacitybox").show();
});

/* 락온 모드 풀기 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 88) {
		$(".backgroundopacitybox").hide();
	}
}, true);

 
/* 로그 아웃 */
$(".controlbox3").click(function(){
	location.href="${pageContext.request.contextPath}/Objectdiscrimination/login.do";
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
mapArea.readyDrawCar("#05E5EE", 7);

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
        var strokeStyleList = ["#05E5EE", "black", "#05E5EE"];

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

setInterval(clickevent, 10000);
  
  
  
</script>
<!-- MQTT Jetson 조작 시 필요 js 소환 -->
<script src="${pageContext.request.contextPath}/resource/script/hud_control.js"></script>
</body>
</html>