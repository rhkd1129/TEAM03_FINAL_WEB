<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
<!--       <meta http-equiv="Refresh" content="0; URL=/blog/"> -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
      <script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
      <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
      <script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/mapcss.css">








  //---------------------------------------------------------------------------
















  //---------------------------------------------------------------------------
  //공동 사용 (현재 날짜)
  var nowDate = new Date();

  // 즈기요 회원 가입 오늘 날짜
  var todaylist = ${TodayNolist};
  // 즈기요 회원 가입 어제 날짜
  var yester1list = ${Yesterday1Nolist};
  // 즈기요 회원 가입 2일전 날짜
  var yester2list = ${Yesterday2Nolist};
  // 즈기요 회원 가입 3일전 날짜
  var yester3list = ${Yesterday3Nolist};
  // 즈기요 회원 가입 4일전 날짜
  var yester4list = ${Yesterday4Nolist};
  // 즈기요 회원 가입 5일전 날짜
  var yester5list = ${Yesterday5Nolist};
  // 즈기요 회원 가입 6일전 날짜
  var yester6list = ${Yesterday6Nolist};
  // 즈기요 회원 가입 7일전 날짜
  var yester7list = ${Yesterday7Nolist};
  // 즈기요 회원 가입 8일전 날짜
  var yester8list = ${Yesterday8Nolist};
  // 즈기요 회원 가입 9일전 날짜
  var yester9list = ${Yesterday9Nolist};

  //즈기요 가게 등록 오늘 날짜
  var Rtodaylist = ${RTodayNolist};
  // 즈기요 가게 등록 어제 날짜
  var Ryester1list = ${RYesterday1Nolist};
  // 즈기요 가게 등록 2일전 날짜
  var Ryester2list = ${RYesterday2Nolist};
  // 즈기요 가게 등록 3일전 날짜
  var Ryester3list = ${RYesterday3Nolist};
  // 즈기요 가게 등록 4일전 날짜
  var Ryester4list = ${RYesterday4Nolist};
  // 즈기요 가게 등록 5일전 날짜
  var Ryester5list = ${RYesterday5Nolist};
  // 즈기요 가게 등록 6일전 날짜
  var Ryester6list = ${RYesterday6Nolist};
  // 즈기요 가게 등록 7일전 날짜
  var Ryester7list = ${RYesterday7Nolist};
  // 즈기요 가게 등록 8일전 날짜
  var Ryester8list = ${RYesterday8Nolist};
  // 즈기요 가게 등록 9일전 날짜
  var Ryester9list = ${RYesterday9Nolist};

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

  //hichart script---------------------------------------------------------------------------
  /* 즈기요 성장량 계산 */

  //멤버 성장률
  var yes9 = yester9list*33.33;
  var yes8 = yester8list*33.33;
  var yes7 = yester7list*33.33;
  var yes6 = yester6list*33.33;
  var yes5 = yester5list*33.33;
  var yes4 = yester4list*33.33;
  var yes3 = yester3list*33.33;
  var yes2 = yester2list*33.33;
  var yes1 = yester1list*33.33;
  var yes0 = todaylist*33.33;

  //가게 성장률
  var Ryes9 = Ryester9list*33.33;
  var Ryes8 = Ryester8list*33.33;
  var Ryes7 = Ryester7list*33.33;
  var Ryes6 = Ryester6list*33.33;
  var Ryes5 = Ryester5list*33.33;
  var Ryes4 = Ryester4list*33.33;
  var Ryes3 = Ryester3list*33.33;
  var Ryes2 = Ryester2list*33.33;
  var Ryes1 = Ryester1list*33.33;
  var Ryes0 = Rtodaylist*33.33;

  //멤버 , 가게 성장률 평균
  var chart0 = (yes0 + Ryes0) / 2;
  var chart1 = (yes1 + Ryes1) / 2;
  var chart2 = (yes2 + Ryes2) / 2;
  var chart3 = (yes3 + Ryes3) / 2;
  var chart4 = (yes4 + Ryes4) / 2;
  var chart5 = (yes5 + Ryes5) / 2;
  var chart6 = (yes6 + Ryes6) / 2;
  var chart7 = (yes7 + Ryes7) / 2;
  var chart8 = (yes8 + Ryes8) / 2;
  var chart9 = (yes9 + Ryes9) / 2;

  //3분야 평균점[이동평균]
  var realchart1 = (chart0 + chart1 + chart2) / 3
  var realchart2 = (chart1 + chart2 + chart3) / 3
  var realchart3 = (chart2 + chart3 + chart4) / 3
  var realchart4 = (chart3 + chart4 + chart5) / 3
  var realchart5 = (chart4 + chart5 + chart6) / 3
  var realchart6 = (chart5 + chart6 + chart7) / 3
  var realchart7 = (chart6 + chart7 + chart8) / 3
  var realchart8 = (chart7 + chart8 + chart9) / 3

  //소수점 반올림
  chart9 = Math.round(chart9);
  realchart8 = Math.round(realchart8);
  realchart7 = Math.round(realchart7);
  realchart6 = Math.round(realchart6);
  realchart5 = Math.round(realchart5);
  realchart4 = Math.round(realchart4);
  realchart3 = Math.round(realchart3);
  realchart2 = Math.round(realchart2);
  realchart1 = Math.round(realchart1);
  chart0 = Math.round(chart0);

  //Progress bar ---------------------------------------------------------------------------
  //최근 10일간 신규 회원 등록 수
  var totalmembernum = ${TodayNolist} + ${Yesterday1Nolist} + ${Yesterday2Nolist} + ${Yesterday3Nolist} + ${Yesterday4Nolist}
  +${Yesterday5Nolist} + ${Yesterday6Nolist} + ${Yesterday7Nolist} + ${Yesterday8Nolist} + ${Yesterday9Nolist};
  var persenttotalmember = (totalmembernum / 100) * 100;
  //회원 데이터 * px 값
  var persentpx = persenttotalmember * 7.4;

  $("#onebarpersent").css("width",String(persentpx));
  $('.change_greeting1').text("7월 회원 목표량 : " + String(persenttotalmember) + "%");

  //최근 10일간 신규 가게 등록 수
  var Rtotalmembernum = ${RTodayNolist} + ${RYesterday1Nolist} + ${RYesterday2Nolist} + ${RYesterday3Nolist} + ${RYesterday4Nolist}
  +${RYesterday5Nolist} + ${RYesterday6Nolist} + ${RYesterday7Nolist} + ${RYesterday8Nolist} + ${RYesterday9Nolist};
  var Rpersenttotalmember = (Rtotalmembernum / 100) * 100;
  //가게 데이터 * px 값
  var Rpersentpx = Rpersenttotalmember * 7.4;

  $("#twobarpersent").css("width",String(Rpersentpx));
  $('.change_greeting2').text("7월 가게 목표량 : " + String(Rpersenttotalmember) + "%");


  // 즈기요 성장 차트------------------------------------------------
  Highcharts.chart('container2', {
      chart: {
          type: 'line'
      },
      title: {
          text: ''
      },
      subtitle: {
          text: '그룹 성장 현황'
      },
      xAxis: {
          categories: [nineyesterDate , eightyesterDate , sevenyesterDate , sixyesterDate , fiveyesterDate , fouryesterDate ,
             threeyesterDate , twoyesterDate , yesterDate , todayDate]
      },
      yAxis: {
          title: {
              text: '성장량 (1일 기준 : 100)'
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
      plotOptions: {
          line: {
              dataLabels: {
                  enabled: true
              },
              enableMouseTracking: false
          }
      },
      series: [{
          name: '성장량',
          data: [chart9, realchart8, realchart7, realchart6, realchart5, realchart4, realchart3, realchart2, realchart1, chart0]
      }, {
          name: '매출액',
          data: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
      }]
  });


  // 회원수 , 가게수 차트 + 바------------------------------------------------
  Highcharts.chart('container1', {

     chart: {
       type: 'column',
       styledMode: true
     },
     subtitle: {
         text: '이용자 현황'
     },

     title: {
       text: ''
     },

     //추가 항목 (중요★★★★★)
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
       data: [yester9list, yester8list, yester7list, yester6list, yester5list, yester4list, yester3list, yester2list, yester1list, todaylist]
     }, {
      name: '가게 수',
       data: [Ryester9list, Ryester8list, Ryester7list, Ryester6list, Ryester5list, Ryester4list, Ryester3list, Ryester2list, Ryester1list, Rtodaylist],
       yAxis: 1
     }]

   });




















  //--------------------------------------------------------------------------------------

  //차량 도착 시 자동 문자 전송 [테스트] start =======================================================
  $(".carimage1").hide();
  $(".carimage2").hide();
  $(".carimage3").hide();
  $(".carimage4").hide();
  $(".carimage5").hide();
  $(".carimage6").hide();
  $(".carimage7").hide();
  $(".carimage8").hide();
  $(".carimage9").hide();
  $(".carimage10").hide();
  $(".carimage11").hide();


     $(".flagimage").click(function(){
     stime = setTimeout(time1, 1000);
     function time1(){
        $(".light1").css("background", "red");
        $(".carimage1").show();

        $(".light11").css("background", "green");
        $(".carimage11").hide();
        setTimeout(time2, 1000);
     }

     function time2(){
        $(".light2").css("background", "red");
        $(".carimage2").show();

        $(".light1").css("background", "green");
        $(".carimage1").hide();

        setTimeout(time3, 1000);
     }

     function time3(){
        $(".light3").css("background", "red");
        $(".carimage3").show();

        $(".light2").css("background", "green");
        $(".carimage2").hide();
        setTimeout(time4, 1000);
     }

     function time4(){
        $(".light4").css("background", "red");
        $(".carimage4").show();

        $(".light3").css("background", "green");
        $(".carimage3").hide();
        setTimeout(time5, 1000);
     }

     function time5(){
        $(".light5").css("background", "red");
        $(".carimage5").show();

        $(".light4").css("background", "green");
        $(".carimage4").hide();
        setTimeout(time6, 1000);
     }

     function time6(){
        $(".light6").css("background", "red");
        $(".carimage6").show();

        $(".light5").css("background", "green");
        $(".carimage5").hide();
        setTimeout(time7, 1000);
     }

     function time7(){
        $(".light7").css("background", "red");
        $(".carimage7").show();

        $(".light6").css("background", "green");
        $(".carimage6").hide();
        setTimeout(time8, 1000);
     }

     function time8(){
        $(".light8").css("background", "red");
        $(".carimage8").show();

        $(".light7").css("background", "green");
        $(".carimage7").hide();
        setTimeout(time9, 1000);
     }

     function time9(){
        $(".light9").css("background", "red");
        $(".carimage9").show();

        $(".light8").css("background", "green");
        $(".carimage8").hide();
        setTimeout(time10, 1000);
     }

     function time10(){
        $(".light10").css("background", "red");
        $(".carimage10").show();

        $(".light9").css("background", "green");
        $(".carimage9").hide();
        setTimeout(time11, 1000);
     }

     function time11(){
        //자동 문자 전송하기
        $("#sendmessage").trigger("click");

        $(".light11").css("background", "red");
        $(".carimage11").show();

        $(".light10").css("background", "green");
        $(".carimage10").hide();
        setTimeout(time1, 1000);
     }

  });

  //차량 도착 시 자동 문자 전송 [테스트] end =======================================================

  /* 페이져 */
  function viewPaging(pageNo) {
     var pageNo = pageNo;
     $.ajax({
        type : "get", // get방식으로 자료를 전달
        url : "${pageContext.request.contextPath}/admin/main.do?pageNo=" +pageNo,
        success : function(result) { // 자료를 보내는것이 성공했을때 출력되는 메시지
           // 댓글목록을 실행한 결과를 가져온다.
           $("#adminmainpage").html(result);
        console.log("고고고1");
        }
     });
  };

  /* 페이져1 */
  function viewPaging1(pageNo1) {
     var pageNo1 = pageNo1;
     $.ajax({
        type : "get", // get방식으로 자료를 전달
        url : "${pageContext.request.contextPath}/admin/main.do?pageNo1=" +pageNo1,
        success : function(result) { // 자료를 보내는것이 성공했을때 출력되는 메시지
           // 댓글목록을 실행한 결과를 가져온다.
           $("#adminmainpage").html(result);

         console.log("고고고2");
        }



     });
  };
  //등록 회원 start------------------------------------------------------------------------------------------------------
  //명단 삭제 취소 버튼------------------------------------------
  $(".closedelete").click(function(){
     $(".checkdelete1").hide();
     $(".opacitybox2").hide();
  });

  //명단 삭제 시 확인 뷰------------------------------------------
  $(".checkdelete1").hide();
  $(".opacitybox2").hide();
  var delectcheck = $("input[name=delectcheck]").val();

  $(".deleteX").click(function(){
     var mid =  $(this).attr("id");

     $(".checkdelete1").show();
     $(".opacitybox2").show();

     $(".gogogo").click(function(){
        delectcheck = $("input[name=delectcheck]").val();
        if(delectcheck == "admin1"){
           alert("등록 회원 제명 완료");
           $(".checkdelete1").hide();
           $(".opacitybox2").hide();
           location.href = "${pageContext.request.contextPath}/admin/cmemberdelete.do?mid=" + mid;

        }else{
           alert("등록 회원 제명 실패");
           $(".checkdelete1").hide();
           $(".opacitybox2").hide();
        }//else

     });//gogo click function
  });//deleteX click function
  //등록 회원 end------------------------------------------------------------------------------------------------------
  //등록 가게 start------------------------------------------------------------------------------------------------------
  //명단 삭제 취소 버튼------------------------------------------
  $(".closedelete2").click(function(){
     $(".checkdelete2").hide();
     $(".opacitybox2").hide();
  });

  //명단 삭제 시 확인 뷰------------------------------------------
  $(".checkdelete2").hide();
  $(".opacitybox2").hide();
  var delectcheck2 = $("input[name=delectcheck2]").val();

  $(".deleteX2").click(function(){
     var rid =  $(this).attr("id");

     $(".checkdelete2").show();
     $(".opacitybox2").show();

     $(".gogogo2").click(function(){
        delectcheck2 = $("input[name=delectcheck2]").val();

        if(delectcheck2 == "admin2"){
           alert("등록 가게 제명 완료");
           $(".checkdelete2").hide();
           $(".opacitybox2").hide();
           location.href = "${pageContext.request.contextPath}/admin/rmemberdelete.do?rid=" + rid;

        }else{
           alert("등록 가게 제명 실패");
           $(".checkdelete2").hide();
           $(".opacitybox2").hide();
        }//else

     });//gogo click function
  });//deleteX click function
  //등록 가게 end------------------------------------------------------------------------------------------------------

  //viewbox1 slide show------------------------------------------
  var slideIndex = 1;
  showDivs(slideIndex);

  function plusDivs(n) {
    showDivs(slideIndex += n);
  }

  function currentDiv(n) {
    showDivs(slideIndex = n);
  }

  function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("demo1");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length}
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" w3-red", "");
    }
    x[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " w3-red";
  }

    
    
    </script>
</html>