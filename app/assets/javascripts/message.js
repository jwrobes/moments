

var Message = {
	init: function () {
		$('#message_input').on('ajax:success', this.appendMessage);
		$('#message_input').on('ajax:error', this.appendError);
	},
	appendMessage: function (e,data) {
		$('#message_body').html(data.message)
	},
	appendError: function (e,data) {
		debugger
		console.log(data)
	}
}



