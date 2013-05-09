$(document).ready(function() {
	
	$(".badReview").on('click', function(){
		$.ajax({
			type : 'POST',
			url : '/meetups/' + this.value + '/reviews?positive=false',
			success : function(data) {},
			error : function() {}
		});
		$(".btn[value="+this.value+"]").addClass("disabled")
	});

	$(".goodReview").on('click', function(){
		$.ajax({
			type : 'POST',
			url : '/meetups/' + this.value + '/reviews?positive=true',
			success : function(data) {},
			error : function() {}
		});
		$(".btn[value="+this.value+"]").addClass("disabled")
	});

});