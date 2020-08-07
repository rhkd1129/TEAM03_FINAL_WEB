<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>관리자 페이지</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resource/image/admin/관리자.png">
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<style>
canvas {
    border:1px solid #d3d3d3;
    background-color: #f1f1f1;
}
</style>
</head>
<body onload="startGame()">
<div style="text-align:center;width:480px;">
  <button class="ssss" onmousedown="moveup()" onmouseup="clearmove()" ontouchstart="moveup()">UP</button><br><br>
  <button onmousedown="moveleft()" onmouseup="clearmove()" ontouchstart="moveleft()">LEFT</button>
  <button onmousedown="moveright()" onmouseup="clearmove()" ontouchstart="moveright()">RIGHT</button><br><br>
  <button onmousedown="movedown()" onmouseup="clearmove()" ontouchstart="movedown()">DOWN</button>
</div>

</body>
<script>
var myGamePiece;

function startGame() {
    myGamePiece = new component(30, 30, "red", 10, 120);
    myGameArea.start();
}

var myGameArea = {
    canvas : document.createElement("canvas"),
    start : function() {
        this.canvas.width = 500;
        this.canvas.height = 500;
        this.context = this.canvas.getContext("2d");
        document.body.insertBefore(this.canvas, document.body.childNodes[0]);
        this.interval = setInterval(updateGameArea, 20);
    },
    clear : function() {
        this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
    }
}

function component(width, height, color, x, y) {
    this.width = width;
    this.height = height;
    this.speedX = 0;
    this.speedY = 0;
    this.x = x;
    this.y = y;    
    this.update = function() {
        ctx = myGameArea.context;
        ctx.fillStyle = color;
        ctx.fillRect(this.x, this.y, this.width, this.height);
    }
    this.newPos = function() {
        this.x += this.speedX;
        this.y += this.speedY;        
    }    
}

function updateGameArea() {
    myGameArea.clear();
    drawMap();
    myGamePiece.newPos();    
    myGamePiece.update();
    console.log(myGamePiece.x, myGamePiece.y);
}

function moveup() {
    myGamePiece.speedY = -1; 
}

function movedown() {
    myGamePiece.speedY = 1; 
}

function moveleft() {
    myGamePiece.speedX = -1; 
}

function moveright() {
    myGamePiece.speedX = 1; 
}

function clearmove() {
    myGamePiece.speedX = 0; 
    myGamePiece.speedY = 0; 
}

function drawMap() {
     var ctx = myGameArea.context;//차이점 
      
     var scaleValueWidth = myGameArea.canvas.width / 500
     var scaleValueHeight = myGameArea.canvas.height / 500
     ctx.scale(scaleValueWidth, scaleValueHeight) // 브라우저 크기에 따른 크기 조정
     
        // 지도의 흰색 테두리, 이 위에 검은색 지도를 덮어 씌움
        ctx.beginPath();
        ctx.lineWidth = "52";
        ctx.strokeStyle = "white";
        ctx.moveTo(150, 50);
        ctx.lineTo(400, 50);
        ctx.quadraticCurveTo(450, 50, 450, 100);

        ctx.lineTo(450, 400);
        ctx.quadraticCurveTo(450, 450, 400, 450);

        ctx.lineTo(150, 450);
        ctx.bezierCurveTo(130, 450, 130, 400, 100, 400);
        ctx.quadraticCurveTo(50, 400, 50, 350);

        ctx.lineTo(50, 300);
        ctx.lineTo(100, 150);
        ctx.lineTo(100, 100);
        ctx.quadraticCurveTo(100, 50, 150, 50);

        ctx.stroke();
     

        // 검정색 지도
        ctx.beginPath();
        ctx.lineWidth = "50";
        ctx.strokeStyle = "black";
        ctx.moveTo(150, 50);
        ctx.lineTo(400, 50);
        ctx.quadraticCurveTo(450, 50, 450, 100);

        ctx.lineTo(450, 400);
        ctx.quadraticCurveTo(450, 450, 400, 450);

        ctx.lineTo(150, 450);
        ctx.bezierCurveTo(130, 450, 130, 400, 100, 400);
        ctx.quadraticCurveTo(50, 400, 50, 350);

        ctx.lineTo(50, 300);
        ctx.lineTo(100, 150);
        ctx.lineTo(100, 100);
        ctx.quadraticCurveTo(100, 50, 150, 50);

        ctx.stroke();

        //지도의 중간에 점선
        ctx.beginPath();
        ctx.lineWidth = "3";
        ctx.strokeStyle = "white";
        ctx.setLineDash([10, 20]) //점선 길이, 간격(15,20)
        ctx.moveTo(150, 50);
        ctx.lineTo(400, 50);
        ctx.quadraticCurveTo(450, 50, 450, 100);

        ctx.lineTo(450, 400);
        ctx.quadraticCurveTo(450, 450, 400, 450);

        ctx.lineTo(150, 450);
        ctx.bezierCurveTo(130, 450, 130, 400, 100, 400);
        ctx.quadraticCurveTo(50, 400, 50, 350);

        ctx.lineTo(50, 300);
        ctx.lineTo(100, 150);
        ctx.lineTo(100, 100);
        ctx.quadraticCurveTo(100, 50, 150, 50);

        ctx.stroke();
        ctx.setLineDash([]); //점선을 다시 실선으로 만들어야 다음에 호출될 때 실선으로 시작함.
}

