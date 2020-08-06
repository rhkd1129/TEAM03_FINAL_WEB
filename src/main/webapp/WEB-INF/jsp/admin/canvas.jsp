<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>No. 10</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
      <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
      <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
      <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
      <style>
         canvas {
             border:1px solid #d3d3d3;
             background-color: #f1f1f1;
         }
      </style>
      <script>
         var car1;
         var car2;
         var car3;
         
         function startMap() { //map이 초기화될 때 차 객체 생성
             mapArea.start();
             car1 = new component(150, 50, "red", 8);//여기서 곡선이동을 적용시 곡선이동
         }
         
         var mapArea = {
             canvas : document.createElement("canvas"),
             start : function() {
                 this.canvas.width = 500;
                 this.canvas.height = 500;
                 this.context = this.canvas.getContext("2d");
                 document.body.insertBefore(this.canvas, document.body.childNodes[0]);
                 this.interval = setInterval(updateMapArea, 20); //interval which will fu nthe updateMapArea() every 20th millisecond
             },
             clear : function() {
                this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
             }
         }
         
         function component(x, y, color, radius) {
             this.radius = radius;
             this.x = x;
             this.y = y;
             this.update = function() {                
                ctx = mapArea.context;
                ctx.beginPath();
                ctx.fillStyle = color;
                ctx.arc(this.x, this.y, this.radius, 0, 2 * Math.PI);
                ctx.fill();
             }
         }
         
         //
         function updateMapArea() {
              mapArea.clear();
              drawMap();
              drawMap2();
              car1.x += 2;
              car1.update();
            }      
         
         function drawMap() {
              var ctx = mapArea.context;//차이점 
               
              var scaleValueWidth = mapArea.canvas.width / 500
              var scaleValueHeight = mapArea.canvas.height / 500
              ctx.scale(scaleValueWidth, scaleValueHeight) // 브라우저 크기에 따른 크기 조정
              
                 
                 // 지도의 흰색 테두리, 이 위에 검은색 지도를 덮어 씌움
                 ctx.beginPath();
                 ctx.lineWidth = 80
                 ctx.strokeStyle = "white";
                 ctx.moveTo(150, 50);
                 ctx.lineTo(400, 50);
                 ctx.arcTo(450, 50, 450, 100, 50);

                 ctx.lineTo(450, 400);
                 ctx.arcTo(450, 450, 400, 450, 50);

                 ctx.lineTo(150, 450);
                 ctx.bezierCurveTo(130, 450, 130, 400, 100, 400);
                 ctx.arcTo(50, 400, 50, 350, 50);

                 ctx.lineTo(50, 300);
                 ctx.lineTo(100, 150);
                 ctx.lineTo(100, 100);
                 ctx.arcTo(100, 50, 150, 50, 50);

                 ctx.stroke();
              
      
                 // 검정색 지도
                 ctx.beginPath();
                 ctx.lineWidth = "50";
                 ctx.strokeStyle = "black";
                 ctx.moveTo(150, 50);
                 ctx.lineTo(400, 50);
                 ctx.arcTo(450, 50, 450, 100, 50);

                 ctx.lineTo(450, 400);
                 ctx.arcTo(450, 450, 400, 450, 50);

                 ctx.lineTo(150, 450);
                 ctx.bezierCurveTo(130, 450, 130, 400, 100, 400);
                 ctx.arcTo(50, 400, 50, 350, 50);

                 ctx.lineTo(50, 300);
                 ctx.lineTo(100, 150);
                 ctx.lineTo(100, 100);
                 ctx.arcTo(100, 50, 150, 50, 50);

                 ctx.stroke();     
         }
         
         function drawMap2() {
             var ctx = mapArea.context;//차이점 
             
             var scaleValueWidth = mapArea.canvas.width / 500
             var scaleValueHeight = mapArea.canvas.height / 500
             ctx.scale(scaleValueWidth, scaleValueHeight) // 브라우저 크기에 따른 크기 조정
             
             //지도의 중간에 점선
             ctx.beginPath();
             ctx.lineWidth = "5";
             ctx.strokeStyle = "white";
             ctx.setLineDash([15, 5]) //점선 길이, 간격(15,20)
             ctx.moveTo(150, 50);
             ctx.lineTo(400, 50);
             ctx.arcTo(450, 50, 450, 100, 50);

             ctx.lineTo(450, 400);
             ctx.arcTo(450, 450, 400, 450, 50);

             ctx.lineTo(150, 450);
             ctx.bezierCurveTo(130, 450, 130, 400, 100, 400);
             ctx.arcTo(50, 400, 50, 350, 50);

             ctx.lineTo(50, 300);
             ctx.lineTo(100, 150);
             ctx.lineTo(100, 100);
             ctx.arcTo(100, 50, 150, 50, 50);

             ctx.stroke();
             ctx.setLineDash([])
     		
         }         
      </script>
   </head>
   <body onload="startMap()">
   </body>
</html>