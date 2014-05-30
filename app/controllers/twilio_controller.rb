require 'twilio-ruby'

class TwilioController < ApplicationController
	include Webhookable

	after_filter :set_header

	skip_before_action :verify_authenticity_token

	def voice
		response = Twilio::TwiML::Response.new do |r|
			r.say "Hey Mofo.  It's time to get your moment one"
				r.Play "http://linode.rabasa.com/cantina.mp3"
		end
		render_twiml response
	end

	def send_sms
		message = params[:message]
		number = params[:number]

		account_sid = "AC90d2dcc4e6f5a0b4cf58dbb6008bbdc4"
		auth_token = "a58cd6e9e716fa2446636f6a8b4087db"
		# twilio_phone_number = "5106296985"
	
		@client = Twilio::REST::Client.new account_sid, auth_token
		@message = @client.account.messages.create({:to=>"+1"+"#{number}", :from =>"+15106296985", :body => "#{message}" })
		redirect_to '/'
	end
end

