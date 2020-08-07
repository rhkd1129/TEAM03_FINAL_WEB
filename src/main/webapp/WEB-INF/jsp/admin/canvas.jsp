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
             background-color: #272b30;
         }
      </style>
      <script>
         var car1;
         var car2;
         var car3;
      var destinationA;
        var destinationB;
        var destinationC;
        var destinationD;
        var destinationMiddle;
        var destination;
         function startMap() { //map이 초기화될 때 차 객체 생성
             mapArea.start();
             destinationA = new component(400,50,"white",0," A");
             destinationB = new component(100,100,"white",0," B");
             destinationC = new component(450,300,"white",0," C");
             destinationD = new component(400,450,"white",0," D");         
             destinationMiddle = new component(250,250,"white",0," D");
             destination=destinationC;
             car1 = new component(150, 50, "red", 10,"RACER1");
             car2 = new component(150, 50, "yellow", 10,"RACER2");
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
             },
             stop : function() {
        clearInterval(this.interval);
    }
         }
         function setdestination(text){
               console.log(text);
                switch(text){
                      case 'A':
                     destination= destinationA;
                        break;
                        case 'B':
                     destination= destinationB;
                        break;
                        case 'C':
                     destination= destinationC;
                        break;
                        case 'D':
                     destination= destinationD;
                        break;
                        default:
                     destination= destinationMiddle;
                        break;
                 }
            
         }
         function component(x, y, color, radius,text) {
             this.radius = radius;
             this.x = x;
             this.y = y;
             this.text=text;
          this.speed = 1;
         this.angle = 0;
             this.update = function() {                
                ctx = mapArea.context;
                ctx.beginPath();
                ctx.fillStyle = color;
                if(this.radius!=0){
                   ctx.arc(this.x, this.y, this.radius, 0, 2 * Math.PI);
                }
                else{
                   ctx.fillStyle = "rgba(255, 255, 0, 0.8)";
                   ctx.fillRect(this.x, this.y, 5, 10);
                 ctx.fillStyle = "rgba(0, 128, 0, 1)";
                    ctx.fillRect(this.x, this.y-20, 30, 20);
                }
                ctx.fill();
                ctx.fillStyle = "white";
            ctx.font = "20px Arial Bold";
                if(this.text!=undefined){
               ctx.fillText(this.text,this.x-this.radius/2,this.y+this.radius/2);
                }
                else{
                   ctx.fillText("언디파인드",this.x-this.radius/2,this.y+this.radius/2);
                }
             }
             this.newPos = function() {
              this.y = this.y + Math.sin(this.angle);
                this.angle+=0.01;
                console.log(this.angle);
             }
             this.newPos2 = function() {
              this.y = this.y + Math.cos(this.angle);
                this.angle+=0.01;
                console.log(this.angle);
             }
             this.newPos3 = function() {
              this.y = this.y - Math.cos(this.angle);
                this.angle+=0.01;
                console.log(this.angle);
             }
             this.revnewPos = function() {
              this.y = this.y - Math.sin(this.angle);
                this.angle+=0.01;
                console.log(this.angle);
             }
             this.revnewPos2 = function() {
              this.y = this.y - Math.cos(this.angle);
                this.angle+=0.01;
                console.log(this.angle);
             }
             this.revnewPos3 = function() {
              this.y = this.y + Math.cos(this.angle);
                this.angle+=0.01;
                console.log(this.angle);
             }
             this.revnewPos4 = function() {
              this.y = this.y + Math.sin(this.angle);
                this.angle+=0.01;
                console.log(this.angle);
             }
                 this.crashWith = function(otherobj) {
                  var myx = this.x;
                  var myy = this.y;
                    var myrad = this.radius;
                  var otherx = otherobj.x;
                  var othery = otherobj.y;
                    var otherrad = otherobj.radius;
                    var interx= Math.abs(myx-otherx);
                    var intery= Math.abs(myy-othery);
                    var interrad = myrad+otherrad;
                  var crash = true;
                  if (((interx*interx)+(intery*intery))>(interrad*interrad)) {
                      crash = false;
                  }
                  return crash;
    }
         }
         
         //
         function updateMapArea() {
         mapArea.clear();
            if(car1.flag){
               console.log("car1의 flag는 개인주의야")
            }
           if (car1.crashWith(destination)) {
                    car1.flag=true;
                } else {
                    
                    if(car1.x<=400&&car1.y<=50){
                    console.log("조건1");
                    car1.angle= 0;
                    car1.x += 1;
               }
              else if(car1.x>400 && car1.x<450&& car1.y<70){
                    console.log("조건2");
                    car1.x += 0.8;
                   car1.newPos();
                }
              else if(car1.x>400&&car1.y>60&&car1.y<420){
                    console.log("조건3");
                    car1.angle= 0;
                    car1.y +=1;
               }
               else if(car1.x>400 && car1.y<450){
                     console.log("조건4");
                   car1.x -= 1;
                    car1.newPos2();
            }
               else if(car1.x>=150 &&car1.x<430 && car1.y>410){
                   console.log("조건5");
                    car1.angle= 0;
                   car1.x -= 1;
            }
                else if(car1.x>120 &&car1.x<150 && car1.y>410){
                   console.log("조건6");
                    car1.newPos3();
                   car1.x -= 0.8;
                    console.log(car1.x+","+car1.y);
            }
                else if(car1.x>50 &&car1.x<130 && car1.y>350){
                   console.log("조건7");
                    car1.newPos3();
                   car1.x -= 1.5;
            }
                else if(car1.x<60 && car1.y>300){
                   console.log("조건8");
                    car1.angle= 0;
                   car1.y -= 1;
            }
                else if(car1.x<100 && car1.y<=300 && car1.y>150){
                   console.log("조건9");
                   car1.y -= 1;
                    car1.x += 0.33333;
            }
                else if(car1.x>50 && car1.x<100 && car1.y>90 &&car1.y<=150){
                   console.log("조건10");
                   car1.y -= 1;
            }
                else if(car1.x>=50 &&car1.x<=160 && car1.y>30 && car1.y<=100){
                   console.log("조건11");
                   car1.x += 0.8;
                    car1.newPos3();
            }
                }
              
              
                
                if(car2.x>=130&&car2.x<=420&&car2.y<=70){
                    console.log("역조건1");
                    car2.angle= 0;
                    car2.x -= 1;
                    car2.y+=(50-car2.y)/100
               }
                else if(car2.x>=90 &&car2.x<=160 && car2.y>30 && car2.y<=100){
                   console.log("역조건11");
                   car2.x -= 0.6;
                    car2.revnewPos3();
            }
                
                else if(car2.x>=50 && car2.x<=120 && car2.y>=100 && car2.y<150){
                   console.log("역조건10");
                    car2.x+=(100-car2.x)/50
                   car2.y += 1;
            }
                else if(car2.x<=200 &&car2.x>=50 && car2.y<=300 && car2.y>=150){
                   console.log("역조건9");
                   car2.y += 1;
                    car2.x -= 0.33333;
            }
                else if(car2.x<60 && car2.y>280&& car2.y<=380){
                   console.log("역조건8");
                    car2.angle= 0.1;
                    car2.x+=0.1;
                    car2.x+=(50-car2.x)/10;
                   car2.y += 1;
            }
                else if(car2.x>=50 &&car2.x<130 && car2.y>340){
                   console.log("역조건7");
                    car2.revnewPos4();
                   car2.x += 0.8;
            }
                else if(car2.x>130 &&car2.x<150 && car2.y>380){
                   console.log("역조건6");
                    car2.revnewPos4();
                   car2.x += 0.9;
            }
               else if(car2.x>=150 &&car2.x<=410 && car2.y>410){
                   console.log("역조건5");
                    car2.angle= 0.8;
                   car2.x += 1;
                    car2.y+=(450-car2.y)/100
            }
               else if(car2.x<=450 && car2.x>400 && car2.y>=410 && car2.y<460){
                     console.log("역조건4");
                   car2.x += 0.9;
                    car2.revnewPos2();
            }
              else if(car2.x>400&&car2.y>90&&car2.y<450){
                    console.log("역조건3");
                    car2.angle= 0.3;
                    car2.y -=1;
               }
              else if(car2.x>410 && car2.x<=460 && car2.y<130){
                    console.log("역조건2");
                    car2.x -= 0.8;
                   car2.revnewPos2();
                }
                drawMap();
              
              destinationA.update();
              destinationB.update();
              destinationC.update();
              destinationD.update();
           car1.update();
              car2.update();
            }
         
         function drawMap() {
              var ctx = mapArea.context;//차이점 
               
              var scaleValueWidth = mapArea.canvas.width / 500
              var scaleValueHeight = mapArea.canvas.height / 500
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
         function function2(){
         }
      </script>
   </head>
   <body onload="startMap()">
   <button onclick="setdestination('A')"> A</button>
   <button onclick="setdestination('B')"> B</button>
   <button onclick="setdestination('C')"> C</button>
   <button onclick="setdestination('D')"> D</button>
   <button onclick="setdestination('Middle')"> 안해</button>
   </body>
</html>