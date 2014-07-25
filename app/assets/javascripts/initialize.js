$(document).ready(function(){
  Time.init()
  setTimeZone.init()
  // switcher.init()
  userToggle.init()
  skrollr.init({
  smoothScrolling: false,
  mobileDeceleration: 0.004
 });
	$momentSwitch = new ToggleSwitch(document.getElementById('cb'), 'ON', 'OFF');
	if (document.getElementById('cb').classList.contains("on")) {
		$momentSwitch.on()
	}
})


var setTimeZone = {
	init: function() {
		var timeZone = jstz.determine();
	document.cookie = 'jstz_time_zone='+timeZone.name()+';';
	}
}
