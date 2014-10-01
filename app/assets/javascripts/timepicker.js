
var TimePicker = {
	init: function () {
		$('#time-setups').on('ajax:success', this.appendTime);
		$('#time-setups').on('ajax:error', this.appendError);
		$('.start_time').pickatime();
		$('.end_time').pickatime();
	},
	appendTime: function (e,data) {
	 if (data.success) {
	 	
	 		if ($('#start_time').length === 0) {
 				$('.js-start-time').html('Your moments will start at <span class="time-form-highlight" id="start_time">' + data.start_time + '</span>')
 				$('.js-end-time').html('Your moments will start at <span class="time-form-highlight" id="end_time">' + data.end_time + '</span>')
	 		}
	 		else {
	 			$('#start_time').html(data.start_time);
				$('#end_time').html(data.end_time);
	 		}
  		FlashErrors.clearErrors();
			if (data.start_time != "" && data.end_time != "") {
				$('.form-toggle-moments').show();	
			}
			else {
					$('.form-toggle-moments').hide();
			}
			
		}
		else {
			FlashErrors.clearErrors();
			if (data.errors.start_time) { 
				FlashErrors.insertStartTimeError(data.errors.start_time);
				$('#start_time').html(data.start_time);
				$('#end_time').html(data.end_time);
				$('.form-toggle-moments').hide();
			}	
			if (data.errors.end_time) {
				FlashErrors.insertEndTimeError(data.errors.end_time);
				$('#start_time').html(data.start_time);
				$('#end_time').html(data.end_time);
				$('.form-toggle-moments').hide();
			}	
			if (data.errors.bad_times) {
				FlashErrors.insertEndTimeError(data.errors.bad_times);
				$('#start_time').html(data.start_time);
				$('#end_time').html(data.end_time);
				$('.form-toggle-moments').hide();
			}		
		}				

	},
	appendError: function (e,data) {
		console.log(data);
	},

}



