

var Message = {
	init: function () {
		$('#message_input').on('ajax:success', this.appendMessage);
		$('#message_input').on('ajax:error', this.appendError);
	},
	appendMessage: function (e,data) {
		$('#message-text').html(data.message)
	},
	appendError: function (e,data) {
		console.log(data)
	}
}



