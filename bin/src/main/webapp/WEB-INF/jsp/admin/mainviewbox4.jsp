<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- SMS import -->
<%@ page import="sms.SMS" %>

<!DOCTYPE html>
<html>
<head>
    <title>문자 전송 페이지</title>
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

    <!-- css import -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mainviewbox4css.css">
</head>
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
					<img class="ring9" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome23">
					<img class="btnHomeimg23" src="${pageContext.request.contextPath}/resource/image/admin/map.png">
					<div class="btnHometext23">Chatting</div>
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
				</div>

				<div class="btnHome22">
					<img class="btnHomeimg22" src="${pageContext.request.contextPath}/resource/image/admin/data.png">
					<div class="btnHometext22">Data</div>
				</div>

			</div>
		</div>

		<!-- /* 뷰박스 bigbox */ ------------------------------------------------------------------------>
		<div class="viewmainbox">
			<!-- SMS Send Page =================================-->
			<div class="viewbox9">
				<a id="SMSrealpage" href="${pageContext.request.contextPath}/admin/index.do">[원본]SMS 보내기</a>

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

		</div>
	</div>

</body>
<script type="text/javascript">
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

/* 오토모드 페이지 이동 Ajax */
$(".btnHome21").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox5.do";
	var message = new Paho.MQTT.Message("AutoChg");
	message.destinationName = "/Frame/Auto";
	message.qos = 0;
	client.send(message);		
});

/* 수동 페이지 이동 Ajax */
$(".btnHome24").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox6.do";
	var message = new Paho.MQTT.Message("ManualChg");
	message.destinationName = "/Frame/Auto";
	message.qos = 0;
	client.send(message);		
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
