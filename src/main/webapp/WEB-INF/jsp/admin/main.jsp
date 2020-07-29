<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- SMS import -->
<%@ page import="sms.SMS" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
    <meta charset="UTF-8">

    <!-- SMS import 1 (필요x?) -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
    <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>

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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mapcss.css">
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
<body style="overflow: hidden;" id="adminmainpage" class="nav-md">
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
					<img class="btnHomeimg21" src="${pageContext.request.contextPath}/resource/image/admin/list1.png">
					<div class="btnHometext21">List</div>
					<img class="ring4" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome22">
					<img class="btnHomeimg22" src="${pageContext.request.contextPath}/resource/image/admin/data.png">
					<div class="btnHometext22">Data</div>
					<img class="ring5" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
				</div>

				<div class="btnHome23">
					<img class="btnHomeimg23" src="${pageContext.request.contextPath}/resource/image/admin/map.png">
					<div class="btnHometext23">Map</div>
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
				    <div class="progress-bar progress-bar-info progress-bar-striped" id="onebarpersent" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
				     style="width:50px;">7월 회원 목표량: ${pager.totalRows}%
<!-- 				      <div class="change_greeting1">100%</div> -->
<!--  					document.write(persenttotalmember) -->
				    </div>
			    </div>

				<div class="progress">
			    	<div class="progress-bar progress-bar-success progress-bar-striped" id="twobarpersent"  role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
			    	style="width:50px;">7월 가게 목표량: ${pager1.totalRows1}%
