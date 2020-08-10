<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- SMS import -->
<%@ page import="sms.SMS" %>

<!DOCTYPE html>
<html>
<head>
    <title>차트 페이지</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resource/image/admin/관리자.png">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
    <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
    
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mainviewbox2css.css">

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
					<img class="ring2" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome3">
					<img class="btnHomeimg3" src="${pageContext.request.contextPath}/resource/image/admin/map.png">
					<div class="btnHometext3">Map</div>
				</div>

				<div class="btnHome9">
					<img class="btnHomeimg9" src="${pageContext.request.contextPath}/resource/image/admin/message1.png">
					<div class="btnHometext9">SMS</div>
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
			<!-- member + Restaurant data ==========================================-->
			<div class="viewbox2">
				<!-- 즈기요 성장 차트 ------------------------------------------------------>
				<figure class="highcharts-figure2">
				    <div id="container2"></div>
				</figure>


				<!-- 회원수 , 가게수 차트 + 바 ----------------------------------------------->
				<figure class="highcharts-figure1">
				    <div id="container1"></div>
				</figure>

				<div class="progress">
				    <div class="progress-bar progress-bar-info progress-bar-striped" id="onebarpersent" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="50"
				     style="width:50px;">7월 회원 목표량: ${pager.totalRows}%
<!-- 				      <div class="change_greeting1">100%</div> -->
<!--  					document.write(persenttotalmember) -->
				    </div>
			    </div>

				<div class="progress">
			    	<div class="progress-bar progress-bar-success progress-bar-striped" id="twobarpersent"  role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="50"
			    	style="width:50px;">7월 가게 목표량: ${pager1.totalRows1}%
<!-- 			      	  <div class="change_greeting2">100%</div> -->
			    	</div>
			    </div>


				<!-- 하이차트 2개 추가 필요!!! -->

			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
/* 회원 리스트 페이지 이동 Ajax */
$(".btnHome1").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox1_1.do";
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










//공동 사용 (현재 날짜)
var nowDate = new Date();

// 즈기요 회원 가입 오늘 날짜
var todaylist = ${TodayNolist};
// 즈기요 회원 가입 어제 날짜
var yester1list = ${Yesterday1Nolist};
// 즈기요 회원 가입 2일전 날짜
var yester2list = ${Yesterday2Nolist};
// 즈기요 회원 가입 3일전 날짜
var yester3list = ${Yesterday3Nolist};
// 즈기요 회원 가입 4일전 날짜
var yester4list = ${Yesterday4Nolist};
// 즈기요 회원 가입 5일전 날짜
var yester5list = ${Yesterday5Nolist};
// 즈기요 회원 가입 6일전 날짜
var yester6list = ${Yesterday6Nolist};
// 즈기요 회원 가입 7일전 날짜
var yester7list = ${Yesterday7Nolist};
// 즈기요 회원 가입 8일전 날짜
var yester8list = ${Yesterday8Nolist};
// 즈기요 회원 가입 9일전 날짜
var yester9list = ${Yesterday9Nolist};

//즈기요 가게 등록 오늘 날짜
var Rtodaylist = ${RTodayNolist};
// 즈기요 가게 등록 어제 날짜
var Ryester1list = ${RYesterday1Nolist};
// 즈기요 가게 등록 2일전 날짜
var Ryester2list = ${RYesterday2Nolist};
// 즈기요 가게 등록 3일전 날짜
var Ryester3list = ${RYesterday3Nolist};
// 즈기요 가게 등록 4일전 날짜
var Ryester4list = ${RYesterday4Nolist};
// 즈기요 가게 등록 5일전 날짜
var Ryester5list = ${RYesterday5Nolist};
// 즈기요 가게 등록 6일전 날짜
var Ryester6list = ${RYesterday6Nolist};
// 즈기요 가게 등록 7일전 날짜
var Ryester7list = ${RYesterday7Nolist};
// 즈기요 가게 등록 8일전 날짜
var Ryester8list = ${RYesterday8Nolist};
// 즈기요 가게 등록 9일전 날짜
var Ryester9list = ${RYesterday9Nolist};

