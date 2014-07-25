

// var switcher = {
// 	init: function() {
// 		var checkbox = document.getElementById('cb')
// 		var test = new ToggleSwitch(checkbox, 'ON', 'OFF');
// 		if (checkbox.classList.contains("on")) {
// 			test.on()
// 			}
// 		},
// 		switchOff: function() {
// 			test.off()
// 		},
// 		switchOn: function() {
// 			test.on()
// 		}
// 	}



var userToggle = {
	init: function(){
		$('.moments_toggle').on('click','.toggle',this.toggleMoments)
	},
	toggleMoments: function (event){
		event.preventDefault();
		$.ajax({
			url: '/users/toggle',
			type: 'PUT'
		})
		.success(function(data){
			if (data.moments_on) {
				$('#cb').removeClass('off')
				$('#cb').addClass('on')
				$momentSwitch.on()
			}
			else {
				$('#cb').removeClass('on')
				$('#cb').addClass('off')
				$momentSwitch.off()
			}
		})
		.error(function(data){
		})
	}
}