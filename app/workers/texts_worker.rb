class TextsWorker
	include Sidekiq::Worker
	sidekiq_options :retry => false
	include Sidetiq::Schedulable


 # recurrence { minutely }

recurrence { hourly.minute_of_hour(2,4,6,8,10,12,14,16,18,20,22,24,26,28,32,34,36,38,40,42,44,46,48,50,52,54,56,58)  }
  
 def perform
 		puts "*" * 50 
 		puts "START" * 5
 		puts "*" * 50 
		client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

		current_moments = Moment.where("time = ?", Time.zone.now.change(:sec => 0))
		missed_moments = Moment.where("time < ? AND sent = ?", Time.zone.now.change(:sec => 0),false)
 		moments_to_send = current_moments + missed_moments
 		puts "The time is now:"
 		puts Time.zone.now.change(:sec => 0)
 
 		puts "moments to send out count"
 		puts moments_to_send.count
 		moments_to_send. each do |moment|
	 		puts moment.message + "message id" + moment.id.to_s
	 		# client.account.messages.create({:to=>"+1"+"#{moment.phone_number}", :from =>quitENV['TWILIO_PHONE_NUMBER'], :body => moment.message})
	 		moment.update(sent: true)
 		end
 		puts "#" * 50 
 		puts "END"* 10
 		puts "#" * 50 
  end


end
