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
<!--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
      
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.css">	
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
    <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>  
   
    <!-- hichart --> 
    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>	
	
    <!-- css import -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/admin_maincss.css">  
    

    
<!--   SMS import 2 (필요x?)  -->
<!--   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 	 -->
	
</head>
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
							<div class="rlistpw">Password</div>						
							<div class="rlistname">Name</div>
							<div class="rlisttel">Tel</div>		
							<div class="rlistadress">Adress</div>
							<div class="rlisttitle">Title</div>							
							<div class="rlistcategory">Category</div>
							<div class="rlistdelete">Unlock</div>	
							
						</div>
						<div class="rlistbox">
							<!-- Customer Member List -->
							<table>
								<c:forEach var="rmember" items="${rmemberlist}">
									<tr class="rlistTR">
										<td class="rlistidTD">${rmember.rid}</td>
										<td class="rlistpwTD">${rmember.rpassword}</td>								
										<td class="rlistnameTD">${rmember.rname}</td>
										<td class="rlisttelTD">${rmember.rtel}</td>
										<td class="rlistadressTD">${rmember.radress}</td>																		
										<td class="rlisttitleTD">${rmember.rtitle}</td>	
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
			
				<figure class="highcharts-figure">
				    <div id="container"></div>
				</figure>
				
				<a href="${pageContext.request.contextPath}/admin/chart.do">chart page</a>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				







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
				<div class="extrack2"></div>	
			</div>
			<!-- member + device + instrument data =================================-->
			<div class="viewbox5">
			</div>
			<!-- member + device + instrument map =================================-->
			<div class="viewbox6">
			</div>
			
		</div>
	</div>
	
</body>

<!-- SMS import 3 (필요x?) 	 -->
<!-- <script src="//code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script type="text/javascript">

// hichart js
 Highcharts.chart('container', {

	   chart: {
	     type: 'column',
	     styledMode: true
	   },

	   title: {
	     text: '등록 회원 및 등록 가게 현황'
	   },
	   
	   //추가
	   xAxis: {
		  className: 'highcharts-color-5',
		  type: 'datetime',
		  labels: {
		  format: '{value:%Y-%M-%d}'
	      },
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
	     data: [5, 13, 20, 27, 36, 38, 47, 54, 56, 61]
	   }, {
		 name: '가게 수',
	     data: [2, 10, 17, 18, 20, 24, 30, 33, 37, 43],
	     yAxis: 1
	   }]

	 });






















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
				
				$(".btnHome4").css("background-color","");
				$(".btnHome4").css("box-shadow","");
				$(".btnHome4").css("border-right","");	
				$(".ring4").hide();
				$(".viewbox4").hide();
				check0 = 0;						
				
				$(".btnHome9").css("background-color","");
				$(".btnHome9").css("box-shadow","");
				$(".btnHome9").css("border-right","");	
				$(".ring9").hide();
				$(".viewbox9").hide();
				check9 = 0;			
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
