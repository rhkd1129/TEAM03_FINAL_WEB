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

<script>
var myGamePiece;

function startGame() {
    myGamePiece = new component(20, 20, "red", 380, 50);
    myGameArea.start();
}

var myGameArea = {
    canvas : document.createElement("canvas"),
    start : function() {
        this.canvas.width = 500;
        this.canvas.height = 500;
        this.context = this.canvas.getContext("2d");
        document.body.insertBefore(this.canvas, document.body.childNodes[0]);
        this.frameNo = 0;
        this.interval = setInterval(updateGameArea, 20);
        window.addEventListener('keydown', function (e) {
            e.preventDefault();
            myGameArea.keys = (myGameArea.keys || []);
            myGameArea.keys[e.keyCode] = (e.type == "keydown");
        })
        window.addEventListener('keyup', function (e) {
            myGameArea.keys[e.keyCode] = (e.type == "keydown");
        })
    },
    stop : function() {
        clearInterval(this.interval);
    },    
    clear : function() {
        this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
    }
}

function component(width, height, color, x, y, type) {
    this.type = type;
    this.width = width;
    this.height = height;
    this.speed = 0;
    this.angle = -Math.PI / 2;		//Math.PI / 2;
    this.moveAngle = 0;
    this.x = x;
    this.y = y;
    this.update = function() {
        ctx = myGameArea.context;
        ctx.save();
        ctx.translate(this.x, this.y);
        ctx.rotate(this.angle);
        ctx.fillStyle = color;
        ctx.fillRect(this.width / -2, this.height / -2, this.width, this.height);
        ctx.restore();
    }
    this.newPos = function() {
        this.angle += this.moveAngle * Math.PI / 180;
        this.x += this.speed * Math.sin(this.angle);
        this.y -= this.speed * Math.cos(this.angle);
    }
}


