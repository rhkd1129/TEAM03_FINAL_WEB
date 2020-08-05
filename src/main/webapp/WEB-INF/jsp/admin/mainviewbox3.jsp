<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- SMS import -->
<%@ page import="sms.SMS" %>

<!DOCTYPE html>
<html>
<head>
    <title>지도 페이지</title>
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

    <!-- css import -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mainviewbox3css.css">
	
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
					<img class="ring3" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
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
			<!-- member + Restaurant map ===========================================-->
			<div class="viewbox3">
				<!-- 좌측 상단 곡선 도로 -->
				<img class="range1" src="${pageContext.request.contextPath}/resource/image/admin/곡선완성.png">
				<!-- 상단 직선 도로 (상부) -->
				<div class="jumpline"></div><div class="line1-3"></div><div class="jumpline"></div>
				<div class="line1-4"></div><div class="jumpline"></div><div class="line1-5"></div><div class="jumpline"></div><div class="line1-6"></div><div class="jumpline"></div>
				<div class="line1-7"></div><div class="jumpline"></div><div class="line1-8"></div><div class="jumpline"></div><div class="line1-9"></div><div class="jumpline"></div>
				<div class="line1-10"></div><div class="jumpline"></div><div class="line1-11"></div><div class="jumpline"></div><div class="line1-12"></div><div class="jumpline"></div>
				<div class="line1-13"></div>
				<!-- 우측 상단 곡선 도로 -->
				<img class="range2" src="${pageContext.request.contextPath}/resource/image/admin/곡선완성.png">
				<!-- 상단 직선 도로 (하부) -->
				<div class="jumpline2"></div><div class="line2-3"></div><div class="jumpline2"></div>
				<div class="line2-4"></div><div class="jumpline2"></div><div class="line2-5"></div><div class="jumpline2"></div><div class="line2-6"></div><div class="jumpline2"></div>
				<div class="line2-7"></div><div class="jumpline2"></div><div class="line2-8"></div><div class="jumpline2"></div><div class="line2-9"></div><div class="jumpline2"></div>
				<div class="line2-10"></div><div class="jumpline2"></div><div class="line2-11"></div><div class="jumpline2"></div><div class="line2-12"></div><div class="jumpline2"></div>
				<div class="line2-13"></div>
				<!-- 좌측 직선 도로  -->
				<div class="bigleftline">
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
				</div>

				<!-- 차트 페이지  -->
				<div class="centerchartpage1">
					<div class="btn-danger btn-sm" id="CslideUp">▲</div>
					<div class="btn-danger btn-sm" id="CslideDown">▼</div>
					<div class="centerchartpageMAIN">





					</div>
				</div>

				<!-- 좌측 하단 곡선 도로 -->
				<img class="range3" src="${pageContext.request.contextPath}/resource/image/admin/곡선완성.png">
				<!-- 좌측 직선 도로 -->
				<div class="bigrightline">
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
					<div class="leftline3"></div><div class="leftline4"></div>
					<div class="jumpline3"></div><div class="jumpline4"></div>
				</div>
				<!-- 하단 우측 곡선 도로 -->
				<img class="range4" src="${pageContext.request.contextPath}/resource/image/admin/곡선완성.png">
				<!-- 하단 직선 도로 (상부) -->
				<div class="jumpline"></div><div class="line1-3"></div><div class="jumpline"></div>
				<div class="line1-4"></div><div class="jumpline"></div><div class="line1-5"></div><div class="jumpline"></div><div class="line1-6"></div><div class="jumpline"></div>
				<div class="line1-7"></div><div class="jumpline"></div><div class="line1-8"></div><div class="jumpline"></div><div class="line1-9"></div><div class="jumpline"></div>
				<div class="line1-10"></div><div class="jumpline"></div><div class="line1-11"></div><div class="jumpline"></div><div class="line1-12"></div><div class="jumpline"></div>
				<div class="line1-13"></div>
				<!-- 하단 직선 도로 (하부) -->
				<div class="Sjumpline2"></div><div class="line2-3"></div><div class="jumpline2"></div>
				<div class="line2-4"></div><div class="jumpline2"></div><div class="line2-5"></div><div class="jumpline2"></div><div class="line2-6"></div><div class="jumpline2"></div>
				<div class="line2-7"></div><div class="jumpline2"></div><div class="line2-8"></div><div class="jumpline2"></div><div class="line2-9"></div><div class="jumpline2"></div>
				<div class="line2-10"></div><div class="jumpline2"></div><div class="line2-11"></div><div class="jumpline2"></div><div class="line2-12"></div><div class="jumpline2"></div>
				<div class="line2-13"></div>
				<!-- 인차선 곡선 도로 (동서남북) -->
				<img class="insideimageline1" src="${pageContext.request.contextPath}/resource/image/admin/곡선완성S.png">
				<img class="insideimageline2" src="${pageContext.request.contextPath}/resource/image/admin/곡선완성S.png">
				<img class="insideimageline3" src="${pageContext.request.contextPath}/resource/image/admin/곡선완성S.png">
				<img class="insideimageline4" src="${pageContext.request.contextPath}/resource/image/admin/곡선완성S.png">

				<!-- 곡선 차선 (중앙차선) -->
				<img class="insideimageline5" src="${pageContext.request.contextPath}/resource/image/admin/곡선.png">
				<img class="insideimageline6" src="${pageContext.request.contextPath}/resource/image/admin/곡선.png">
				<img class="insideimageline7" src="${pageContext.request.contextPath}/resource/image/admin/곡선.png">
				<img class="insideimageline8" src="${pageContext.request.contextPath}/resource/image/admin/곡선.png">

				<!-- 짤짤이 제거 (인차선 곡선 도로 인해 생긴 노란픽셀 제거) -->
				<div class="deleteyellowline1"></div>
				<div class="deleteyellowline2"></div>
				<div class="deleteyellowline3"></div>
				<div class="deleteyellowline4"></div>

				<!-- 출발선 박스 -->

				<div class="startpatternbox"></div>

				<!-- 예시 이미지들 -->
				<img class="traficimg1" src="${pageContext.request.contextPath}/resource/image/trafic/빨강차.png">
				<img class="traficimg2" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg3" src="${pageContext.request.contextPath}/resource/image/trafic/하양차.png">

				<!-- 신호등 -->
				<div class="traficlightbox"></div>
				<div class="traficlightbox2"></div>
				<img class="traficimg4" src="${pageContext.request.contextPath}/resource/image/trafic/신호등.png">

				<!-- 횡단보도  -->
				<div class="crosswalkbox">
					<div class="crosswalk0"></div>
					<div class="crosswalk1"></div>
					<div class="crosswalk0"></div>
					<div class="crosswalk2"></div>
					<div class="crosswalk0"></div>
					<div class="crosswalk3"></div>
					<div class="crosswalk0"></div>
					<div class="crosswalk4"></div>
					<div class="crosswalk0"></div>
					<div class="crosswalk5"></div>
					<div class="crosswalk0"></div>
					<div class="crosswalk6"></div>
					<div class="crosswalk0"></div>
					<div class="crosswalk7"></div>
					<div class="crosswalk0"></div>
				</div>

				<!-- 급커브 (좌상, 우상, 좌하, 우하)  -->
				<img class="traficimg5" src="${pageContext.request.contextPath}/resource/image/trafic/급커브.png">
				<img class="traficimg6" src="${pageContext.request.contextPath}/resource/image/trafic/급커브.png">
				<img class="traficimg7" src="${pageContext.request.contextPath}/resource/image/trafic/급커브.png">
				<img class="traficimg8" src="${pageContext.request.contextPath}/resource/image/trafic/급커브.png">

				<!-- 배달 도착 지점 (집)  -->
				<div class="homefrontyard"></div>
				<img class="traficimg9" src="${pageContext.request.contextPath}/resource/image/trafic/집.png">
				<img class="fa" src="${pageContext.request.contextPath}/resource/image/admin/ping.png">


				<!-- 차량 에니메이션 실험  -->
				<img class="traficimg2" id="traficimg2" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">

				<img class="traficimg2-1" id="traficimg2-1" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-2" id="traficimg2-2" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-3" id="traficimg2-3" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-4" id="traficimg2-4" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-5" id="traficimg2-5" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-6" id="traficimg2-6" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-7" id="traficimg2-7" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-8" id="traficimg2-8" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-9" id="traficimg2-9" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-10" id="traficimg2-10" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-11" id="traficimg2-11" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-12" id="traficimg2-12" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">
				<img class="traficimg2-13" id="traficimg2-13" src="${pageContext.request.contextPath}/resource/image/trafic/초록차.png">

				<script type="text/javascript">
				//직선으로 좌로가기 (상부)
				$(document).ready(function(){
					  $('.traficimg2').click(function(){
					      $(this).css('-webkit-animation-name','iteration-count');
					      self.setTimeout("hideDiv()",7000);//차량 숨기기

					      self.setTimeout("gocarfunction()",7000);//좌회전

					  });
					});
				function hideDiv(){
					  document.getElementById("traficimg2").style.display="none";
					}


				//직선으로 내려가기 (좌부)
				$(document).ready(function(){
					$('.traficimg2-12').click(function(){
					      $(this).css('-webkit-animation-name','iteration-count2');
					      self.setTimeout("hideDiv21()",3000);//차량 숨기기
						});
					});
				function hideDiv21(){
					  document.getElementById("traficimg2-12").style.display="none";
					};


				$(document).ready(function(){
					$(".centerchartpageMAIN").hide();
					  $("#CslideUp").click(function(){
					    $(".centerchartpageMAIN").slideUp();
					    console.log("slideUp");
					  });
					  $("#CslideDown").click(function(){
					    $(".centerchartpageMAIN").slideDown();
					    console.log("slideDown");
					  });
					});



				</script>
			</div>

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

		</div>
	</div>
