$(document).ready(function() {
	var currentReview;
	
	$(".badReview").on('click', function(){
		currentReview = this.value;
		$('#confirm_review').modal('show');
	});

	$("#btnConfirmReview").on('click', function(){
		$.ajax({
			type : 'POST',
			url : '/meetups/' + currentReview + '/reviews?positive=false',
			success : function(data) {},
			error : function() {}
		});
		
		$(".btn[value="+currentReview+"]").attr("disabled", true);
		$('#confirm_review').modal('hide');
	});

	$(".goodReview").on('click', function(){
		$.ajax({
			type : 'POST',
			url : '/meetups/' + this.value + '/reviews?positive=true',
			success : function(data) {},
			error : function() {}
		});
		$(".btn[value="+this.value+"]").attr("disabled", true);
	});

});