/* 키 안에 담는 객체 = 꼭필요 중요--------------------------------------------------------------------- */
var keyValue = {};

  /* 키를 땟을 때 ----------------------------------------------------------------------- */
  function stopInterval(action){
   /* 전진 키 땠을때 */
      if(keyValue[87]=='up')
      {
        console.log(keyValue[2]);
         console.log("앞으로 끝")
         clearmove()   
         keyValue[87]=''
      }
      /* 후진 키 땠을때 */
      if(keyValue[83]=='up')
      {
         console.log("뒤로 끝")
         clearmove()   
         keyValue[83]=''
      }
      /* 우회전 키 땠을때 */
      if(keyValue[68]=='up')
      {
         console.log("우회전 끝")
         clearmove()   
         keyValue[68]=''
      }
      /* 좌회전 키 땠을때 */
      if(keyValue[65]=='up')
      {
         console.log("좌회전 끝")
         clearmove()   
         keyValue[65]=''
      }
      /* 정지 키 땠을때 */
      if(keyValue[32]=='up')
      {
         console.log("정지 스탑")
         clearmove()   
      }
  }

  /* 키를 눌렀을 때 ------------------------------------------------- */
  setInterval(function(action){
   /* 전진 키 눌렀을때 */
      if(keyValue[87]=='down')
      {
         console.log("앞으로")
       moveup()   
//          document.getElementById("gostraight").click();
      }
      /* 후진 키 눌렀을때 */
      if(keyValue[83]=='down')
      {
         console.log("뒤로")
         movedown()
//          document.getElementById("goback").click();
      }

      /* 우회전 키 눌렀을때 */
      if(keyValue[68]=='down')
      {
         console.log("우회전")
         moveright()
//          document.getElementById("goright").click();
      }
      /* 좌회전 키 눌렀을때 */
      if(keyValue[65]=='down')
      {
         console.log("좌회전")
         moveleft()
//          document.getElementById("goleft").click();
      }
      /* 정지 키 눌렀을때 */
      if(keyValue[32]=='down')
      {
         console.log("정지")
          clearmove()      
//          document.getElementById("gostop").click();
      }

  }, 30);
  /* 키 눌렀을 때 이벤트를 실행하겠다 */
  document.addEventListener('keydown', function(event) {
     //event.preventDefault();
     keyValue[event.keyCode] = 'down';
  }, true);
  /* 키 땠을 때 이벤트를 실행하겠다 */
  document.addEventListener('keyup', function(event) {
  //event.preventDefault();
     keyValue[event.keyCode] = 'up';
     stopInterval()
  }, true);

// $(document).ready(function(){
// 	setInterval(function(action){
// 		 $('.ssss').trigger('click');
// 	}, 30);
// )};


</script>
</html>