</body>
<script type="text/javascript">
$(".viewbox9").hide();

/* 리스트 페이지 이동 Ajax */
$(".btnHome1").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox1_1.do";
});

/* 회원 차트 페이지 이동 Ajax */
$(".btnHome2").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox2.do";
});

/* 문자 페이지 이동 Ajax */
$(".btnHome9").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox4.do";
});

/* 오토모드 페이지 이동 Ajax */
$(".btnHome21").click(function(){
	location.href = "${pageContext.request.contextPath}/admin/mainviewbox5.do";
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








//viewbox3 script start---------------------------------------------------------------
$(".traficimg2-1").hide();
$(".traficimg2-2").hide();
$(".traficimg2-3").hide();
$(".traficimg2-4").hide();
$(".traficimg2-5").hide();
$(".traficimg2-6").hide();
$(".traficimg2-7").hide();
$(".traficimg2-8").hide();
$(".traficimg2-9").hide();
$(".traficimg2-10").hide();
$(".traficimg2-11").hide();
$(".traficimg2-12").show();
$(".traficimg2-13").hide();

function gocarfunction(){
	stime = setTimeout(time1, 100);
	function time1(){
		$(".traficimg2-2").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-1").hide();
	   setTimeout(time2, 100);
	}

	function time2(){
		$(".traficimg2-3").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-2").hide();
	   setTimeout(time3, 100);
	}

	function time3(){
		$(".traficimg2-4").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-3").hide();
	   setTimeout(time4, 100);
	}

	function time4(){
		$(".traficimg2-5").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-4").hide();
	   setTimeout(time5, 100);
	}

	function time5(){
		$(".traficimg2-6").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-5").hide();
	   setTimeout(time6, 100);
	}

	function time6(){
		$(".traficimg2-7").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-6").hide();
	   setTimeout(time7, 100);
	}

	function time7(){
		$(".traficimg2-8").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-7").hide();
	   setTimeout(time8, 100);
	}

	function time8(){
		$(".traficimg2-9").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-8").hide();
	   setTimeout(time9, 100);
	}

	function time9(){
		$(".traficimg2-10").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-9").hide();
	   setTimeout(time10, 100);
	}

	function time10(){
		$(".traficimg2-11").show();
		$(".traficimg2-").css("", "");
		$(".traficimg2-").css("", "");

		$(".traficimg2-10").hide();
	   setTimeout(time11, 100);
	}
};
//viewbox3 script end---------------------------------------------------------------
</script>
</html>
