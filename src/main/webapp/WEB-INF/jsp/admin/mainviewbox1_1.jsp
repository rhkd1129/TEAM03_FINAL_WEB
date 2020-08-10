<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- SMS import -->
<%@ page import="sms.SMS" %>

<!DOCTYPE html>
<html>
<head>
    <title>회원 리스트</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mainviewbox1_1css.css">
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
					<div class="btnHometext23">Talk</div>
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
										<td style="overflow: hidden; text-overflow: ellipsis;" class="mlistpwTD">${cmember.mpassword}</td>
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
						
						<!-- 레스토랑 리스트 페이지 , 레스토랑 승인처리 페이지 이동 -->
						<input class="golist2page" type="button" value="가게 리스트">				
						<input class="golist3page" type="button" value="가게 승인 처리">						
						
					</div>
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

			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
/* 글자수 처리 */
$(".mlistpwTD").each(function(){
    var length = 5; //표시할 글자수 정하기

    $(this).each(function(){
        if( $(this).text().length >= length ){
            $(this).text( $(this).text().substr(0,length)+'...') 
        }
    });
});

/* 가게 리스트 페이지 이동 Ajax */
$(".golist2page").click(function(){
	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath}/admin/mainviewbox1_2.do",
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













/* 페이져 */
function viewPaging(pageNo) {
   var pageNo = pageNo;
   $.ajax({
      type : "get", // get방식으로 자료를 전달
      url : "${pageContext.request.contextPath}/admin/mainviewbox1_1.do?pageNo=" +pageNo,
      success : function(result) { // 자료를 보내는것이 성공했을때 출력되는 메시지
         // 댓글목록을 실행한 결과를 가져온다.
         $("#adminmainpage").html(result);
      }
   });
};

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
//viewbox1 script end---------------------------------------------------------------

</script>
</html>
