<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- SMS import -->
<%@ page import="sms.SMS" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/admin_maincss.css">
	
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
					<img class="ring1" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome2">
					<img class="btnHomeimg2" src="${pageContext.request.contextPath}/resource/image/admin/data.png">
					<div class="btnHometext2">Data</div>
					<img class="ring2" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome3">
					<img class="btnHomeimg3" src="${pageContext.request.contextPath}/resource/image/admin/map.png">
					<div class="btnHometext3">Map</div>
					<img class="ring3" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome9">
					<img class="btnHomeimg9" src="${pageContext.request.contextPath}/resource/image/admin/message1.png">
					<div class="btnHometext9">SMS</div>
					<img class="ring9" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
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
					<img class="ring7" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome22">
					<img class="btnHomeimg22" src="${pageContext.request.contextPath}/resource/image/admin/data.png">
					<div class="btnHometext22">Data</div>
					<img class="ring5" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome23">
					<img class="btnHomeimg23" src="${pageContext.request.contextPath}/resource/image/admin/map.png">
					<div class="btnHometext23">CCTV</div>
					<img class="ring6" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

			</div>
		</div>

		<!-- /* 뷰박스 bigbox */ ------------------------------------------------------------------------>
		<div class="viewmainbox">

			<!-- member + restaurant list ==========================================-->
			<div class="viewbox1">
				<!-- member list box -->
				<div class="w3-content" style="max-width:1000px; margin-top: 70px;">
					<div class="mySlides" id="mlistmain">
						<div class="mlist">
							<div class="mlistid">Id</div>
							<div class="mlistpw">Password</div>
							<div class="mlistname">Name</div>
							<div class="mlisttel">Tel</div>
							<div class="mlistadress">Adress</div>
							<div class="mlistdate">Join Date</div>
							<div class="mlistdelete">Unlock</div>

						</div>
						<div class="mlistbox">
							<!-- Customer Member List -->
							<table>
								<c:forEach var="cmember" items="${cmemberlist}">
									<tr class="mlistTR">
										<td class="mlistidTD">${cmember.mid}</td>
										<td class="mlistpwTD">${cmember.mpassword}</td>
										<td class="mlistnameTD">${cmember.mname}</td>
										<td class="mlisttelTD">${cmember.mtel}</td>
										<td class="mlistadressTD">${cmember.madress}</td>
										<td class="mlistdateTD">
											<fmt:formatDate value="${cmember.mdate}" pattern="yyyy년 MM월 dd일"/>
										</td>
										<td class="mlistdeleteTD"><div id="${cmember.mid}" class="btn btn-secondary btn-sm deleteX">X</div></td>
									</tr>
								</c:forEach>
							</table>
							<div class="pagenum1">현재 회원 가입자 수 : ${pager.totalRows}명</div>
							<input type="search" class="w3-button w3-white w3-border btn-sm search" placeholder="등록 회원 검색" />
							<button class="w3-button w3-white w3-border btn-sm" id="btnsearch">검색</button>
							<!-- 하단 페이져 -->
							<table class="pagepage1">
								<tr>
									<td colspan="6">
										<a class="w3-button demo  btn-sm" onclick="viewPaging(1)">처음</a>

										<c:if test="${pager.groupNo > 1}">
											<a class="w3-button demo  btn-sm" onclick="viewPaging('${pager.startPageNo-pager.pagesPergroup}')">이전</a>
										</c:if>

										<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
											<c:if test="${pager.pageNo != i}">
											<!-- 현재 페이지와 ${i}와 같다면 색을 변경 -->
												<a class="w3-button demo  btn-sm" onclick="viewPaging('${i}')"> ${i}</a>
											</c:if>

											<c:if test="${pager.pageNo == i}">
												<a class="w3-button demo  btn-sm" onclick="viewPaging('${i}')"> ${i}</a>
											</c:if>
										</c:forEach>

										<c:if test="${pager.groupNo < pager.totalGroupNo}">
											<a class="w3-button demo  btn-sm" onclick="viewPaging('${pager.endPageNo+1}')">다음</a>
										</c:if>
										<a class="w3-button demo  btn-sm" onclick="viewPaging('${pager.totalPageNo}')">맨끝</a>
									</td>
								</tr>
							</table>
						</div>

					</div>
					<!-- 레스토랑 테이블 -->
					<div class="mySlides" id="rlistmain">
						<div class="rlist">
							<div class="rlistid">Id</div>
							<div class="rlistpw">Title</div>
							<div class="rlistname">Name</div>
							<div class="rlisttel">Tel</div>
							<div class="rlistadress">Adress</div>
							<div class="rlisttitle">Date</div>
							<div class="rlistcategory">Category</div>
							<div class="rlistdelete">Unlock</div>

						</div>
						<div class="rlistbox">
							<!-- Customer Member List -->
							<table>
								<c:forEach var="rmember" items="${rmemberlist}">
									<tr class="rlistTR">
										<td class="rlistidTD">${rmember.rid}</td>
										<td class="rlistpwTD">${rmember.rtitle}</td>
										<td class="rlistnameTD">${rmember.rname}</td>
										<td class="rlisttelTD">${rmember.rtel}</td>
										<td class="rlistadressTD">${rmember.radress}</td>
										<td class="rlisttitleTD">
											<fmt:formatDate value="${rmember.rdate}" pattern="yyyy년 MM월 dd일"/>
										</td>
										<td class="rlistcategoryTD">${rmember.rcategory}</td>
										<td class="rlistdeleteTD"><div id="${rmember.rid}" class="btn btn-secondary btn-sm deleteX2">X</div></td>
									</tr>
								</c:forEach>
							</table>
							<input type="search" class="w3-button w3-white w3-border btn-sm search" placeholder="등록 가게 검색" />
							<button class="w3-button w3-white w3-border btn-sm" id="btnsearch">검색</button>
							<div class="pagenum2">현재 등록 가게 수 : ${pager1.totalRows1}명</div>
							<!-- 하단 페이져 -->
							<table class="pagepage2">
								<tr>
									<td colspan="6">
										<a class="w3-button demo  btn-sm" onclick="viewPaging1(1)">처음</a>

										<c:if test="${pager1.groupNo1 > 1}">
											<a class="w3-button demo  btn-sm" onclick="viewPaging1('${pager1.startPageNo1-pager1.pagesPergroup1}')">이전</a>
											<!-- <<=6~10 이전으로 가려면 -5(즉pagesPerGroup =5)를 빼준다   -->
										</c:if>

										<c:forEach var="k" begin="${pager1.startPageNo1}" end="${pager1.endPageNo1}">
											<c:if test="${pager1.pageNo1 != k}">
											<!-- 현재 페이지와 ${i}와 같다면 색을 변경 -->
												<a class="w3-button demo  btn-sm" onclick="viewPaging1('${k}')"> ${k}</a>
											</c:if>

											<c:if test="${pager1.pageNo1 == k}">
												<a class="w3-button demo  btn-sm" onclick="viewPaging1('${k}')"> ${k}</a>
											</c:if>
										</c:forEach>

										<c:if test="${pager1.groupNo1 < pager1.totalGroupNo1}">
											<a class="w3-button demo  btn-sm" onclick="viewPaging1('${pager1.endPageNo1+1}')">다음</a>
										</c:if>
										<a class="w3-button demo  btn-sm" onclick="viewPaging1('${pager1.totalPageNo1}')">맨끝</a>
									</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="mySlides" id="alistmain">
						<div class="alist"></div>
					</div>
				</div>

				<div class="w3-center">
				   <div class="w3-section">
				     <button class="w3-button w3-light-grey" onclick="plusDivs(-1)">이전</button>
				     <button class="w3-button w3-light-grey" onclick="plusDivs(1)">다음</button>
				   </div>
				   <button class="w3-button demo1" onclick="currentDiv(1)">등록 회원</button>
				   <button class="w3-button demo1" onclick="currentDiv(2)">등록 가게</button>
				   <button class="w3-button demo1" onclick="currentDiv(3)">가게 등록 신청</button>
				</div>

				<!-- 공용 삭제 시 비밀번호 확인 창 -->
			 	<div class="opacitybox2">
				</div>
				<!-- 1 -->
				<div class="checkdelete1">
					<div class="fonttext1">비밀번호 입력Ⅰ</div>
					<div class="closedelete">x</div>
					<input type="text" class="delectcheck" name="delectcheck">
					<div class="btn btn-danger btn-sm gogogo">확인</div>
				</div>
				<!-- 2 -->
				<div class="checkdelete2">
					<div class="fonttext2">비밀번호 입력Ⅱ</div>
					<div class="closedelete2">x</div>
					<input type="text" class="delectcheck2" name="delectcheck2">
					<div class="btn btn-danger btn-sm gogogo2">확인</div>
				</div>

			</div>
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
                  		<input type="checkbox" id="modal" class="hidden">
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

			<script type="text/javascript">
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
			</script>

			<!-- member + device + instrument data =================================-->
			<div class="viewbox5">
				22222222222222222222
			</div>

			<!-- member + device + instrument map =================================-->
			<div class="viewbox6"> <!-- 1685 * 937 -->
				33333333333333333333
			</div>
			<!-- device controller =================================-->
			<div class="viewbox7"> <!-- 1685 * 937 -->
				<!-- MQTT -->
				<img id="cameraView2">
				<div class="viewbox7databox">
				
				</div>
				
				<div class="positionbox">
                      <img class="positionbox2" src="${pageContext.request.contextPath}/resource/image/admin/minimap.png">
                      <div class="positionbox4"></div>
				</div>
				
				
				
				
				
				
				
				<!-- Controller box -->
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
//[공용]manu script start---------------------------------------------------------------
//로딩 이미지
$(".ring1").hide();
$(".ring2").hide();
$(".ring3").hide();
$(".ring4").hide();
$(".ring5").hide();
$(".ring6").hide();
$(".ring7").hide();
$(".ring9").hide();
//뷰 박스
$(".viewbox1").show();
$(".viewbox2").hide();
$(".viewbox3").hide();
$(".viewbox4").hide();
$(".viewbox5").hide();
$(".viewbox6").hide();
$(".viewbox7").hide();
$(".viewbox9").hide();
$(document).ready(function(){

		//<!-- /* Group1 */ -->
		var check1 = 0;
		$(".btnHome1").click( function() {
			if(check1 == 0){
				$(".btnHome1").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome1").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome1").css("border-right","7px solid #1ABB9C");
				$(".ring1").show();
				$(".viewbox1").show();
				check1 = 1;

				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				$(".ring2").hide();
				$(".viewbox2").hide();
				check2 = 0;
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				$(".viewbox3").hide();
				check3 = 0;
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
				$(".ring4").hide();
				$(".viewbox4").hide();
				check4 = 0;
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				$(".ring5").hide();
				$(".viewbox5").hide();
				check5 = 0;
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");
				$(".ring6").hide();
				$(".viewbox6").hide();
				check6 = 0;
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");
				$(".ring9").hide();
				$(".viewbox9").hide();
				check9 = 0;
				$(".btnHome24").css("background-color","");
				$(".btnHome24").css("box-shadow","");
				$(".btnHome24").css("border-right","");
				$(".ring7").hide();
				$(".viewbox7").hide();
				check7 = 0;

			}else if(check1 == 1){
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");
				$(".ring1").hide();
				check1 = 0;
			};
		});

		var check2 = 0;
		$(".btnHome2").click( function() {
			if(check2 == 0){
				$(".btnHome2").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome2").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome2").css("border-right","7px solid #1ABB9C");
				$(".ring2").show();
				$(".viewbox2").show();
				check2 = 1;

				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");
				$(".ring1").hide();
				$(".viewbox1").hide();
				check1 = 0;
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				$(".viewbox3").hide();
				check3 = 0;
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
				$(".ring4").hide();
				$(".viewbox4").hide();
				check4 = 0;
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				$(".ring5").hide();
				$(".viewbox5").hide();
				check5 = 0;
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");
				$(".ring6").hide();
				$(".viewbox6").hide();
				check6 = 0;
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");
				$(".ring9").hide();
				$(".viewbox9").hide();
				check9 = 0;
				$(".btnHome24").css("background-color","");
				$(".btnHome24").css("box-shadow","");
				$(".btnHome24").css("border-right","");
				$(".ring7").hide();
				$(".viewbox7").hide();
				check7 = 0;

			}else if(check2 == 1){
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				$(".ring2").hide();
				check2 = 0;
			};
		});

		var check3 = 0;
		$(".btnHome3").click( function() {
			if(check3 == 0){
				$(".btnHome3").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome3").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome3").css("border-right","7px solid #1ABB9C");
				$(".ring3").show();
				$(".viewbox3").show();
				$(".viewbox0").hide();
				check3 = 1;

				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");
				$(".ring1").hide();
				$(".viewbox1").hide();
				check1 = 0;
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				$(".ring2").hide();
				$(".viewbox2").hide();
				check2 = 0;
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
				$(".ring4").hide();
				$(".viewbox4").hide();
				check4 = 0;
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				$(".ring5").hide();
				$(".viewbox5").hide();
				check5 = 0;
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");
				$(".ring6").hide();
				$(".viewbox6").hide();
				check6 = 0;
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");
				$(".ring9").hide();
				$(".viewbox9").hide();
				check9 = 0;
				$(".btnHome24").css("background-color","");
				$(".btnHome24").css("box-shadow","");
				$(".btnHome24").css("border-right","");
				$(".ring7").hide();
				$(".viewbox7").hide();
				check7 = 0;

			}else if(check3 == 1){
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				check3 = 0;
			};
		});

		var check9 = 0;
		$(".btnHome9").click( function() {
			if(check9 == 0){
				$(".btnHome9").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome9").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome9").css("border-right","7px solid #1ABB9C");
				$(".ring9").show();
				$(".viewbox9").show();
				check9 = 1;

				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");
				$(".ring1").hide();
				$(".viewbox1").hide();
				check1 = 0;
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				$(".ring2").hide();
				$(".viewbox2").hide();
				check2 = 0;
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				$(".viewbox3").hide();
				check3 = 0;
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
				$(".ring4").hide();
				$(".viewbox4").hide();
				check4 = 0;
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				$(".ring5").hide();
				$(".viewbox5").hide();
				check5 = 0;
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");
				$(".ring6").hide();
				$(".viewbox6").hide();
				check6 = 0;
				$(".btnHome24").css("background-color","");
				$(".btnHome24").css("box-shadow","");
				$(".btnHome24").css("border-right","");
				$(".ring7").hide();
				$(".viewbox7").hide();
				check7 = 0;

			}else if(check9 == 1){
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");
				$(".ring9").hide();
				check9 = 0;
			};
		});

		//<!-- /* Group2 */ -->
		var check4 = 0;
		$(".btnHome21").click( function() {
			if(check4 == 0){
				$(".btnHome21").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome21").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome21").css("border-right","7px solid #1ABB9C");
				$(".ring4").show();
				$(".viewbox4").show();
				$(".viewbox0").hide();
				check4 = 1;
				/* others */
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");
				$(".ring1").hide();
				$(".viewbox1").hide();
				check1 = 0;
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				$(".ring2").hide();
				$(".viewbox2").hide();
				check2 = 0;
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				$(".viewbox3").hide();
				check3 = 0;
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				$(".ring5").hide();
				$(".viewbox5").hide();
				check5 = 0;
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");
				$(".ring6").hide();
				$(".viewbox6").hide();
				check6 = 0;
				$(".btnHome24").css("background-color","");
				$(".btnHome24").css("box-shadow","");
				$(".btnHome24").css("border-right","");
				$(".ring7").hide();
				$(".viewbox7").hide();
				check7 = 0;
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");
				$(".ring9").hide();
				$(".viewbox9").hide();
				check9 = 0;

			}else if(check4 == 1){
				$(".btnHome4").css("background-color","");
				$(".btnHome4").css("box-shadow","");
				$(".btnHome4").css("border-right","");
				$(".ring4").hide();
				check4 = 0;
			};
		});

		var check5 = 0;
		$(".btnHome22").click( function() {
			if(check5 == 0){
				$(".btnHome22").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome22").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome22").css("border-right","7px solid #1ABB9C");
				$(".ring5").show();
				$(".viewbox5").show();
				$(".viewbox0").hide();
				check5 = 1;
				/* others */
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");
				$(".ring1").hide();
				$(".viewbox1").hide();
				check1 = 0;
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				$(".ring2").hide();
				$(".viewbox2").hide();
				check2 = 0;
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				$(".viewbox3").hide();
				check3 = 0;
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
				$(".ring4").hide();
				$(".viewbox4").hide();
				check4 = 0;
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");
				$(".ring6").hide();
				$(".viewbox6").hide();
				check6 = 0;
				$(".btnHome24").css("background-color","");
				$(".btnHome24").css("box-shadow","");
				$(".btnHome24").css("border-right","");
				$(".ring7").hide();
				$(".viewbox7").hide();
				check7 = 0;
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");
				$(".ring9").hide();
				$(".viewbox9").hide();
				check9 = 0;

			}else if(check5 == 1){
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				$(".ring5").hide();
				check5 = 0;
			};
		});

		var check6 = 0;
		$(".btnHome23").click( function() {
			if(check6 == 0){
				$(".btnHome23").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome23").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome23").css("border-right","7px solid #1ABB9C");
				$(".ring6").show();
				$(".viewbox6").show();
				$(".viewbox0").hide();
				check6 = 1;
				/* others */
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");
				$(".ring1").hide();
				$(".viewbox1").hide();
				check1 = 0;
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				$(".ring2").hide();
				$(".viewbox2").hide();
				check2 = 0;
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				$(".viewbox3").hide();
				check3 = 0;
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
				$(".ring4").hide();
				$(".viewbox4").hide();
				check4 = 0;
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				$(".ring5").hide();
				$(".viewbox5").hide();
				check5 = 0;
				$(".btnHome24").css("background-color","");
				$(".btnHome24").css("box-shadow","");
				$(".btnHome24").css("border-right","");
				$(".ring7").hide();
				$(".viewbox7").hide();
				check7 = 0;
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");
				$(".ring9").hide();
				$(".viewbox9").hide();
				check9 = 0;

			}else if(check6 == 1){
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");
				$(".ring6").hide();
				check6 = 0;
			};
		});

		var check7 = 0;
		$(".btnHome24").click( function() {
			if(check7 == 0){
				$(".btnHome24").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome24").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome24").css("border-right","7px solid #1ABB9C");
				$(".ring7").show();
				$(".viewbox7").show();
				$(".viewbox0").hide();
				check7 = 1;
				/* others */
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");
				$(".ring1").hide();
				$(".viewbox1").hide();
				check1 = 0;
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				$(".ring2").hide();
				$(".viewbox2").hide();
				check2 = 0;
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				$(".viewbox3").hide();
				check3 = 0;
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
				$(".ring4").hide();
				$(".viewbox4").hide();
				check4 = 0;
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				$(".ring5").hide();
				$(".viewbox5").hide();
				check5 = 0;
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");
				$(".ring6").hide();
				$(".viewbox6").hide();
				check6 = 0;
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");
				$(".ring9").hide();
				$(".viewbox9").hide();
				check9 = 0;

			}else if(check7 == 1){
				$(".btnHome24").css("background-color","");
				$(".btnHome24").css("box-shadow","");
				$(".btnHome24").css("border-right","");
				$(".ring7").hide();
				check7 = 0;
			};
		});



});
//[공용]manu script end---------------------------------------------------------------


