class TextsWorker
	include Sidekiq::Worker
	include Sidetiq::Schedulable


 recurrence { minutely }

  
 def perform
 		
		client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

		current_moments = Moment.where("time = ?", Time.zone.now.change(:sec => 0))
 		puts "We're running baby Yes We Are"
 		puts "The time is now:"
 		puts Time.zone.now.change(:sec => 0)
 		puts "*" * 50
 		puts current_moments.size
 		puts current_moments.first
 		current_moments. each do |moment|
 			puts "we're in the current moment"
	 		client.account.messages.create({:to=>"+1"+"#{moment.phone_number}", :from =>ENV['TWILIO_PHONE_NUMBER'], :body => moment.message})
	 
 		end
  end


end
