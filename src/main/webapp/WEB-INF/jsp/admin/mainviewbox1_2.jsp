<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- SMS import -->
<%@ page import="sms.SMS" %>

<!DOCTYPE html>
<html>
<head>
    <title>레스토랑 리스트</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mainviewbox1_2css.css">	
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
					<img class="ring1" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">
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

			<!-- member + restaurant list ==========================================-->
			<div class="viewbox1">
				<!-- member list box -->
				<div class="w3-content" style="max-width:1000px; margin-top: 70px;">
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
						
						<!-- 회원 리스트 페이지 , 레스토랑 승인처리 페이지 이동 -->
						<input class="golist1page" type="button" value="회원 리스트">				
						<input class="golist3page" type="button" value="가게 승인 처리">	
							
					</div>
				</div>

				<!-- 공용 삭제 시 비밀번호 확인 창 -->
			 	<div class="opacitybox2">
				</div>
				<div class="checkdelete2">
					<div class="fonttext2">비밀번호 입력Ⅱ</div>
					<div class="closedelete2">x</div>
					<input type="text" class="delectcheck2" name="delectcheck2">
					<div class="btn btn-danger btn-sm gogogo2">확인</div>
				</div>

			</div>
		</div>
	</div>

</body>
<script>
/* 회원 리스트 페이지 이동 Ajax */
$(".golist1page").click(function(){
	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath}/admin/mainviewbox1_1.do",
		success : function(result){
			$("#adminmainpage").html(result);
		}
	})
});

/* 승인 대기 리스트 페이지 이동 Ajax */
$(".golist3page").click(function(){
	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath}/admin/mainviewbox1_3.do",
		success : function(result){
			$("#adminmainpage").html(result);
		}
	})	
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














/* 페이져1 */
function viewPaging1(pageNo1) {
   var pageNo1 = pageNo1;
   $.ajax({
      type : "get", // get방식으로 자료를 전달
      url : "${pageContext.request.contextPath}/admin/mainviewbox1_2.do?pageNo1=" +pageNo1,
      success : function(result) { // 자료를 보내는것이 성공했을때 출력되는 메시지
         // 댓글목록을 실행한 결과를 가져온다.
         $("#adminmainpage").html(result);
	console.log(pageNo1);
          console.log("고고고2");
      }
   });
};

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

</script>
</html>
