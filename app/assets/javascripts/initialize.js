var initialize = function() {
  skrollr.init().destroy();
	TimePicker.init();
  setTimeZone.init();
  Message.init();
  Signin.init();
  setSkrollr.init();
  userToggle.init();
  setTimeZone.init();
}

var setTimeZone = {
	init: function() {
		var timeZone = jstz.determine();
	document.cookie = 'jstz_time_zone='+timeZone.name()+';';
	}
}

var setSkrollr = {
  init: function() {
    if ($(window).width() > 767) {
      skrollr.init({
      smoothScrolling: false,
      mobileDeceleration: 0.004
      });
    };
    $(document).on('page:load',initialize)
    $(window).on('resize', function () {
      if ($(window).width() <= 767) {
        skrollr.init().destroy(); 
      }
      if ($(window).width() >= 767) {
        skrollr.init({
        smoothScrolling: false,
        mobileDeceleration: 0.004
        });
      }
    });
  }
}

$(document).ready(initialize)

