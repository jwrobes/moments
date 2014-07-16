
$(document).ready(function(){
  setTimeZone.init()
  skrollr.init({
  smoothScrolling: false,
  mobileDeceleration: 0.004
});
})

var setTimeZone = {
	init: function() {
		var timeZone = jstz.determine();
	document.cookie = 'jstz_time_zone='+timeZone.name()+';';
	}
}

