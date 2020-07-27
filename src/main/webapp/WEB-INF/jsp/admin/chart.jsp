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
   Highcharts.chart('container', {

	   chart: {
	     type: 'column',
	     styledMode: true
	   },

	   title: {
	     text: 'Styling axes and columns'
	   },

	   yAxis: [{
	     className: 'highcharts-color-0',
	     title: {
	       text: 'Primary axis'
	     }
	   }, {
	     className: 'highcharts-color-1',
	     opposite: true,
	     title: {
	       text: 'Secondary axis'
	     }
	   }],

	   plotOptions: {
	     column: {
	       borderRadius: 5
	     }
	   },

	   series: [{
	     data: [1, 3, 2, 4]
	   }, {
	     data: [324, 124, 547, 221],
	     yAxis: 1
	   }]

	 });
   </script>
</html>