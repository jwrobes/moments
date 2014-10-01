Signin = {
	init: function() {
		$('.js-sign-in').on('click',jQuery.proxy(this.showSignInModule,this));
		$('form#sign_up_user').on('submit',this.registerUser);
		$('form#sign_in_user').on('submit',this.signInUser);
	},
	signInUser: function(e) {
		e.preventDefault();
		FlashErrors.clearErrors();
    var $form = $(this);
    $.ajax({
      url: $form.prop('action'),
      type: $form.prop('method'),
      data: $form.serialize()
    }).done(function(data) {
      if (data.success) {
    		location.reload();
			}
			else {
				FlashErrors.insertLoginError(data.errors);
				
			}
    }).error(function(xhr) {
    	console.log('server error');
    })
	},
	registerUser: function(e) {
		e.preventDefault();
		FlashErrors.clearErrors();
    var $form = $(this);
    $.ajax({
      url: $form.prop('action'),
      type: $form.prop('method'),
      data: $form.serialize()
    }).done(function(data) {
        if (data.success) {
				location.reload();
			}
			else {
				FlashErrors.insertErrors(data.errors);
			}
    }).error(function(xhr) {
       	console.log('server error');
    })
	},
	showSignInModule: function(){
		event.preventDefault();
		$('.sign-up-overlay').removeClass('is-hidden');
		$('body').on('click.hideSignIn', this.hideSignIn)
		this.bindAllSignInEvents();
	},
	hideSignIn: function(e){
		if (e.target.className === "sign-up-overlay") {
			FlashErrors.clearErrors();
			$('.signin-select').removeClass('is-hidden').css('display','inline-block');
			$('.signup-select').addClass('is-hidden').css('display','');
			$('.sign-up-overlay').addClass('is-hidden');
 			$('body').unbind();
		}
	},
	bindAllSignInEvents: function () {
		$('.new-user').on('click',this.showSignUp)
		$('.current-user').on('click',this.showSignIn)
	},
	showSignUp: function() {
		event.preventDefault();
		$('.signup-select').slideDown(600);
		$('.signin-select').slideUp(600);
	},
	showSignIn: function() {
		event.preventDefault();
		$('.signup-select').slideUp(600);
		$('.signin-select').slideDown(600);
	}
}

FlashErrors = {

	insertErrors: function(errors) {
		var inputKey = {
			'email':'Email ',
			'phone_number':'Phone number ',
			'password':'Password ',
			'password_confirmation':'Password confirmation '
		};
		for ( var key in errors ) {
			var errorMessages = FlashErrors.createErrorsString(errors[key], key,inputKey)
			var klass = '.user-' + key + '-errors'
			$(klass).html(errorMessages)
			$(klass).show()
		}
	},
	createErrorsString: function(errorArray, key, inputKey) {
		return errorArray.map(function(error){
			return inputKey[key] + error}).join('\n')
	},
	insertLoginError: function(errors) {
		$('.user-login-errors').html(errors[0]);
		$('.user-login-errors').show();
	},
	clearErrors: function(){
		$('.user-errors').html("");
		$('.user-errors').hide();
	},
	insertStartTimeError: function(errors) {
	$('.user-start_time-errors').html(errors[0]);
	$('.user-start_time-errors').show();
},
	insertEndTimeError: function(errors) {
	$('.user-end_time-errors').html(errors[0]);
	$('.user-end_time-errors').show();
},
	insertMomentsToggleError: function(errors) {
		$('.moments-toggle-errors').html(errors[0]);
		$('.moments-toggle-errors').show();
	},
	clearToggleErrors: function(){
		$('.moments-toggle-errors').html("");
		$('.moments-toggle-errors').hide();
	},

}

