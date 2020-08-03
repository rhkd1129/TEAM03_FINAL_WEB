$('#menu_tab').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color': '#000000'
	})
	$('#review_tab').css({
		'color': '#ffffff',
		'background-color' : '#313535',
	})
	
	$.ajax({
		type : "get", 
		url : "customer_r_menu.do?rno="+rno,
		success : function(result) { 
			$(".restaurant_info_main").html(result);
		}
	});
	
});


$('#review_tab').click(function() {
	$(this).css({
		'background-color' : '#ffffff',
		'color': '#000000'
	})
	$('#menu_tab').css({
		'color': '#ffffff',
		'background-color' : '#313535',
	})
	
	$.ajax({
		type : "get", 
		url : "customer_r_review.do?rno="+rno,
		success : function(result) { 
			$(".restaurant_info_main").html(result);
		}
	});
	
});




