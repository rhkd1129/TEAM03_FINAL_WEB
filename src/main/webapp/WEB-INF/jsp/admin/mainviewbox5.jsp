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

    <!-- css import -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mainviewbox5css.css">
	
	<!-- MQTT impoert -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
//Progress bar ---------------------------------------------------------------------------
//최근 10일간 신규 회원 등록 수
var totalmembernum = ${TodayNolist} + ${Yesterday1Nolist} + ${Yesterday2Nolist} + ${Yesterday3Nolist} + ${Yesterday4Nolist}
+${Yesterday5Nolist} + ${Yesterday6Nolist} + ${Yesterday7Nolist} + ${Yesterday8Nolist} + ${Yesterday9Nolist};
var persenttotalmember = (totalmembernum / 100) * 100;
//회원 데이터 * px 값
var persentpx = persenttotalmember * 7.4;

$("#onebarpersent").css("width",String(persentpx));
//현재 사용 x (but 사용 바로 가능)
$('.change_greeting1').text("7월 회원 목표량 : " + String(persenttotalmember) + "%");

//최근 10일간 신규 가게 등록 수
var Rtotalmembernum = ${RTodayNolist} + ${RYesterday1Nolist} + ${RYesterday2Nolist} + ${RYesterday3Nolist} + ${RYesterday4Nolist}
+${RYesterday5Nolist} + ${RYesterday6Nolist} + ${RYesterday7Nolist} + ${RYesterday8Nolist} + ${RYesterday9Nolist};
var Rpersenttotalmember = (Rtotalmembernum / 100) * 100;
//가게 데이터 * px 값
var Rpersentpx = Rpersenttotalmember * 7.4;

$("#twobarpersent").css("width",String(Rpersentpx));
//현재 사용 x (but 사용 바로 가능)
$('.change_greeting2').text("7월 가게 목표량 : " + String(Rpersenttotalmember) + "%");

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
					<img class="ring4" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome24">
					<img class="btnHomeimg24" src="${pageContext.request.contextPath}/resource/image/admin/controller1.png">
					<div class="btnHometext24">Manual</div>
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
			<!-- SMS Send Page =================================-->
			<div class="viewbox9">
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
안녕하세요 전영재님 즈기요입니다.
주문하신 음식이 도착하였습니다.♬
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

			<!-- member + device + instrument list =================================-->
			<div class="viewbox4">
				<div class="viewbox4mainbox">
					<div class="leftbox1">
					
						<div class="leftbox1-1">
							<div class="sampleimagetext">탐지 이미지: 샘플</div>
							<img id="sampleimageid" class="sampleimage1" src="${pageContext.request.contextPath}/resource/image/trafic/횡단보도.png">
			                <label for="modal" class="button">확대</label>               
						</div>
						
						<div class="leftbox1-2">
						 	  <ul id="ul_id">
							  	 <div class="ulname">탐지 리스트</div>
							  	 <div class="uljumpbox"></div>
							  </ul> 
						</div>
						
						<div class="leftbox1-3">
	             		   <div class="minimaptext">위치 정보</div>
	                       <img class="minimapimage1" src="${pageContext.request.contextPath}/resource/image/admin/minimap.png">
	                       <div class="minimaplocationtext">좌표 : 163.975 / 542.399</div>
	                       <div class="minimapping"></div>
						</div>
					</div>

					<div class="centerbox1">
  						<!-- leftbox1-1의 모달창 -->
                  		<input type="checkbox" id="modal" class="hidden" style="display: none;">
	                     <div class="box_modal">
	                       <label for="modal" class="closer" id="closed"></label>
	                       <div class="text">
	                       		<div class="textimagebox">
		                      	    <img id="sampleimageid1" class="sampleimage1" src="${pageContext.request.contextPath}/resource/image/trafic/횡단보도.png">	                       	   	                       
		                       		<div class="texttextbox">
		                       			<div class="imagenametext">횡단보도</div>
		                       			<div class="imageintroducetext">살어리 살어리였다 청산에 살어리였다.</div>		                       		
		                       		</div>
	                       		</div>                       
	                       </div>
	                     </div>
						
						<!-- MQTT -->
						<img id="cameraView" 
						style="width:1094px; height:650px; float: left;
						border-bottom: 2px solid #A4A4A4; border-bottom: 2px solid #A4A4A4;">	
					</div>

					<div class="rightbox1">
						<div class="rightbox1-1">
							<div class="wifibettory">
								<img class="wifi0" src="${pageContext.request.contextPath}/resource/image/device/와이파이1.png">
								<img class="wifi1" src="${pageContext.request.contextPath}/resource/image/device/와이파이2.png">
								<img class="wifi2" src="${pageContext.request.contextPath}/resource/image/device/와이파이3.png">
								<img class="wifi3" src="${pageContext.request.contextPath}/resource/image/device/와이파이4.png">
								<img class="bettery1" src="${pageContext.request.contextPath}/resource/image/device/battery1.png">
								<img class="bettery2" src="${pageContext.request.contextPath}/resource/image/device/battery2.png">
								<img class="bettery3" src="${pageContext.request.contextPath}/resource/image/device/battery3.png">
								<img class="bettery4" src="${pageContext.request.contextPath}/resource/image/device/battery4.png">
								<div class="todayday">0000-00-00</div>
							</div>
							<div class="changemode">AUTO</div>
						</div>
						<div class="rightbox1-2">
							<div class="orderlistpage">주문 상세 내역</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
