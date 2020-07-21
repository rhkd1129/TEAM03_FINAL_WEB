// 페이지 로드시
$('#navtab1').css({
	'background-color' : '#f4001f'
})
$('#navtab2').css({
	'background-color' : '#313535',
})
$(".main1").show();
$(".main2").hide();

$('#navtab1').click(function() {
	$(this).css({
		'background-color' : '#f4001f'
	})
	$('#navtab2').css({
		'background-color' : '#313535',
	})
	$(".main1").show();
	$(".main2").hide();
	$(".content1").show();
	$(".content2").hide();
});

$('#navtab2').click(function() {
	$(this).css({
		'background-color' : '#f4001f'
	})
	$('#navtab1').css({
		'background-color' : '#313535',
	})
	$(".main2").show();
	$(".main1").hide();
	$(".content2").show();
	$(".content1").hide();
});

$('#menu1').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#000000'
	})
	$('#menu2').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu3').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu4').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$.ajax({
		type : "get", 
		url : "owner_order_queue.do",
		success : function(result) { 
			$(".content1").html(result);
		}
	});
});

$('#menu2').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#000000'
	})
	$('#menu1').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu3').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu4').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
});

$('#menu3').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#000000'
	})
	$('#menu1').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu2').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu4').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
});

$('#menu4').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#000000'
	})
	$('#menu1').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu2').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu3').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
});

$('#menu5').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#000000'
	})
	$('#menu6').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu7').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu8').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
});

$('#menu6').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#000000'
	})
	$('#menu5').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu7').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu8').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
});

$('#menu7').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#000000'
	})
	$('#menu5').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu6').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu8').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
});

$('#menu8').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#000000'
	})
	$('#menu5').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu6').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
	$('#menu7').css({
		'background-color' : '#d7dada',
		'color' : '#a6abab'
	})
});

$(".zgiyo").click(function(){
    location.href = "${pageContext.request.contextPath}/home/landingpage.do";
});
