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
          <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/zzz.css">
   </head>
<body>
<!-- 도로 차선 container -->
<div id='container'> 
    <div id='landscape'>
      <div id='road'>
          <div class='center'>
          		<!-- 표지판 예제 -->
          		<div></div>
          		<!-- 좌측 차선 -->
          		<div class="leftcarline"></div>
          		<!-- 우측 차선 -->
          		<div class="rightcarline"></div>          		
          		
             <div id='line'>test</div>
          </div>
      </div>
    </div> 
</div>

<!-- Jetson Car image -->
<%-- <img class="jetsoncar" src="${pageContext.request.contextPath}/resource/image/trafic/jetsoncar.png"> --%>

<img class="crosswalkimage" id="crosswalkimage" src="${pageContext.request.contextPath}/resource/image/trafic/횡단보도.png">




</body>

<script type="text/javascript">
$(document).ready(function(){
	$('.crosswalkimage').click(function(){
		$(this).css('-webkit-animation-name','iteration-count');
		
	});
});

		
/* 무작위로 이미지 띄우기 */	
var Numrandom = 2;

setInterval(function(action){	
	
	Numrandom = Math.floor(Math.random() * 100); 
	clickfunctionimage();
	/* 0~10, 11~20, 21~30 ... 91~99 이미지 지정 변경 */
	/* 1 */
	if(Numrandom >= 0 && Numrandom < 11){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/100.png";
						
	}
	/* 2 */
	if(Numrandom >= 11 && Numrandom < 21){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/60.png";
				
	}
	/* 3 */
	if(Numrandom >= 21 && Numrandom < 31){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/급커브주의.png";
				
	}				
	/* 4 */
	if(Numrandom >= 31 && Numrandom < 41){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/방지턱주의.png";
				
	}				
	/* 5 */
	if(Numrandom >= 41 && Numrandom < 51){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/사람.png";
				
	}				
	/* 6 */				
	if(Numrandom >= 51 && Numrandom < 61){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/신호등.png";
				
	}				
	/* 7 */
	if(Numrandom >= 61 && Numrandom < 71){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/어린이보호구역.png";
			
	}				
	/* 8 */
	if(Numrandom >= 71 && Numrandom < 81){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/정지.png";
			
	}				
	/* 9 */
	if(Numrandom >= 81 && Numrandom < 91){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/콘.png";				
	}				
	/* 10 */
	if(Numrandom >= 91 && Numrandom < 100){
		document.getElementById("crosswalkimage").src="${pageContext.request.contextPath}/resource/image/trafic/횡단보도.png";			
	}											
}, 8000); 

</script>
</html>