require 'twilio-ruby'

class TwilioController < ApplicationController

	skip_before_action :verify_authenticity_token

	def index
	
	end

	def send_text_message
		number_to_send_to = params[:number_to_send_to]
		
		twilio_sid = "PN523cf9642e9179e2dd3d78040934e993"
		twilio_token = "a58cd6e9e716fa2446636f6a8b4087db"
		twilio_phone_number = "5106296985"

		@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
		@twilio_client.account.sms.message.create(
			:from => "+1#{twilio_phone_number}",
			:to => number_to_send_to,
			:body => "This is an message. It gets send to"
			)
	end

end

