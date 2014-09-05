

var initialize = function() {
	Time.init()
  setTimeZone.init()
  Message.init()
  Signin.init()
  // switcher.init()
 
  skrollr.init({
  smoothScrolling: false,
  mobileDeceleration: 0.004
 });

  userToggle.init()
}

var setTimeZone = {
	init: function() {
		var timeZone = jstz.determine();
	document.cookie = 'jstz_time_zone='+timeZone.name()+';';
	}
}

$(document).ready(initialize)
$(document).on('page:load',initialize)
