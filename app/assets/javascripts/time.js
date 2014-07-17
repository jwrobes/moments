
var Time = {
	init: function () {
		$('#time-setups').on('ajax:success', this.appendTime);
		$('#time-setups').on('ajax:error', this.appendError);
	},
	appendTime: function (e,data) {
		$('#start_time').replaceWith('<h3 id="start_time"> Selected Start Time: ' + data.start_time)
		$('#end_time').replaceWith('<h3 id="end_time"> Selected End Time: ' + data.end_time)
	},
	appendError: function (e,data) {
		console.log(data)
	}
}




