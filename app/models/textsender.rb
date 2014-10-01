class TextsSender

	def initialize(moments_to_send)
		@moments_to_send = moments_to_send
		@client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
	end	

	def send
		update_moments_as_sent
		send_updated_moments
	end

	private

	def update_moments_as_sent
		@moments_to_send.each do |moment|
			moment.update(sent: true) 		
 		end
	end

	def send_updated_moments
		@moments_to_send.each do |moment| 
 			@client.account.messages.create({:to=>"+1"+"#{moment.phone_number}", :from =>ENV['TWILIO_PHONE_NUMBER'], :body => moment.message})
 		end
	end


end