//---------------------------------------------------------------------------
//오늘 날짜
var nowYear = nowDate.getFullYear();
var nowMonth = nowDate.getMonth() +1;
var nowDay = nowDate.getDate();

if(nowMonth < 10) { nowMonth = "0" + nowMonth; }
if(nowDay < 10) { nowDay = "0" + nowDay; }

//오늘 날짜 결과
var todayDate = nowMonth + "-" + nowDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//1일전 날짜
var yesterDate = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(yesterDate);

var yesterYear = nowDate.getFullYear();
var yesterMonth = nowDate.getMonth() +1;
var yesterDay = nowDate.getDate();

if(yesterMonth < 10) { yesterMonth = "0" + yesterMonth; }
if(yesterDay < 10) { yesterDay = "0" + yesterDay; }
//어제 날짜 결과
var yesterDate = yesterMonth + "-" + yesterDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//2일전 날짜
var twoyesterday = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(twoyesterday);

var twoyesterYear = nowDate.getFullYear();
var twoyesterMonth = nowDate.getMonth() +1;
var twoyesterDay = nowDate.getDate();

if(twoyesterMonth < 10) { twoyesterMonth = "0" + twoyesterMonth; }
if(twoyesterDay < 10) { twoyesterDay = "0" + twoyesterDay; }

var twoyesterDate = twoyesterMonth + "-" + twoyesterDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//3일전 날짜
var threeyesterday = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(threeyesterday);

var threeyesterYear = nowDate.getFullYear();
var threeyesterMonth = nowDate.getMonth() +1;
var threeyesterDay = nowDate.getDate();

if(threeyesterMonth < 10) { threeyesterMonth = "0" + threeyesterMonth; }
if(threeyesterDay < 10) { threeyesterDay = "0" + threeyesterDay; }

var threeyesterDate = threeyesterMonth + "-" + threeyesterDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//4일전 날짜
var fouryesterday = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(fouryesterday);

var fouryesterYear = nowDate.getFullYear();
var fouryesterMonth = nowDate.getMonth() +1;
var fouryesterDay = nowDate.getDate();

if(fouryesterMonth < 10) { fouryesterMonth = "0" + fouryesterMonth; }
if(fouryesterDay < 10) { fouryesterDay = "0" + fouryesterDay; }

var fouryesterDate = fouryesterMonth + "-" + fouryesterDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//5일전 날짜
var fiveyesterday = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(fiveyesterday);

var fiveyesterYear = nowDate.getFullYear();
var fiveyesterMonth = nowDate.getMonth() +1;
var fiveyesterDay = nowDate.getDate();

if(fiveyesterMonth < 10) { fiveyesterMonth = "0" + fiveyesterMonth; }
if(fiveyesterDay < 10) { fiveyesterDay = "0" + fiveyesterDay; }

var fiveyesterDate = fiveyesterMonth + "-" + fiveyesterDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//6일전 날짜
var sixyesterday = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(sixyesterday);

var sixyesterYear = nowDate.getFullYear();
var sixyesterMonth = nowDate.getMonth() +1;
var sixyesterDay = nowDate.getDate();

if(sixyesterMonth < 10) { sixyesterMonth = "0" + sixyesterMonth; }
if(sixyesterDay < 10) { sixyesterDay = "0" + sixyesterDay; }

var sixyesterDate = sixyesterMonth + "-" + sixyesterDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//7일전 날짜
var sevenyesterday = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(sevenyesterday);

var sevenyesterYear = nowDate.getFullYear();
var sevenyesterMonth = nowDate.getMonth() +1;
var sevenyesterDay = nowDate.getDate();

if(sevenyesterMonth < 10) { sevenyesterMonth = "0" + sevenyesterMonth; }
if(sevenyesterDay < 10) { sevenyesterDay = "0" + sevenyesterDay; }

var sevenyesterDate = sevenyesterMonth + "-" + sevenyesterDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//8일전 날짜
var eightyesterday = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(eightyesterday);