function updateGameArea() {
    myGameArea.clear();
    drawMap();
    myGamePiece.moveAngle = 0;
    myGamePiece.speed = 0;

    //1번
	if (myGamePiece.x <= 400 && myGamePiece.x >= 150 && myGamePiece.y == 50) {
		myGamePiece.speed=1; 															
		console.log("상부 직선");
	}   
	//2번
	if (myGamePiece.x >= 87 && myGamePiece.x <= 149 && myGamePiece.y >= 49 && myGamePiece.y <= 100) {
		myGamePiece.moveAngle = -1.18;
		myGamePiece.speed=1; 		
		console.log("좌상부 곡선");
	}	 
    //3번
	if (myGamePiece.x >= 100 && myGamePiece.x <= 102 && myGamePiece.y >= 100 && myGamePiece.y <= 130) {
		myGamePiece.speed=1; 															
		console.log("좌부 직선");
	}   	 
	//4번	
	if (myGamePiece.x >= 95 && myGamePiece.x <= 105 && myGamePiece.y >= 129 && myGamePiece.y <= 150) {
		myGamePiece.moveAngle = 1;
		myGamePiece.speed=1; 		
		console.log("좌부 곡선");
	}	 
	//5번	
	if (myGamePiece.x >= 50 && myGamePiece.x <= 100 && myGamePiece.y >= 150 && myGamePiece.y <= 295) {
		myGamePiece.speed=1; 		
		console.log("좌부 직선2");
	}	 
	//6번	
	if (myGamePiece.x >= 45 && myGamePiece.x <= 55 && myGamePiece.y >= 293 && myGamePiece.y <= 310) {
		myGamePiece.moveAngle = -1.12;
		myGamePiece.speed=1; 		
		console.log("좌부 곡선2");
	}	 		
	//7번	
	if (myGamePiece.x >= 45 && myGamePiece.x <= 50 && myGamePiece.y >= 310 && myGamePiece.y <= 350) {
		myGamePiece.speed=1; 		
		console.log("좌부 직선3");
	}	 	
	//8번	
	if (myGamePiece.x >= 45 && myGamePiece.x <= 90 && myGamePiece.y >= 350 && myGamePiece.y <= 400) {
		myGamePiece.moveAngle = -1.2;
		myGamePiece.speed=1; 		
		console.log("좌부 곡선3");
	}	 	 
	//9번	
	if (myGamePiece.x >= 90 && myGamePiece.x <= 128 && myGamePiece.y >= 395 && myGamePiece.y <= 425) {
		myGamePiece.moveAngle = 1.2;
		myGamePiece.speed=1; 		
		console.log("좌부 곡선4");
	}	     
	//10번	
	if (myGamePiece.x >= 126 && myGamePiece.x <= 132 && myGamePiece.y >= 424 && myGamePiece.y <= 435) {
		myGamePiece.speed=1; 		
		console.log("하부 직선");
	}	      	
	//11번	
	if (myGamePiece.x >= 132 && myGamePiece.x <= 155 && myGamePiece.y >= 435 && myGamePiece.y <= 450) {
		myGamePiece.moveAngle = -2.281;
		myGamePiece.speed=1; 		
		console.log("하부 곡선");
	}	  
	//12번	
	if (myGamePiece.x >= 155 && myGamePiece.x <= 405 && myGamePiece.y >= 449 && myGamePiece.y <= 450) {
		myGamePiece.speed=1; 		
		console.log("하부 직선2");
	}		
	//13번	
	if (myGamePiece.x >= 405 && myGamePiece.x <= 450 && myGamePiece.y >= 405 && myGamePiece.y <= 450) {
		myGamePiece.moveAngle = -1.302;
		myGamePiece.speed=1; 		
		console.log("하부 곡선");
	}	    	
	//14번	
	if (myGamePiece.x >= 445 && myGamePiece.x <= 450 && myGamePiece.y <= 405 && myGamePiece.y >= 95) {
		myGamePiece.speed=1; 		
		console.log("우부 직선");
	}	          
	//15번	
	if (myGamePiece.x >= 405 && myGamePiece.x <= 449 && myGamePiece.y <= 95 && myGamePiece.y >= 49.99) {
		myGamePiece.moveAngle = -1.2715;
		myGamePiece.speed=1; 		
		console.log("우부 곡선");
	}	 	
	//조건 세팅
	if(myGamePiece.y  <= 50 && myGamePiece.x >= 405 && myGamePiece.x <= 406.99){
		console.log("위치 세팅 ------")
		myGamePiece.y = 50;
		myGamePiece.x = 404;
		myGamePiece.angle = -Math.PI / 2;
	}
 	//16번	
	if (myGamePiece.x >= 380 && myGamePiece.x <= 404 && myGamePiece.y == 50 && myGamePiece.angle == -Math.PI / 2) {
		myGamePiece.y = 50;
		myGamePiece.speed=1; 		
		console.log("최종 직선");
	}	 
	
	console.log(myGamePiece.x, myGamePiece.y);
    myGamePiece.newPos();
    myGamePiece.update();
}

function drawMap() {
     var ctx = myGameArea.context;//차이점
      
     var scaleValueWidth = myGameArea.canvas.width / 500
     var scaleValueHeight = myGameArea.canvas.height / 500
     ctx.scale(scaleValueWidth, scaleValueHeight) // 브라우저 크기에 따른 크기 조정
     
   // 지도의 흰색 테두리, 이 위에 검은색 지도를 덮어 씌움
     ctx.beginPath();
     ctx.lineWidth = ' 52'
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

     //지도의 중간에 점선
     ctx.beginPath();
     ctx.lineWidth = "1";
     ctx.strokeStyle = "white";
     ctx.setLineDash([15, 20]) //점선 길이, 간격
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
        ctx.setLineDash([]); //점선을 다시 실선으로 만들어야 다음에 호출될 때 실선으로 시작함.
}
</script>
</body>
</html>