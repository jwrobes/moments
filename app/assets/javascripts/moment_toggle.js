var momentsActivateController = {
	toggleMomentsParams: {
		url: '/users/toggle',
		type: 'PUT'
	},
	activateToggleDone: function () {
			console.log(data.moments_on)
			if (data.moments_on) {
				console.log("turning it on")
				$('#cb').removeClass('off')
				$('#cb').addClass('on')
				$momentSwitch.on()
			}
			else {
				console.log("turning it off")
				$('#cb').removeClass('on')
				$('#cb').addClass('off')
				$momentSwitch.off()
			}
	}
}

var userToggle = {
	init: function(){
		$('.moments_toggle').on('click','.toggle',this.toggleMoments)
	},
	toggleMoments: function (event){
		event.preventDefault();
		$.ajax(momentsActivateController.toggleMomentsParams)
		.success(function(data){momentsActivateController.activateToggleDone})
		.error(function(data){
		})
	}
}
