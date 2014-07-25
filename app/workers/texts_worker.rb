class TextsWorker

	@queue = :check_for_texts

 def self.perform
		client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

		current_moments = Moment.where("time = ?", Time.zone.now.change(:sec => 0))
		missed_moments = Moment.where("time < ? AND sent = ?", Time.zone.now.change(:sec => 0),false)
 		moments_to_send = current_moments + missed_moments
 		moments_to_send.uniq! { |moment| moment.user_id }
 		moments_to_send.each do |moment|
	 		client.account.messages.create({:to=>"+1"+"#{moment.phone_number}", :from =>ENV['TWILIO_PHONE_NUMBER'], :body => moment.message})
	 		moment.update(sent: true)
 		end
  end


end
