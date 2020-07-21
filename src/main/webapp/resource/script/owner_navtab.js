$('#navtab1').click(function() {
	$(this).css({
		'background-color' : '#f4001f'
	})
	$('#navtab2').css({
		'background-color' : '#313535',
	})
	$.ajax({
		type : "get",
		url : "/project/owner/owner_navtab.do?tabNo=1",
		success : function(result) { 
			$("#ownermain").html(result);
		}
	});
	console.log("실행")
});

$('#navtab2').click(function() {
	$(this).css({
		'background-color' : '#f4001f'
	})
	$('#navtab1').css({
		'background-color' : '#313535',
	})
	$.ajax({
		type : "get",
		url : "/project/owner/owner_navtab.do?tabNo=2",
		success : function(result) { 
			$("#ownermain").html(result);
		}
	});
});

$('#menu1').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#242929'
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
});

$('#menu2').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color' : '#242929'
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
		'color' : '#242929'
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
		'color' : '#242929'
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