var eightyesterYear = nowDate.getFullYear();
var eightyesterMonth = nowDate.getMonth() +1;
var eightyesterDay = nowDate.getDate();

if(eightyesterMonth < 10) { eightyesterMonth = "0" + eightyesterMonth; }
if(eightyesterDay < 10) { eightyesterDay = "0" + eightyesterDay; }

var eightyesterDate = eightyesterMonth + "-" + eightyesterDay;// 연도는 길어서 제외

//---------------------------------------------------------------------------

//9일전 날짜
var nineyesterday = nowDate.getTime() - (1 * 24 * 60 * 60 * 1000);
nowDate.setTime(nineyesterday);

var nineyesterYear = nowDate.getFullYear();
var nineyesterMonth = nowDate.getMonth() +1;
var nineyesterDay = nowDate.getDate();

if(nineyesterMonth < 10) { nineyesterMonth = "0" + nineyesterMonth; }
if(nineyesterDay < 10) { nineyesterDay = "0" + nineyesterDay; }

var nineyesterDate = nineyesterMonth + "-" + nineyesterDay;// 연도는 길어서 제외

//[공용]day script end---------------------------------------------------------------

//viewbox2 script start---------------------------------------------------------------
/* 즈기요 성장량 계산 */
//멤버 성장률
var yes9 = yester9list*33.33;
var yes8 = yester8list*33.33;
var yes7 = yester7list*33.33;
var yes6 = yester6list*33.33;
var yes5 = yester5list*33.33;
var yes4 = yester4list*33.33;
var yes3 = yester3list*33.33;
var yes2 = yester2list*33.33;
var yes1 = yester1list*33.33;
var yes0 = todaylist*33.33;

//가게 성장률
var Ryes9 = Ryester9list*33.33;
var Ryes8 = Ryester8list*33.33;
var Ryes7 = Ryester7list*33.33;
var Ryes6 = Ryester6list*33.33;
var Ryes5 = Ryester5list*33.33;
var Ryes4 = Ryester4list*33.33;
var Ryes3 = Ryester3list*33.33;
var Ryes2 = Ryester2list*33.33;
var Ryes1 = Ryester1list*33.33;
var Ryes0 = Rtodaylist*33.33;

//멤버 , 가게 성장률 평균
var chart0 = (yes0 + Ryes0) / 2;
var chart1 = (yes1 + Ryes1) / 2;
var chart2 = (yes2 + Ryes2) / 2;
var chart3 = (yes3 + Ryes3) / 2;
var chart4 = (yes4 + Ryes4) / 2;
var chart5 = (yes5 + Ryes5) / 2;
var chart6 = (yes6 + Ryes6) / 2;
var chart7 = (yes7 + Ryes7) / 2;
var chart8 = (yes8 + Ryes8) / 2;
var chart9 = (yes9 + Ryes9) / 2;

//3분야 평균점[이동평균]
var realchart1 = (chart0 + chart1 + chart2) / 3
var realchart2 = (chart1 + chart2 + chart3) / 3
var realchart3 = (chart2 + chart3 + chart4) / 3
var realchart4 = (chart3 + chart4 + chart5) / 3
var realchart5 = (chart4 + chart5 + chart6) / 3
var realchart6 = (chart5 + chart6 + chart7) / 3
var realchart7 = (chart6 + chart7 + chart8) / 3
var realchart8 = (chart7 + chart8 + chart9) / 3

//소수점 반올림
chart9 = Math.round(chart9);
realchart8 = Math.round(realchart8);
realchart7 = Math.round(realchart7);
realchart6 = Math.round(realchart6);
realchart5 = Math.round(realchart5);
realchart4 = Math.round(realchart4);
realchart3 = Math.round(realchart3);
realchart2 = Math.round(realchart2);
realchart1 = Math.round(realchart1);
chart0 = Math.round(chart0);

