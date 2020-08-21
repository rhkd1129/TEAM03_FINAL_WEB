$('#menu_tab').click(function() {
	$(this).css({
		'border' : '2px solid #fd5858',
		'background-color' : '#f7c9c9',
	})
	$('#review_tab').css({
		'background-color' : '#ffffff',
		'border' : '2px solid #DBDBDB',
	})
	
	$.ajax({
		type : "get", 
		url : "customer_mobile_order.do?rno="+rno,
		success : function(result) {
			$(".restaurant_info_main").html(result);
		}
	});
	
});


$('#review_tab').click(function() {
	$(this).css({
		'border' : '2px solid #fd5858',
		'background-color' : '#f7c9c9',
	})
	$('#menu_tab').css({
		'background-color' : '#ffffff',
		'border' : '2px solid #DBDBDB',
	})
	
	$.ajax({
		type : "get", 
		url : "customer_mobile_review.do?rno="+rno,
		success : function(result) {
			$(".restaurant_info_main").html(result);
		}
	});
	
});




