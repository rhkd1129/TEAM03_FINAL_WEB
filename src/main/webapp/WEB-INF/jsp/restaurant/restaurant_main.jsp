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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/restaurant_maincss.css">
	<script>
		$(function(){
			var rno = ${rno}
			
			$(function(){
				client = new Paho.MQTT.Client("192.168.3.210", 61614, new Date().getTime().toString());
				client.onMessageArrived = onMessageArrived;
				client.connect({onSuccess:onConnect});
			});
			/* 연결 완료 및 클라이언트 값 구독 */
			function onConnect() {
				client.subscribe("/Camera");
				client.subscribe("/DeliveryCar/#");
			}
			
			function onMessageArrived(message) {
				if(message.destinationName == "/DeliveryCar/DeliveryComplete") {
					
					var ono = JSON.parse(message.payloadString).ono;
					ono = parseInt(ono);
					// var ono = JSON.parse(message.payloadString).ono;
					console.log(ono)
					completeDelivery(ono)
				}
				/* var message = new Paho.MQTT.Message("frame arrived");
				message.destinationName = "/Frame/Flag";
				message.qos = 0;
				client.send(message); */
			}			
			
			
			$('#menu1').css({
				'background-color' : '#ffffff',
				'color' : '#000000'
			})
			$('#menu2').css({
				'background-color' : '#d7dada',
				'color' : '#a6abab'
			})
			$('#menu3').css({
				'background-color' : '#d7dada',
				'color' : '#a6abab'
			})
			$('#menu4').css({
				'background-color' : '#d7dada',
				'color' : '#a6abab'
			})
			
			$.ajax({
				type : "get", 
				url : "restaurant_order_queue.do?rno="+rno,
				success : function(result) { 
					$(".content1").html(result)
				}
			});
		})
	
		function completeDelivery(ono){
			var rno = ${rno}
			var ono = ono
			$.ajax({
				type : "get", 
				url : "restaurant_order_delivery_complete.do?rno="+ rno + "&ono="+ono,
				success : function(result) { 
					$(".content1").html(result)
				}
			});
		}
		
		function randomItem(a) {
			  return a[Math.floor(Math.random() * a.length)];
			}
		
		function takeOver(ono) {
			console.log("실행")
			var rno = ${rno};
			var ono = ono
			var dest = new Array('B','C','D','E','F','H','I','J','K','M','N','P','S','T');
			$.ajax({
				type : "get", 
				url : "restaurant_order_takeover.do?rno="+ rno + "&ono="+ono,
				success : function(result) { 
					$(".content1").html(result);
				}
			})			
			
			message = {'ono' : randomItem(dest),
					   'rno' : 'A'}
			
			
			var message = new Paho.MQTT.Message(JSON.stringify(message));
			message.destinationName = "/ControlMoving/Order/TakeOver";
			message.qos = 0;
			client.send(message);
			console.log("보냄")
		}
		
		
		function DeliveryStart() {
			console.log("실행")
			var dest = new Array('B','C','D','E','F','H','I','J','K','M','N','P','S','T');
			/* $.ajax({
				type : "get", 
				url : "restaurant_order_takeover.do?rno="+ rno + "&ono="+ono,
				success : function(result) { 
					$(".content1").html(result);
				}
			}) */			
			
			message = {'ono' : randomItem(dest)}
			
			
			var message = new Paho.MQTT.Message(JSON.stringify(message));
			message.destinationName = "/ControlMoving/Order/DeliveryStart";
			message.qos = 0;
			client.send(message);
			console.log("보냄")
		}
		
		
		
		
	</script>
</head>
<body>
	<div class="navbar1">
		<div class="navbar2">
			<img class="zgiyo" src="${pageContext.request.contextPath}/resource/image/home/즈기요.png">
			<div class="restaurantNo">
				<div>등록번호</div>
				<div id="rno">${rno}</div>
			</div>
		</div>
	</div>
	
	<div class="navtab">
		<div class="navtab1" id='navtab1'>
			주문접수
		</div>
		<div class="navtab2" id='navtab2'>
			매장관리
		</div>
		<div class="navtab3" id='navtab3'>
			<a href="${pageContext.request.contextPath}/restaurant/restaurant_car_control.do">차량제어</a>
		</div>
	</div>
	
	<div class="main1">
		<div class="menu">
			<div class="menu1" id='menu1'>
				접수대기
			</div>
			<div class="menu2" id='menu2'>
				처리중
			</div>
			<div class="menu3" id='menu3'>
				완료
			</div>
			<div class="menu4" id='menu4'>
				주문조회
			</div>
		</div>
		
		<div class="content1" style="overflow: auto;">
		content1
		</div>
	</div>
	
	<div class="main2">
		<div class="menu">
			<div class="menu1" id='menu5'>
				메뉴 등록
			</div>
			<div class="menu2" id='menu6'>
				고객 관리
			</div>
			<div class="menu3" id='menu7'>
				광고 관리
			</div>
			<div class="menu4" id='menu8'>
				데이터 조회
			</div>
		</div>
		
		<div class="content2">
		content2
		</div>
	</div>

	<!-- FOOTER START ======================================== -->
	<div class="footermain1">
		<div class="footer1-1">
			<div class="footer1-2-1">이용약관</div>
			<div class="footer1-2-2">개인정보처리방침</div>
			<div class="footer1-2-3">회원등급정책</div>
			<div class="footer1-2-4">회사소개</div>
			<div class="footer1-2-5">즈기요사장님</div>
			<div class="footer1-2-6">입점문의</div>
			<div class="footer1-2-7">공지사항</div>

			<div class="foot1-2">
				<img class="footimg1" src="${pageContext.request.contextPath}/resource/image/home/footer/face.png">
				페이스북
			</div>
			<div class="foot1-3">
				<img class="footimg2" src="${pageContext.request.contextPath}/resource/image/home/footer/blog.png">
				블로그
			</div>
		</div>
	</div>

	<div class="footermain2">
		<img class="footimg3" src="${pageContext.request.contextPath}/resource/image/home/footer/footer.png">
	</div>
	<!-- FOOTER END ======================================== -->

</body>
<script src="${pageContext.request.contextPath}/resource/script/restaurant_main.js"></script>
<script>
	function registMenu() {
		var frno = ${rno}
	    var form = $('#menuReigister')[0];
	
	    // FormData 객체 생성
	    var formData = new FormData(form);
	
	    // 코드로 동적으로 데이터 추가 가능.
		formData.append("frno", frno);
	
	    $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "${pageContext.request.contextPath}/restaurant/restaurant_manage_menu.do",
	        data: formData,
	        processData: false,
	        contentType: false,
	        cache: false,
	        timeout: 600000,
	        success: function (result) {
	        	alert("메뉴가 성공적으로 등록되었습니다.");
	            $(".content2").html(result);
	        },
	        error: function (e) {
	            console.log("ERROR : ", e);
	        }
	    });
	}
</script>
</html>
