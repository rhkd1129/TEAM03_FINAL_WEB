<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html id="adminmainpage">
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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/admin_maincss.css">
</head>
<body style="overflow: hidden;">
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
			</div>		
			<!-- /* Group2 */ -->
			<div class=nav4>
				<div class="nav4text1">Device | Instrument</div> 
				
				<div class="btnHome21">
					<img class="btnHomeimg21" src="${pageContext.request.contextPath}/resource/image/admin/list1.png">
					<div class="btnHometext21">List</div>
				</div>
				
				<div class="btnHome22">
					<img class="btnHomeimg22" src="${pageContext.request.contextPath}/resource/image/admin/data.png">
					<div class="btnHometext22">Data</div>
				</div>				
				
				<div class="btnHome23">
					<img class="btnHomeimg23" src="${pageContext.request.contextPath}/resource/image/admin/map.png">
					<div class="btnHometext23">Map</div>
				</div>						
			</div>			
		</div>
		
		<!-- /* 뷰박스 bigbox */ ------------------------------------------------------------------------>
		<div class="viewmainbox">
			<!-- admin 관리 전 재로그인 진행 -->
			<div class="viewbox0">
				<div class="admainbox">
					<div class="adfirst">Security System</div>
					<div class="adname">Admin Name : </div><input type="text" class="adname1" name="inputIdName">
					<div class="adpassword">Admin Password : </div><input type="text" class="adpassword1" name="inputPwName">			
					<input type="button" class="btn btn-secondary" id="adbutton" value="Login">
				</div>					
			</div>			
			
		</div>
	</div>
<!-- 	admin login opacity box  -->
 	<div class="opacitybox"> 
	</div> 
	
</body>
<script>
// viewbox0 login script ------------------------------------------
$(".opacitybox").show();															//--주석 제거해야함!!
$(".viewbox0").show();
//enter 눌렀을 때 버튼 실행(함수)
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		getInputValue();
	}
}, true);
//click 눌렀을 때 버튼 실행(함수)
$("#adbutton").click(function(){
	getInputValue();
});


function getInputValue(){
	//ID and PW
	var valueByIdName = $("input[name=inputIdName]").val();
	var valueByPwName = $("input[name=inputPwName]").val();	

		if(valueByIdName == "admin123" && valueByPwName =="admin123"){
			alert("관리자 페이지에 오신 것을 환영합니다.");  			
			/* admin 로그인 순간 이동 */
			location.href = "${pageContext.request.contextPath}/admin/main.do"		
		}else{
			alert("다시 입력하시기 바랍니다.");	
			$(".opacitybox").show();  									
		};
};
</script>
</html>
