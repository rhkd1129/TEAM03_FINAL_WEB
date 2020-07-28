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
      
        <script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>
		<style type="text/css">
			@import 'https://code.highcharts.com/css/highcharts.css';

			.highcharts-figure, .highcharts-data-table table {
			  min-width: 310px; 
				max-width: 800px;
			  margin: 1em auto;
			}
			
			.highcharts-data-table table {
				font-family: Verdana, sans-serif;
				border-collapse: collapse;
				border: 1px solid #EBEBEB;
				margin: 10px auto;
				text-align: center;
				width: 100%;
				max-width: 500px;
			}
			.highcharts-data-table caption {
			  padding: 1em 0;
			  font-size: 1.2em;
			  color: #555;
			}
			.highcharts-data-table th {
				font-weight: 600;
			  padding: 0.5em;
			}
			.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
			  padding: 0.5em;
			}
			.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
			  background: #f8f8f8;
			}
			.highcharts-data-table tr:hover {
			  background: #f1f7ff;
			}
			
			
			/* Link the series colors to axis colors */
			.highcharts-color-0 {
				fill: #7cb5ec;
				stroke: #7cb5ec;
			}
			.highcharts-axis.highcharts-color-0 .highcharts-axis-line {
				stroke: #7cb5ec;
			}
			.highcharts-axis.highcharts-color-0 text {
				fill: #7cb5ec;
			}
			.highcharts-color-1 {
				fill: #90ed7d;
				stroke: #90ed7d;
			}
			.highcharts-axis.highcharts-color-1 .highcharts-axis-line {
				stroke: #90ed7d;
			}
			.highcharts-axis.highcharts-color-1 text {
				fill: #90ed7d;
			}
			
			
			.highcharts-yaxis .highcharts-axis-line {
				stroke-width: 2px;
			}
		</style>
   </head>
   <body>
      <h5 class="alert alert-success">/xxx.jsp</h5>
      
      <figure class="highcharts-figure">
		  <div id="container"></div>
		</figure>
      
      
      
   </body>
   <script type="text/javascript">
   //---------------------------------------------------------------------------  
   
   //공동 사용
   var nowDate = new Date();
   
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
   
   //---------------------------------------------------------------------------  
   
   
   
   
   
   
   
   
   
   //10일간의 날짜 계산 alert 창 
   $(document).ready(function(){
//    		alert("오늘 날짜 : "+ todayDate);
//    		alert("1일전 날짜 : "+ yesterDate);  
//    		alert("2일전 날짜 : "+ twoyesterDate); 
//    		alert("3일전 날짜 : "+ threeyesterDate);  
//    		alert("4일전 날짜 : "+ fouryesterDate);
//    		alert("5일전 날짜 : "+ fiveyesterDate);  
//    		alert("6일전 날짜 : "+ sixyesterDate);	
//    		alert("7일전 날짜 : "+ sevenyesterDate);
//    		alert("8일전 날짜 : "+ eightyesterDate);  
//    		alert("9일전 날짜 : "+ nineyesterDate);   		  
   });
   
   
   
   
   
   //차트
   Highcharts.chart('container', {

	   chart: {
	     type: 'column',
	     styledMode: true
	   },

	   title: {
	     text: '등록 회원 및 등록 가게 현황'
	   },
	   
	   //추가
	   //바꿔야할 점 : Oct : 현재 시간 / Jan ~ Sep을 이전 시간들로 수정
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
	     data: [5, 13, 20, 27, 36, 38, 47, 54, 56, 61]
	   }, {
		 name: '가게 수',
	     data: [2, 10, 17, 18, 20, 24, 30, 33, 37, 43],
	     yAxis: 1
	   }]

	 });
   </script>
</html>