//Progress bar ---------------------------------------------------------------------------
//최근 10일간 신규 회원 등록 수
var totalmembernum = ${TodayNolist} + ${Yesterday1Nolist} + ${Yesterday2Nolist} + ${Yesterday3Nolist} + ${Yesterday4Nolist}
+${Yesterday5Nolist} + ${Yesterday6Nolist} + ${Yesterday7Nolist} + ${Yesterday8Nolist} + ${Yesterday9Nolist};
var persenttotalmember = (totalmembernum / 100) * 100;
//회원 데이터 * px 값
var persentpx = persenttotalmember * 7.4;

$("#onebarpersent").css("width",String(persentpx));
$('.change_greeting1').text("7월 회원 목표량 : " + String(persenttotalmember) + "%");

//최근 10일간 신규 가게 등록 수
var Rtotalmembernum = ${RTodayNolist} + ${RYesterday1Nolist} + ${RYesterday2Nolist} + ${RYesterday3Nolist} + ${RYesterday4Nolist}
+${RYesterday5Nolist} + ${RYesterday6Nolist} + ${RYesterday7Nolist} + ${RYesterday8Nolist} + ${RYesterday9Nolist};
var Rpersenttotalmember = (Rtotalmembernum / 100) * 100;
//가게 데이터 * px 값
var Rpersentpx = Rpersenttotalmember * 7.4;

$("#twobarpersent").css("width",String(Rpersentpx));
$('.change_greeting2').text("7월 가게 목표량 : " + String(Rpersenttotalmember) + "%");


// 즈기요 성장 차트------------------------------------------------
Highcharts.chart('container2', {
    chart: {
        type: 'line'
    },
    title: {
        text: ''
    },
    subtitle: {
        text: '그룹 성장 현황'
    },
    xAxis: {
        categories: [nineyesterDate , eightyesterDate , sevenyesterDate , sixyesterDate , fiveyesterDate , fouryesterDate ,
     	   threeyesterDate , twoyesterDate , yesterDate , todayDate]
    },
    yAxis: {
        title: {
            text: '성장량 (1일 기준 : 100)'
        }
    },
    //hichart 하단 링크 제거
    credits: {
           enabled: false
       },

       //hichart 상단 메뉴 제거
    exporting: {
        enabled: false
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name: '성장량',
        data: [chart9, realchart8, realchart7, realchart6, realchart5, realchart4, realchart3, realchart2, realchart1, chart0]
    }, {
        name: '매출액',
        data: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
    }]
});


// 회원수 , 가게수 차트 + 바------------------------------------------------
Highcharts.chart('container1', {

   chart: {
     type: 'column',
     styledMode: true
   },
   subtitle: {
       text: '이용자 현황'
   },

   title: {
     text: ''
   },

   //추가 항목 (중요★★★★★)
    xAxis: {
       className: 'highcharts-color-5',
       categories: [nineyesterDate , eightyesterDate , sevenyesterDate , sixyesterDate , fiveyesterDate , fouryesterDate ,
    	   threeyesterDate , twoyesterDate , yesterDate , todayDate]
        },

   yAxis: [{
     className: 'highcharts-color-0',
     title: {
       text: '등록 회원 명단'
     }
   }, {
     className: 'highcharts-color-1',
     opposite: true,
     title: {
       text: '등록 가게 명단'
     }
   }],

   plotOptions: {
     column: {
       borderRadius: 5
     }
   },

   //hichart 하단 링크 제거
   credits: {
          enabled: false
      },

      //hichart 상단 메뉴 제거
   exporting: {
       enabled: false
   },

   series: [{
	 name: '회원 수',
     data: [yester9list, yester8list, yester7list, yester6list, yester5list, yester4list, yester3list, yester2list, yester1list, todaylist]
   }, {
	 name: '가게 수',
     data: [Ryester9list, Ryester8list, Ryester7list, Ryester6list, Ryester5list, Ryester4list, Ryester3list, Ryester2list, Ryester1list, Rtodaylist],
     yAxis: 1
   }]

 });

//viewbox2 script end---------------------------------------------------------------
</script>
</html>
