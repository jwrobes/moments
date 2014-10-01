var momentsActivateController = {
	toggleMomentsParams: {
		url: '/users/toggle',
		type: 'PUT'
	},
	activateToggleDone: function (errors) {
			if (data.moments_on) {
				FlashErrors.clearToggleErrors();
				$('#cb').removeClass('off')
				$('#cb').addClass('on')
				$momentSwitch.on()
			}
			else {
				FlashErrors.clearToggleErrors();
				FlashErrors.insertMomentsToggleError(data.errors)
				$('#cb').removeClass('on')
				$('#cb').addClass('off')
				$momentSwitch.off()
			}
	}
}

var userToggle = {
	init: function(){
		this.checkforTimes();
	$("[name='my-checkbox']").bootstrapSwitch();
	$('.form-toggle-moments').on('click',this.toggleMoments)

	},
	toggleMoments: function (event){
		event.preventDefault();
			$.ajax(momentsActivateController.toggleMomentsParams)
			.success(function(data){momentsActivateController.activateToggleDone})
			.error(function(data){
			})
	},
	isUserTimeEntered: function(){
		var start_time = $('#start_time').html().length;
		var end_time = $('#end_time').html().length;
		return start_time > 0 && end_time > 0
	},
	checkforTimes: function () {
			if ($('#start_time').html()!= undefined && $('#start_time').html() != "" && $('#end_time').html() != undefined && $('#end_time').html() != "") {
				$('.form-toggle-moments').show();
			}
	}
}