<!-- 			      	  <div class="change_greeting2">100%</div> -->
			    	</div>
			    </div>


























			</div>
			<!-- member + Restaurant map ===========================================-->
			<div class="viewbox3">

				<div class="line1-1"></div><div class="jumpline"></div><div class="line1-2"></div><div class="jumpline"></div><div class="line1-3"></div><div class="jumpline"></div>
				<div class="line1-4"></div><div class="jumpline"></div><div class="line1-5"></div><div class="jumpline"></div><div class="line1-6"></div><div class="jumpline"></div>
				<div class="line1-7"></div><div class="jumpline"></div><div class="line1-8"></div><div class="jumpline"></div><div class="line1-9"></div><div class="jumpline"></div>
				<div class="line1-10"></div><div class="jumpline"></div><div class="line1-11"></div><div class="jumpline"></div><div class="line1-12"></div><div class="jumpline"></div>
				<div class="line1-13"></div><div class="jumpline"></div><div class="line1-14"></div>
				<div class="extrack1"></div>
				<div class="extrack3"></div>

				<div class="line2-1"></div><div class="jumpline2"></div><div class="line2-2"></div><div class="jumpline2"></div><div class="line2-3"></div><div class="jumpline2"></div>
				<div class="line2-4"></div><div class="jumpline2"></div><div class="line2-5"></div><div class="jumpline2"></div><div class="line2-6"></div><div class="jumpline2"></div>
				<div class="line2-7"></div><div class="jumpline2"></div><div class="line2-8"></div><div class="jumpline2"></div><div class="line2-9"></div><div class="jumpline2"></div>
				<div class="line2-10"></div><div class="jumpline2"></div><div class="line2-11"></div><div class="jumpline2"></div><div class="line2-12"></div><div class="jumpline2"></div>
				<div class="line2-13"></div><div class="jumpline2"></div><div class="line2-14"></div>
				<div class="extrack2"></div>
				<div class="extrack4"></div>

				<img class="flagimage" src="${pageContext.request.contextPath}/resource/image/admin/깃발.png">
				<img class="homeimage" src="${pageContext.request.contextPath}/resource/image/admin/home.png">

				<div class="light1"></div>
					<img class="carimage1" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light2"></div>
					<img class="carimage2" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light3"></div>
					<img class="carimage3" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light4"></div>
					<img class="carimage4" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light5"></div>
					<img class="carimage5" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light6"></div>
					<img class="carimage6" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light7"></div>
					<img class="carimage7" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light8"></div>
					<img class="carimage8" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light9"></div>
					<img class="carimage9" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light10"></div>
					<img class="carimage10" src="${pageContext.request.contextPath}/resource/image/admin/car.png">
				<div class="light11"></div>
					<img class="carimage11" src="${pageContext.request.contextPath}/resource/image/admin/car.png">


				<img id="pingimage1" src="${pageContext.request.contextPath}/resource/image/admin/ping.png">



				<!-- 만들어야할 것들 -->


				<!-- 만들어야할 것들 -->

				<!-- 1. IOT트랙 맵 구현 -->
				<!-- 2. 현재 매장의 위치, 가맹점의 위치, 고객들의 위치 구현 -->
				<!-- 3. 고객 주문 시 맵에 주문창 생성 , 도착 시 주문창 제거 -->
				<!-- 4. 최단 경로 자동 설정ㄴ -->

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

			</div>
			<!-- member + device + instrument data =================================-->
			<div class="viewbox5">

			</div>
			<!-- member + device + instrument map =================================-->

			<div class="viewbox6"> <!-- 1685 * 937 -->
				<div class="jumpline111"></div>
				<div class="jumpline222"></div>
			
				<!-- 직선 차선 그룹   -->
				<!-- 1번째 줄  -->
				<div class="mapline1"><div class="mapline1A1"></div><div class="mapline1A2"></div><div class="mapline1A3"></div><div class="mapline1A4"></div></div>
				<div class="mapline1"><div class="mapline1A5"></div><div class="mapline1A6"></div><div class="mapline1A7"></div><div class="mapline1A8"></div></div>
				<div class="mapline1"><div class="mapline1A9"></div><div class="mapline1A10"></div><div class="mapline1A11"></div><div class="mapline1A12"></div></div>
				<div class="mapline1"><div class="mapline1A13"></div><div class="mapline1A14"></div><div class="mapline1A15"></div><div class="mapline1A16"></div></div>
				<div class="mapline1"><div class="mapline1A17"></div><div class="mapline1A18"></div><div class="mapline1A19"></div><div class="mapline1A20"></div></div>
				<div class="mapline1"><div class="mapline1A21"></div><div class="mapline1A22"></div><div class="mapline1A23"></div><div class="mapline1A24"></div></div>
				<div class="mapline1"><div class="mapline1A25"></div><div class="mapline1A26"></div><div class="mapline1A27"></div><div class="mapline1A28"></div></div>
				<div class="mapline1"><div class="mapline1A29"></div><div class="mapline1A30"></div><div class="mapline1A31"></div><div class="mapline1A32"></div></div>
				<div class="mapline1"><div class="mapline1A33"></div><div class="mapline1A34"></div><div class="mapline1A35"></div><div class="mapline1A36"></div></div>
				<div class="mapline1"><div class="mapline1A37"></div><div class="mapline1A38"></div><div class="mapline1A39"></div><div class="mapline1A40"></div></div>
				<div class="mapline1"><div class="mapline1A41"></div><div class="mapline1A42"></div><div class="mapline1A43"></div><div class="mapline1A44"></div></div>
				<div class="mapline1"><div class="mapline1A45"></div><div class="mapline1A46"></div><div class="mapline1A47"></div><div class="mapline1A48"></div></div>
				<div class="mapline1"><div class="mapline1A49"></div><div class="mapline1A50"></div><div class="mapline1A51"></div><div class="mapline1A52"></div></div>
				<div class="mapline1"><div class="mapline1A53"></div><div class="mapline1A54"></div><div class="mapline1A55"></div><div class="mapline1A56"></div></div>
				<div class="mapline1"><div class="mapline1A57"></div><div class="mapline1A58"></div><div class="mapline1A59"></div><div class="mapline1A60"></div></div>
				<div class="mapline1"><div class="mapline1A61"></div><div class="mapline1A62"></div><div class="mapline1A63"></div><div class="mapline1A64"></div></div>
				<div class="mapline1"><div class="mapline1A65"></div><div class="mapline1A66"></div><div class="mapline1A67"></div><div class="mapline1A68"></div></div>
				<div class="mapline1"><div class="mapline1A69"></div><div class="mapline1A70"></div><div class="mapline1A71"></div><div class="mapline1A72"></div></div>
				<div class="mapline1"><div class="mapline1A73"></div><div class="mapline1A74"></div><div class="mapline1A75"></div><div class="mapline1A76"></div></div>
				<div class="mapline1"><div class="mapline1A77"></div><div class="mapline1A78"></div><div class="mapline1A79"></div><div class="mapline1A80"></div></div>
				<div class="mapline1"><div class="mapline1A81"></div><div class="mapline1A82"></div><div class="mapline1A83"></div><div class="mapline1A84"></div></div>
				<div class="mapline1"><div class="mapline1A85"></div><div class="mapline1A86"></div><div class="mapline1A87"></div><div class="mapline1A88"></div></div>
				<div class="mapline1"><div class="mapline1A89"></div><div class="mapline1A90"></div><div class="mapline1A91"></div><div class="mapline1A92"></div></div>
				<div class="mapline1"><div class="mapline1A93"></div><div class="mapline1A94"></div><div class="mapline1A95"></div><div class="mapline1A96"></div></div>
				<div class="mapline1"><div class="mapline1A97"></div><div class="mapline1A98"></div><div class="mapline1A99"></div><div class="mapline1A100"></div></div>
				<div class="mapline1"><div class="mapline1A101"></div><div class="mapline1A102"></div><div class="mapline1A103"></div><div class="mapline1A104"></div></div>
				<div class="mapline1"><div class="mapline1A105"></div><div class="mapline1A106"></div><div class="mapline1A107"></div><div class="mapline1A108"></div></div>
				<div class="mapline1"><div class="mapline1A109"></div><div class="mapline1A110"></div><div class="mapline1A111"></div><div class="mapline1A112"></div></div>
				<div class="mapline1"><div class="mapline1A113"></div><div class="mapline1A114"></div><div class="mapline1A115"></div><div class="mapline1A116"></div></div>
				<div class="mapline1"><div class="mapline1A117"></div><div class="mapline1A118"></div><div class="mapline1A119"></div><div class="mapline1A120"></div></div>
				<div class="mapline1"><div class="mapline1A121"></div><div class="mapline1A122"></div><div class="mapline1A123"></div><div class="mapline1A124"></div></div>
				<div class="mapline1"><div class="mapline1A125"></div><div class="mapline1A126"></div><div class="mapline1A127"></div><div class="mapline1A128"></div></div>
				<div class="mapline1 mapline1-1"><div class="mapline1A129"></div><div class="mapline1A130"></div><div class="mapline1A131"></div><div class="mapline1A132"></div></div>
				
				<!-- 2번째 줄  -->
				<div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div>
				<div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div>
				<div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div>
				<div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div>
				<div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div><div class="mapline2"></div>
				<div class="mapline2"></div><div class="mapline2"></div><div class="mapline2 mapline2-2"></div>

				<!-- 3번째 줄  -->
				<div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div>
				<div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div>
				<div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div>
				<div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div>
				<div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div><div class="mapline3"></div>
				<div class="mapline3"></div><div class="mapline3"></div><div class="mapline3 mapline3-3"></div>

				<!-- 4번째 줄  -->
				<div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div>
				<div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div>
				<div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div>
				<div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div>
				<div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div><div class="mapline4"></div>
				<div class="mapline4"></div><div class="mapline4"></div><div class="mapline4 mapline4-4"></div>

				<!-- 5번째 줄  -->
				<div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div>
				<div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div>
				<div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div>
				<div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div>
				<div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div><div class="mapline5"></div>
				<div class="mapline5"></div><div class="mapline5"></div><div class="mapline5 mapline5-5"></div>

				<!-- 6번째 줄  -->
				<div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div>
				<div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div>
				<div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div>
				<div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div>
				<div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div><div class="mapline6"></div>
				<div class="mapline6"></div><div class="mapline6"></div><div class="mapline6 mapline6-6"></div>

				<!-- 아래 차선 그룹  -->
				<!-- 1번쨰 줄  -->
				<div class="mapline7"></div><div class="mapline7"></div><div class="mapline7"></div>
				<div class="mapline7"></div><div class="mapline7"></div><div class="mapline7 mapline7-7"></div>

				<!-- 간략 차트 페이지  -->
				<div class="maplineMAP">
					<div class="maplineMAPhead">배송 현황</div>
				
				</div>

				<!-- 2번쨰 줄  -->
				<div class="mapline8"></div><div class="mapline8"></div><div class="mapline8"></div>
				<div class="mapline8"></div><div class="mapline8"></div><div class="mapline8 mapline8-8"></div>

				<!-- 3번쨰 줄  -->
				<div class="mapline9"></div><div class="mapline9"></div><div class="mapline9"></div>
				<div class="mapline9"></div><div class="mapline9"></div><div class="mapline9 mapline9-9"></div>

				<!-- 4번쨰 줄  -->
				<div class="mapline10"></div><div class="mapline10"></div><div class="mapline10"></div>
				<div class="mapline10"></div><div class="mapline10"></div><div class="mapline10 mapline10-10"></div>

				<!-- 5번쨰 줄  -->
				<div class="mapline11"></div><div class="mapline11"></div><div class="mapline11"></div>
				<div class="mapline11"></div><div class="mapline11"></div><div class="mapline11 mapline11-11"></div>

				<!-- 6번쨰 줄  -->
				<div class="mapline12"></div><div class="mapline12"></div><div class="mapline12"></div>
				<div class="mapline12"></div><div class="mapline12"></div><div class="mapline12 mapline12-12"></div>

				<!-- 7번쨰 줄  -->
				<div class="mapline13"></div><div class="mapline13"></div><div class="mapline13"></div>
				<div class="mapline13"></div><div class="mapline13"></div><div class="mapline13 mapline13-13"></div>

				<!-- 8번쨰 줄  -->
				<div class="mapline14"></div><div class="mapline14"></div><div class="mapline14"></div>
				<div class="mapline14"></div><div class="mapline14"></div><div class="mapline14 mapline14-14"></div>





























			</div><!-- viewbox6 end -->
		</div>
	</div>

