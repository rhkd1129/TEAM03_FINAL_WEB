<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
   <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
   <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/admin_maincss2.css">
</head>
<body style="overflow: hidden;" id="adminmainpage">
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
	
					<div class="mySlides" id="alistmain">
						<div class="mlist">
							<div class="mlistid">Id</div>
							<div class="mlistpw">Password</div>						
							<div class="mlistname">Name</div>
							<div class="mlisttitle">Title</div>		
							<div class="mlistadress">Adress</div>
							<div class="mlisttel">Tel</div>
							<div class="mlistcategory">Rcategory</div>							
							<div class="mlistdelete">Unlock</div>	
							
						</div>
						<div class="mlistbox">
							<!-- Customer Member List -->
							<table>
								<c:forEach var="rmember" items="${rmemberlist}">
									<tr class="mlistTR">
										<td class="mlistidTD">${rmember.rid}</td>
										<td class="mlistpwTD">${rmember.rpassword}</td>								
										<td class="mlistnameTD">${rmember.rname}</td>
										<td class="mlisttitleTD">${rmember.rtitle}</td>
										<td class="mlistadressTD">${rmember.radress}</td>
										<td class="mlisttelTD">${rmember.rtel}</td>																		
										<td class="mlistcategoryTD">${rmember.rcategory}</td>	
										<td class="mlistdeleteTD"><div id="${rmember.rid}" class="btn btn-secondary btn-sm deleteX">X</div></td>						
									</tr>
								</c:forEach>
							</table>
							<input type="search" class="w3-button w3-white w3-border btn-sm search" placeholder="회원명 검색" />
							<button class="w3-button w3-white w3-border btn-sm" id="btnsearch">검색</button>
							<!-- 하단 페이져 -->
							<table class="pagepage1">	
								<tr>							
									<td colspan="6">
										<a class="w3-button demo  btn-sm" onclick="viewPaging2(1)">처음</a>		
										
										<c:if test="${pager.groupNo > 1}">
											<a class="w3-button demo  btn-sm" onclick="viewPaging2('${pager.startPageNo-pager.pagesPergroup}')">이전</a>	
											<!-- <<=6~10 이전으로 가려면 -5(즉pagesPerGroup =5)를 빼준다   -->
										</c:if>	
										
										<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
											<c:if test="${pager.pageNo != i}">	
											<!-- 현재 페이지와 ${i}와 같다면 색을 변경 -->	
												<a class="w3-button demo  btn-sm" onclick="viewPaging2('${i}')"> ${i}</a>	
											</c:if>		
											
											<c:if test="${pager.pageNo == i}">
												<a class="w3-button demo  btn-sm" onclick="viewPaging2('${i}')"> ${i}</a>
											</c:if>					
										</c:forEach>
										
										<c:if test="${pager.groupNo < pager.totalGroupNo}">
											<a class="w3-button demo  btn-sm" onclick="viewPaging2('${pager.endPageNo+1}')">다음</a>	
										</c:if>				
										<a class="w3-button demo  btn-sm" onclick="viewPaging2('${pager.totalPageNo}')">맨끝</a>
									</td>
								</tr>
							</table>													
						</div>						
					</div>	
					
				</div>
				
				
				<!-- 삭제 시 비밀번호 확인 창 -->
			 	<div class="opacitybox2"> 
				</div> 
				
				<div class="checkdelete1">
					<div class="fonttext1">비밀번호 입력</div>
					<div class="closedelete">x</div>
					<input type="text" class="delectcheck" name="delectcheck">
					<div class="btn btn-danger btn-sm gogogo">확인</div>
				</div>
			</div>
			<!-- member + Restaurant data ==========================================-->
			<div class="viewbox2">
				<a href="${pageContext.request.contextPath}/admin/index.do">SMS</a>
			</div>
			<!-- member + Restaurant map ===========================================-->
			<div class="viewbox3">
			</div>
			<!-- member + device + instrument list =================================-->
			<div class="viewbox4">
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

<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
/* 페이져 */
function viewPaging2(pageNo) {
   var pageNo = pageNo;
   $.ajax({
      type : "get", // get방식으로 자료를 전달
      url : "${pageContext.request.contextPath}/admin/main2.do?pageNo=" +pageNo,
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

	$(".checkdelete1").show();
	$(".opacitybox2").show();
	
	$(".gogogo").click(function(){ 
		delectcheck = $("input[name=delectcheck]").val();
		var mid =  $(".deleteX").attr("id");

		if(delectcheck == "admin123"){
			alert("등록 해제 완료");				
			$(".checkdelete1").hide();
			$(".opacitybox2").hide();
			location.href = "${pageContext.request.contextPath}/admin/rmemberdelete.do?rid=" + rid;
			
		}else{
			alert("등록 해제 실패");
			$(".checkdelete1").hide();
			$(".opacitybox2").hide();
		}//else
		
	});//gogo click function
});//deleteX click function



// manu bar script1------------------------------------------ 
//로딩 이미지
$(".ring1").hide();  
$(".ring2").hide();
$(".ring3").hide();
$(".ring4").hide();
$(".ring5").hide();
$(".ring6").hide();
//뷰 박스
$(".viewbox1").show();
$(".viewbox2").hide();
$(".viewbox3").hide();
$(".viewbox4").hide();
$(".viewbox5").hide();
$(".viewbox6").hide();

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
				
			}else if(check3 == 1){
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
				$(".ring3").hide();
				check3 = 0;		
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
				
			}else if(check4 == 1){
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
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
