require 'twilio-ruby'

class TwilioController < ApplicationController

	skip_before_action :verify_authenticity_token

	def index
	
	end

	def send_text_message
		number_to_send_to = params[:number_to_send_to]
		
		@twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
		@twilio_client.account.sms.message.create(
			:from => "+1#{ENV['TWILIO_PHONE_NUMBER']}",
			:to => number_to_send_to,
			:body => "This is an message. It gets send to"
			)
	end

end

