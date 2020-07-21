<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
   <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
   <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
   <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/admin_maincss.css">
</head>
<body>
	<div class="bodymainbox">
		<div class="navbarmain">
			<!-- /* Group0 */ -->
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
				<div class="nav3text1">Shopkeeper | Customer</div> 
				
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
		
					<img class="ring" src="${pageContext.request.contextPath}/resource/image/admin/ring.png">			
		
		
		
		
		
		
		
		
		
		
		</div>
	</div>
</body>

<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
/* manu bar script1 */

var ringcheck = 0;

// while(ringcheck == 0){	
// 	$(".ring").css("transition", "transform 0.5s");
// 	$(".ring").css("transform", "rotate(360deg)");		
// }

/* manu bar script2 */
$(document).ready(function(){	
		//<!-- /* Group1 */ -->
		var check1 = 0;
		$(".btnHome1").click( function() {  
			if(check1 == 0){		
				$(".btnHome1").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome1").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome1").css("border-right","7px solid #1ABB9C");							
				check1 = 1;
				
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");					
				check2 = 0;	
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");					
				check3 = 0;	
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");				
				check4 = 0;	
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");	
				$(".btnHome22").css("border-right","");				
				check5 = 0;					
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");				
				check6 = 0;							
				
			}else if(check1 == 1){
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");				
				check1 = 0;			
			};
		});	
		
		var check2 = 0;
		$(".btnHome2").click( function() {  
			if(check2 == 0){		
				$(".btnHome2").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome2").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome2").css("border-right","7px solid #1ABB9C");		
				check2 = 1;
				
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");						
				check1 = 0;	
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");						
				check3 = 0;	
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");					
				check4 = 0;	
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");						
				check5 = 0;					
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");				
				check6 = 0;	
				
			}else if(check2 == 1){
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");
				check2 = 0;		
			};
		});	
		
		var check3 = 0;
		$(".btnHome3").click( function() {  
			if(check3 == 0){		
				$(".btnHome3").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome3").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome3").css("border-right","7px solid #1ABB9C");		
				check3 = 1;
				
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");				
				check1 = 0;	
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");				
				check2 = 0;	
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");				
				check4 = 0;	
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");				
				check5 = 0;					
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");				
				check6 = 0;	
				
			}else if(check3 == 1){
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");
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
				check4 = 1;
				/* others */
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");				
				check1 = 0;	
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");				
				check2 = 0;					
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");				
				check3 = 0;	
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");				
				check5 = 0;	
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");				
				check6 = 0;	
				
			}else if(check4 == 1){
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");
				check4 = 0;	
			};
		});	
		
		var check5 = 0;
		$(".btnHome22").click( function() {  
			if(check5 == 0){		
				$(".btnHome22").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome22").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome22").css("border-right","7px solid #1ABB9C");		
				check5 = 1;
				/* others */	
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");				
				check1 = 0;	
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");				
				check2 = 0;					
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");				
				check3 = 0;	
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");				
				check4 = 0;	
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");				
				check6 = 0;	
				
			}else if(check5 == 1){
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");
				check5 = 0;		
			};
		});	
		
		var check6 = 0;
		$(".btnHome23").click( function() {  
			if(check6 == 0){		
				$(".btnHome23").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
				$(".btnHome23").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
				$(".btnHome23").css("border-right","7px solid #1ABB9C");		
				check6 = 1;
				/* others */
				$(".btnHome1").css("background-color","");
				$(".btnHome1").css("box-shadow","");
				$(".btnHome1").css("border-right","");				
				check1 = 0;	
				$(".btnHome2").css("background-color","");
				$(".btnHome2").css("box-shadow","");
				$(".btnHome2").css("border-right","");				
				check2 = 0;					
				$(".btnHome3").css("background-color","");
				$(".btnHome3").css("box-shadow","");
				$(".btnHome3").css("border-right","");				
				check3 = 0;					
				$(".btnHome21").css("background-color","");
				$(".btnHome21").css("box-shadow","");
				$(".btnHome21").css("border-right","");				
				check4 = 0;		
				$(".btnHome22").css("background-color","");
				$(".btnHome22").css("box-shadow","");
				$(".btnHome22").css("border-right","");				
				check5 = 0;		
				
			}else if(check6 == 1){
				$(".btnHome23").css("background-color","");
				$(".btnHome23").css("box-shadow","");
				$(".btnHome23").css("border-right","");				
				check6 = 0;		
			};
		});	
			
		
});	

</script>
</html>