$(".checkboxhiddengo").hide();
$(".viewbox9").hide();
$(".viewbox4").show();

/* 리스트 페이지 이동 Ajax */
$(".btnHome1").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox1_1.do";
});

/* 회원 차트 페이지 이동 Ajax */
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

/* 수동 페이지 이동 Ajax */
$(".btnHome24").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox6.do";
});

/* 차트 페이지 이동 Ajax */
$(".btnHome22").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox7.do";
});

/* CCTV 페이지 이동 Ajax */
$(".btnHome23").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox8.do";
});
//---------------------------------------------------------------------------
/* 리스트 배열 예제 start */
	   		/* 변수 모음 */
	   		var batteryrandom = 2;
		  	var countnum = 0;
		  	var lilength = 0;
		  	
	   		/* 1초마다 새로 값 생성 */
		  	setInterval(function(action){
		  		/* 난수 0~99 생성 */
		  		batteryrandom = Math.floor(Math.random() * 100); 
		  		
		  		/* 아이디 +1 */
		  		countnum +=1;
		  		
				/* li 14시 맨 앞 li 삭제 */
				lilength = $("ul li").length;
				if(lilength == 14){
					var smallid = countnum - 14;	
					$("#"+smallid).remove();
				}
				
				/* 0~10, 11~20, 21~30 ... 91~99 이미지 지정 변경 */
				/* 1 */
				if(batteryrandom >= 0 && batteryrandom < 11){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/100.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/100.png";				
					$('.imagenametext').text("[주의 사항] 100Km 제한");
					$('.imageintroducetext').text("제한속도 100Km 이내로 주행하시기 바랍니다.");
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 100Km");			
					$('.minimapping').css("left","450px");						
				}
				/* 2 */
				if(batteryrandom >= 11 && batteryrandom < 21){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/60.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/60.png";				
					$('.imagenametext').text("[주의 사항] 60Km 제한");
					$('.imageintroducetext').text("제한속도 60Km 이내로 주행하시기 바랍니다.");
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 60Km");						
					$('.minimapping').css("left","440px");					
				}
				/* 3 */
				if(batteryrandom >= 21 && batteryrandom < 31){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/급커브주의.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/급커브주의.png";				
					$('.imagenametext').text("[주의 사항] 급커브");
					$('.imageintroducetext').text("급커브 주의 구간입니다. 서행하시기 바랍니다.");
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 급커브");						
					$('.minimapping').css("left","430px");					
				}				
				/* 4 */
				if(batteryrandom >= 31 && batteryrandom < 41){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/방지턱주의.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/방지턱주의.png";				
					$('.imagenametext').text("[주의 사항] 방지턱");
					$('.imageintroducetext').text("전방에 방지턱을 발견하였습니다. 서행하시기 바랍니다.");
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 방지턱");						
					$('.minimapping').css("left","420px");					
				}				
				/* 5 */
				if(batteryrandom >= 41 && batteryrandom < 51){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/사람.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/사람.png";				
					$('.imagenametext').text("[주의 사항] 사람");
					$('.imageintroducetext').text("전방에 사람을 발견햇습니다. 서행하시기 바랍니다.");
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 사람");					
					$('.minimapping').css("left","410px");					
				}				
				/* 6 */				
				if(batteryrandom >= 51 && batteryrandom < 61){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/신호등.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/신호등.png";				
					$('.imagenametext').text("[주의 사항] 신호등");
					$('.imageintroducetext').text("전방에 신호등 구간입니다. 신호에 맞춰서 주행하시기 바랍니다.");	
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 신호등");					
					$('.minimapping').css("left","400px");					
				}				
				/* 7 */
				if(batteryrandom >= 61 && batteryrandom < 71){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/어린이보호구역.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/어린이보호구역.png";				
					$('.imagenametext').text("[주의 사항] 스쿨존");
					$('.imageintroducetext').text("스쿨존에 진입하였습니다. 어린이 보행 구간 주의 바랍니다.");
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 스쿨존");					
					$('.minimapping').css("left","390px");				
				}				
				/* 8 */
				if(batteryrandom >= 71 && batteryrandom < 81){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/정지.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/정지.png";				
					$('.imagenametext').text("[주의 사항] 정지");
					$('.imageintroducetext').text("전방에 정지 구간입니다. 정지해주시기 바랍니다.");	
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 정지");					
					$('.minimapping').css("left","380px");					
				}				
				/* 9 */
				if(batteryrandom >= 81 && batteryrandom < 91){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/콘.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/콘.png";				
					$('.imagenametext').text("[주의 사항] 장애물");
					$('.imageintroducetext').text("전방에 장애물 또는 공사 구간입니다. 서행하시기 바랍니다.");
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 장애물");					
					$('.minimapping').css("left","370px");					
				}				
				/* 10 */
				if(batteryrandom >= 91 && batteryrandom < 100){
					document.getElementById("sampleimageid").src="${pageContext.request.contextPath}/resource/image/trafic/횡단보도.png";
					document.getElementById("sampleimageid1").src="${pageContext.request.contextPath}/resource/image/trafic/횡단보도.png";				
					$('.imagenametext').text("[주의 사항] 횡단보도");
					$('.imageintroducetext').text("전방에 횡단보도 구간입니다. 신호에 맞춰서 가시기 바랍니다.");
					
					/* 재미용 */
					$('.sampleimagetext').text("탐지 이미지 : 횡단보도");					
					$('.minimapping').css("left","360px");					
				}											
		    }, 1000); 
	   	    
		  	/* 요소 내용 변경 */
	   		$('.lilist').text("타켓 : " + batteryrandom);
	   		
			/* 뒤로가기 */
			$("#gomainpage").click(function(){
			    location.href = "${pageContext.request.contextPath}/admin/main.do";
			}); 
			
			/* 1초마다 리스트 추가 */
			setInterval(function(action){
				add();
		   }, 1000); 			
			
			/* 리스트 추가 */
			function add(){  
			    $("#ul_id").append("<li id="+countnum+" class='lilist'>"+"탐지 결과 : "+batteryrandom+"</li>");  
			}  
			/* 리스트 배열 예제 end */
			
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
			
			/* 모달창 esc로 제거 */
			document.addEventListener('keydown', function(event) {
				if (event.keyCode === 27) {
					console.log("ddddd");
					document.getElementById("closed").click();
				}
			}, true);
			
			/* 오토모드 수동모드 선택 */
			var automanual = 0;
			$(".changemode").click(function(){
				automanual += 1;
				console.log(automanual);
				if(automanual %2 == 0){
					$('.changemode').text("MANUAL");
				}
				if(automanual %2 == 1){
					$('.changemode').text("AUTO");
				}
			});

			/* 배터리 량 변경 */
			var batteryrandom = Math.floor(Math.random() * 100); // 0 ~ 99
			$(".bettery1").hide();
			$(".bettery2").hide();
			$(".bettery3").hide();
			$(".bettery4").hide();

			if(batteryrandom <= 25){	//0~25
				$(".bettery1").show();
			}else if(batteryrandom <= 50 && batteryrandom > 25){
				$(".bettery2").show();	//26~50
			}else if(batteryrandom <= 75 && batteryrandom > 50){
				$(".bettery3").show();	//51~75
			}else if(batteryrandom <= 100 && batteryrandom > 75){
				$(".bettery4").show();	//76~100
			}

			/* 와이파이  */
			$(".wifi0").show();
			$(".wifi1").hide();
			$(".wifi2").hide();
			$(".wifi3").hide();

			$(document).ready(function(){
				wifitime = setTimeout(wifi0, 500);

				function wifi0(){
					$(".wifi0").show();

					$(".wifi3").hide();
				   setTimeout(wifi1, 500);
				}

				function wifi1(){
					$(".wifi1").show();

					$(".wifi0").hide();
				   setTimeout(wifi2, 500);
				}

				function wifi2(){
					$(".wifi2").show();

					$(".wifi1").hide();
				   setTimeout(wifi3, 500);
				}

				function wifi3(){
					$(".wifi3").show();

					$(".wifi2").hide();
				   setTimeout(wifi0, 500);
				}
			});

			/* 오늘 날짜  */
			var nowDate = new Date();
			var nowYear = nowDate.getFullYear();
			var nowMonth = nowDate.getMonth() +1;
			var nowDay = nowDate.getDate();

			if(nowMonth < 10) { nowMonth = "0" + nowMonth; }
			if(nowDay < 10) { nowDay = "0" + nowDay; }

			//오늘 날짜 결과
			var todayDate = nowYear + "-" + nowMonth + "-" + nowDay;
			$('.todayday').text(String(todayDate));

//---------------------------------------------------------------------------
//오늘 날짜
var nowYear = nowDate.getFullYear();
var nowMonth = nowDate.getMonth() +1;
var nowDay = nowDate.getDate();

if(nowMonth < 10) { nowMonth = "0" + nowMonth; }
if(nowDay < 10) { nowDay = "0" + nowDay; }

//오늘 날짜 결과
var todayDate = nowMonth + "-" + nowDay;// 연도는 길어서 제외
</script>
</html>
