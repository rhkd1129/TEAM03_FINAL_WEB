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
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mapcss.css">
   </head>
   <body>
   <script type="text/javascript">
   		/* 변수 모음 */
   		var batteryrandom = 2;
	  	var countnum = 0;
	  	var lilength = 0;
	  	
   		/* 1초마다 새로 값 생성 */
	  	setInterval(function(action){
	  		batteryrandom = Math.floor(Math.random() * 100); // 0 ~ 99
	  		countnum +=1;
	  		
			/* li 갯수 구하기 */
			lilength = $("ul li").length;
			if(lilength == 11){
				var smallid = countnum - 10;
				console.log(smallid);	
				$("#"+smallid).remove();
			}
		
	    }, 1000); 
   	    
	  	/* 요소 내용 변경 */
   		$('.battery').text("타켓 : " + batteryrandom);
   		
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
		    $("#ul_id").append("<li id="+countnum+" class='battery'>"+"탐지 결과 : "+batteryrandom+"</li>");  
		}  
		
	  	
   </script>
      <h5 class="alert alert-success" style="text-align: center;">리스트 실험 페이지</h5>
      <div id="gomainpage">메인으로 이동</div>
      <div id="appendlist">그만</div>
      
      <!-- 제목 -->
	  <div>번호</div>
	  <!--- 리스트 --->
	  <ul id="ul_id">
	  	 <li>--</li>
	  </ul>   
      
      
   </body>
 	<script type="text/javascript">
 	</script>
</html>