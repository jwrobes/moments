// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//= require pickadate/picker 
//= require pickadate/picker.time 
//= require ToggleSwitch.js

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
