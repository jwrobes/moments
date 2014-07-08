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
		@client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
		@message = @client.account.messages.create({:to=>"+1"+"#{number}", :from =>"1"+ENV['TWILIO_PHONE_NUMBER'], :body => "#{message}" })
		redirect_to '/'
	end
end