</body>
<script type="text/javascript">
/* Map script */
//마우스 휠 js
// $(window).bind('mousewheel', function(event) {
//     if (event.originalEvent.wheelDelta >= 0) {

//         console.log('Scroll up');

// 		document.getElementById("pingimage1").addEventListener("wheel", myFunction);
//         function myFunction() {
//       	  this.style.transform = "scale( 2.0 )";
//       	};

//     }
//     if (event.originalEvent.wheelDelta < 0) {

//         console.log('Scroll down');

//         document.getElementById("pingimage1").addEventListener("wheel", myFunction);
//         function myFunction() {
//         	  this.style.transform = "scale( 1.0 )";
//         };

//     }
// });
//---------------------------------------------------------------------------
















//---------------------------------------------------------------------------
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

//hichart script---------------------------------------------------------------------------
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




















//--------------------------------------------------------------------------------------

//차량 도착 시 자동 문자 전송 [테스트] start =======================================================
$(".carimage1").hide();
$(".carimage2").hide();
$(".carimage3").hide();
$(".carimage4").hide();
$(".carimage5").hide();
$(".carimage6").hide();
$(".carimage7").hide();
$(".carimage8").hide();
$(".carimage9").hide();
$(".carimage10").hide();
$(".carimage11").hide();


	$(".flagimage").click(function(){
	stime = setTimeout(time1, 1000);
	function time1(){
		$(".light1").css("background", "red");
		$(".carimage1").show();

		$(".light11").css("background", "green");
		$(".carimage11").hide();
	   setTimeout(time2, 1000);
	}

	function time2(){
		$(".light2").css("background", "red");
		$(".carimage2").show();

		$(".light1").css("background", "green");
		$(".carimage1").hide();

	   setTimeout(time3, 1000);
	}

	function time3(){
		$(".light3").css("background", "red");
		$(".carimage3").show();

		$(".light2").css("background", "green");
		$(".carimage2").hide();
	   setTimeout(time4, 1000);
	}

	function time4(){
		$(".light4").css("background", "red");
		$(".carimage4").show();

		$(".light3").css("background", "green");
		$(".carimage3").hide();
	   setTimeout(time5, 1000);
	}

	function time5(){
		$(".light5").css("background", "red");
		$(".carimage5").show();

		$(".light4").css("background", "green");
		$(".carimage4").hide();
	   setTimeout(time6, 1000);
	}

	function time6(){
		$(".light6").css("background", "red");
		$(".carimage6").show();

		$(".light5").css("background", "green");
		$(".carimage5").hide();
	   setTimeout(time7, 1000);
	}

	function time7(){
		$(".light7").css("background", "red");
		$(".carimage7").show();

		$(".light6").css("background", "green");
		$(".carimage6").hide();
	   setTimeout(time8, 1000);
	}

	function time8(){
		$(".light8").css("background", "red");
		$(".carimage8").show();

		$(".light7").css("background", "green");
		$(".carimage7").hide();
	   setTimeout(time9, 1000);
	}

	function time9(){
		$(".light9").css("background", "red");
		$(".carimage9").show();

		$(".light8").css("background", "green");
		$(".carimage8").hide();
	   setTimeout(time10, 1000);
	}

	function time10(){
		$(".light10").css("background", "red");
		$(".carimage10").show();

		$(".light9").css("background", "green");
		$(".carimage9").hide();
	   setTimeout(time11, 1000);
	}

	function time11(){
		//자동 문자 전송하기
		$("#sendmessage").trigger("click");

		$(".light11").css("background", "red");
		$(".carimage11").show();

		$(".light10").css("background", "green");
		$(".carimage10").hide();
	   setTimeout(time1, 1000);
	}

});