//[공용]day script end---------------------------------------------------------------
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


//viewbox1 script start---------------------------------------------------------------
  /* 페이져 */
  function viewPaging(pageNo) {
     var pageNo = pageNo;
     $.ajax({
        type : "get", // get방식으로 자료를 전달
        url : "${pageContext.request.contextPath}/admin/main.do?pageNo=" +pageNo,
        success : function(result) { // 자료를 보내는것이 성공했을때 출력되는 메시지
           // 댓글목록을 실행한 결과를 가져온다.
           $("#adminmainpage").html(result);
            console.log(pageNo);
            console.log("고고고1");
        }
     });
  };

  /* 페이져1 */
  function viewPaging1(pageNo1) {
     var pageNo1 = pageNo1;
     $.ajax({
        type : "get", // get방식으로 자료를 전달
        url : "${pageContext.request.contextPath}/admin/main.do?pageNo1=" +pageNo1,
        success : function(result) { // 자료를 보내는것이 성공했을때 출력되는 메시지
           // 댓글목록을 실행한 결과를 가져온다.
           $("#adminmainpage").html(result);
			console.log(pageNo1);
            console.log("고고고2");
        }
     });
  };
//location.href = "${pageContext.request.contextPath}/admin/main.do?pageNo=" +pageNo;

