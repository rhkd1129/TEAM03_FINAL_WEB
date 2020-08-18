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
    myGamePiece = new component(20, 20, "red", 100, 100);
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
        this.interval = setInterval(updateGameArea, 10);
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
    this.angle = Math.PI; //Math.PI / 2
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

    //[1번]
	if (myGamePiece.x == 100 && myGamePiece.y >= 100 && myGamePiece.y <= 150) {		
		myGamePiece.speed=1; 															
		console.log("1번 이동(직선)");
	}   	 
    //======1~2 세팅 구간 
	if (myGamePiece.x == 100 && myGamePiece.y == 150) {
		myGamePiece.angle = 12.62 * Math.PI / 6 + Math.PI;		
		myGamePiece.y = 150;
		myGamePiece.x = 100;			
		console.log("1~2 세팅");
	}	   
    //[2번]
	if (myGamePiece.x <= 100 && myGamePiece.x >= 75 && myGamePiece.y >= 150 && myGamePiece.y <= 225) {
		myGamePiece.speed=1; 															
		console.log("2번 이동(직선)");
	}   
    //======2~3 세팅 구간 
	if (myGamePiece.x <= 75 && myGamePiece.y <= 225) {
		myGamePiece.angle = 12.62 * Math.PI / 6 + Math.PI;	
		myGamePiece.y = 225;
		myGamePiece.x = 75;
		console.log("2~3 세팅");
	}	     
    //[3번]
	if (myGamePiece.x <= 75 && myGamePiece.x >= 50 && myGamePiece.y >= 225 && myGamePiece.y <= 300) {		
		myGamePiece.speed=1; 															
		console.log("3번 이동(직선)");
	}      
    //======3~4 세팅 구간 
	if (myGamePiece.x <= 50  && myGamePiece.y <= 300) {
		myGamePiece.angle = Math.PI;	//정면 각도 세팅
		myGamePiece.x = 50;
		myGamePiece.y = 300;
		console.log("3~4 세팅");
	}	      
    //[4번]
	if (myGamePiece.x== 50 && myGamePiece.y >= 300 && myGamePiece.y <= 350) {		
		myGamePiece.speed=1; 															
		console.log("4번 이동(직선)");
	}   
    //======4~5 세팅 구간 
	if (myGamePiece.x == 50  && myGamePiece.y == 350) {
		myGamePiece.angle = Math.PI;	//정면 각도 세팅
		myGamePiece.x = 50;
		myGamePiece.y = 350;
		console.log("4~5 세팅");
	}	 
    //[5번]
	if (myGamePiece.x >= 49 && myGamePiece.x <= 95 && myGamePiece.y >= 350 && myGamePiece.y <= 398) {
		myGamePiece.moveAngle = -1.2;	//곡선 각도 세팅 
		myGamePiece.speed=1; 		
		console.log("5번 이동(곡선)");
	}	    
    //======5~6 세팅 구간 
	if (myGamePiece.x <= 96  && myGamePiece.y <= 398 && myGamePiece.y >= 397) {
		myGamePiece.angle = Math.PI / 2;	//정면 각도 세팅
		myGamePiece.x = 96;
		myGamePiece.y = 398;
		console.log("5~6 세팅");
	}	
    //[6번]
	if (myGamePiece.x >= 96 && myGamePiece.x <= 127 && myGamePiece.y >= 398 && myGamePiece.y <= 420) {
		myGamePiece.moveAngle = 1.7;	//곡선 각도 세팅 
		myGamePiece.speed=1; 		
		console.log("6번 이동(곡선)");
	}	       
    //[7번]
	if (myGamePiece.x <= 140 && myGamePiece.x >= 127 && myGamePiece.y >= 420 && myGamePiece.y <= 430) {		
		myGamePiece.speed=1; 															
		console.log("7번 이동(직선)");
	}           
    //[8번]
	if (myGamePiece.x >= 127 && myGamePiece.x <= 155 && myGamePiece.y >= 430 && myGamePiece.y <= 450) {
		myGamePiece.moveAngle = -1.9;	//곡선 각도 세팅 
		myGamePiece.speed=1; 		
		console.log("8번 이동(곡선)");
	}	 
    //======8~9 세팅 구간 
	if (myGamePiece.x <= 155 && myGamePiece.y <= 450 && myGamePiece.y >= 449) {
		myGamePiece.angle = Math.PI / 2;	//정면 각도 세팅
		myGamePiece.x = 155;
		myGamePiece.y = 450;
		console.log("8~9 세팅");
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