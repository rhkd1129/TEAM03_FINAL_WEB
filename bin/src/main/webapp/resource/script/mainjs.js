/////////////main script start
/* 하단으로 가기 */
$("#downdowndown").click(function(){
	$('html, footer').scrollTop( $(document).height() );
});
/* 상단으로 가기 */
$("#upupup").click(function(){
	$('html, header').scrollTop(0);
});



	$(".Htext1").click(function() {
		$(".Htext1").css("border", "1px solid #2E2EFE;");
	});

	//Header2 모달창
	$(".boxshow6").hide();
	$(".boxshow5").hide();
	$(".boxshow4").hide();
	$(".boxshow3").hide();
	$(".boxshow2").hide();
	$(".boxshow1").hide();

	/* 사업지원 -------- */
	$(".Header2box6").mouseover(function() {
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();/* slideUp slideDown */

		$(".boxshow6").show();
	});
	$(".boxshow6").mouseover(function() {
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();

		$(".boxshow6").show();
	});
	/* 인재지원 -------- */
	$(".Header2box5").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();

		$(".boxshow5").show();
	});
	$(".boxshow5").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();

		$(".boxshow5").show();
	});
	/* 해외진출지원 -------- */
	$(".Header2box4").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();

		$(".boxshow4").show();
	});
	$(".boxshow4").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();

		$(".boxshow4").show();
	});
	/* 소식·알림 -------- */
	$(".Header2box3").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();

		$(".boxshow3").show();
	});
	$(".boxshow3").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();

		$(".boxshow3").show();
	});
	/* 협회소개 -------- */
	$(".Header2box2").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow1").hide();

		$(".boxshow2").show();
	});
	$(".boxshow2").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow1").hide();

		$(".boxshow2").show();
	});
	/* 회원공간 -------- */
	$(".Header2box1").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();

		$(".boxshow1").show();
	});
	$(".boxshow1").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();

		$(".boxshow1").show();
	});
	/* menuimg - 회원공간 -------- */
	$(".menuimg").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();

		$(".boxshow1").show();
	});
	$(".boxshow1").mouseover(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();

		$(".boxshow1").show();
	});

	//ESC로 Header-center2 숨기기
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 27) {
			$(".boxshow6").hide();
			$(".boxshow5").hide();
			$(".boxshow4").hide();
			$(".boxshow3").hide();
			$(".boxshow2").hide();
			$(".boxshow1").hide();
		}
		;
	}, true);

	//각종 enter키 막기
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
		;
	}, true);

	//모든 Header-center2 숨기기
	$(".boxhidebtn").click(function() {
		$(".boxshow6").hide();
		$(".boxshow5").hide();
		$(".boxshow4").hide();
		$(".boxshow3").hide();
		$(".boxshow2").hide();
		$(".boxshow1").hide();
	});
	
	
// img box-------------------------------------------------------	
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();


$(document).ready(function(){
    
    
    /*****************
     BUILD THE SLIDER
    *****************/
    //set width to be 'x' times the number of slides
    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
    
    //next slide    
    $('#next').click(function(){
        slideRight();
    });
    
    //previous slide
    $('#previous').click(function(){
        slideLeft();
    });
    
 
    
    /*************************
     //*> OPTIONAL SETTINGS
    ************************/
    //automatic slider
    var autoSlider = setInterval(slideRight, 3000);
    
    //for each slide 
    $.each($('#slider-wrap ul li'), function() { 

       //create a pagination
       var li = document.createElement('li');
       $('#pagination-wrap ul').append(li);    
    });
    
    //counter
    countSlides();
    
    //pagination
    pagination();
    
    //hide/show controls/btns when hover
    //pause automatic slide when hover
    $('#slider-wrap').hover(
      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
    );
    
    

});//DOCUMENT READY
    


/***********
 SLIDE LEFT
************/
function slideLeft(){
    pos--;
    if(pos==-1){ pos = totalSlides-1; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
    
    //*> optional
    countSlides();
    pagination();
}


/************
 SLIDE RIGHT
*************/
function slideRight(){
    pos++;
    if(pos==totalSlides){ pos = 0; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
    
    //*> optional 
    countSlides();
    pagination();
}



    
/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
    $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
    $('#pagination-wrap ul li').removeClass('active');
    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}	
// img box-------------------------------------------------------		
	
$(".Himg2").click(function(){
	$(".Himg2").css("border","2px solid #5882FA");
});

//home 화면 가기
$(".Himg1").click(function(){
	  location.href = "${pageContext.request.contextPath}/home/main.do";
});	
	
	
	
	
	
/////////////main script end