//명단 삭제 취소 버튼------------------------------------------
$(".closedelete").click(function(){
	$(".checkdelete1").hide();
	$(".opacitybox2").hide();
});

//명단 삭제 시 확인 뷰------------------------------------------
$(".checkdelete1").hide();
$(".opacitybox2").hide();
var delectcheck = $("input[name=delectcheck]").val();

$(".deleteX").click(function(){
	var mid =  $(this).attr("id");

	$(".checkdelete1").show();
	$(".opacitybox2").show();

	$(".gogogo").click(function(){
		delectcheck = $("input[name=delectcheck]").val();
		if(delectcheck == "admin1"){
			alert("등록 회원 제명 완료");
			$(".checkdelete1").hide();
			$(".opacitybox2").hide();
			location.href = "${pageContext.request.contextPath}/admin/cmemberdelete.do?mid=" + mid;

		}else{
			alert("등록 회원 제명 실패");
			$(".checkdelete1").hide();
			$(".opacitybox2").hide();
		}//else

	});
});

//명단 삭제 취소 버튼------------------------------------------
$(".closedelete2").click(function(){
	$(".checkdelete2").hide();
	$(".opacitybox2").hide();
});

//명단 삭제 시 확인 뷰------------------------------------------
$(".checkdelete2").hide();
$(".opacitybox2").hide();
var delectcheck2 = $("input[name=delectcheck2]").val();

$(".deleteX2").click(function(){
	var rid =  $(this).attr("id");

	$(".checkdelete2").show();
	$(".opacitybox2").show();

	$(".gogogo2").click(function(){
		delectcheck2 = $("input[name=delectcheck2]").val();

		if(delectcheck2 == "admin2"){
			alert("등록 가게 제명 완료");
			$(".checkdelete2").hide();
			$(".opacitybox2").hide();
			location.href = "${pageContext.request.contextPath}/admin/rmemberdelete.do?rid=" + rid;

		}else{
			alert("등록 가게 제명 실패");
			$(".checkdelete2").hide();
			$(".opacitybox2").hide();
		}//else

	});
});

//슬라이드 script
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo1");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-red", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-red";
}

//viewbox1 script end---------------------------------------------------------------

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


//viewbox7 script start---------------------------------------------------------------


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



</script>
</html>
