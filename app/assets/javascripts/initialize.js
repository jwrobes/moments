

var initialize = function() {
	Time.init()
  setTimeZone.init()
  Message.init()
  Signin.init()
  if ($(window).width() > 767) {
    skrollr.init({
    smoothScrolling: false,
    mobileDeceleration: 0.004
    });
   } 

  userToggle.init();
}

var setTimeZone = {
	init: function() {
		var timeZone = jstz.determine();
	document.cookie = 'jstz_time_zone='+timeZone.name()+';';
	}
}

$(document).ready(initialize)
$(document).on('page:load',initialize)

$(window).on('resize', function () {
    if ($(window).width() <= 767) {
      skrollr.init().destroy(); // skrollr.init() returns the singleton created above
    }
    if ($(window).width() >= 767) {
       skrollr.init({
        smoothScrolling: false,
        mobileDeceleration: 0.004
        });
    }
  });