//차량 도착 시 자동 문자 전송 [테스트] end =======================================================

/* 페이져 */
function viewPaging(pageNo) {
   var pageNo = pageNo;
   $.ajax({
      type : "get", // get방식으로 자료를 전달
      url : "${pageContext.request.contextPath}/admin/main.do?pageNo=" +pageNo,
      success : function(result) { // 자료를 보내는것이 성공했을때 출력되는 메시지
         // 댓글목록을 실행한 결과를 가져온다.
         $("#adminmainpage").html(result);
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

       console.log("고고고2");
      }



   });
};
//등록 회원 start------------------------------------------------------------------------------------------------------
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

	});//gogo click function
});//deleteX click function
//등록 회원 end------------------------------------------------------------------------------------------------------
//등록 가게 start------------------------------------------------------------------------------------------------------
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

	});//gogo click function
});//deleteX click function
//등록 가게 end------------------------------------------------------------------------------------------------------

//viewbox1 slide show------------------------------------------
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

// manu bar script1------------------------------------------
//로딩 이미지
$(".ring1").hide();
$(".ring2").hide();
$(".ring3").hide();
$(".ring4").hide();
$(".ring5").hide();
$(".ring6").hide();
$(".ring9").hide();
//뷰 박스
$(".viewbox1").show();
$(".viewbox2").hide();
$(".viewbox3").hide();
$(".viewbox4").hide();
$(".viewbox5").hide();
$(".viewbox6").hide();
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
				$(".viewbox4").hide();
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
});

</script>
</html>
