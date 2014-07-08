class TextsWorker
	include Sidekiq::Worker
	include Sidetiq::Schedulable


 recurrence { hourly }

  
 def perform
 		account_sid = "AC90d2dcc4e6f5a0b4cf58dbb6008bbdc4"
		auth_token = "a58cd6e9e716fa2446636f6a8b4087db"
 		
		client = Twilio::REST::Client.new account_sid, auth_token

		current_moments = Moment.where("time = ?", Time.zone.now.change(:sec => 0))
 		puts "We're running baby Yes We Are"
 		puts "The time is now:"
 		puts Time.zone.now.change(:sec => 0)
 		puts "*" * 50
 		puts current_moments.size
 		puts current_moments.first
 		current_moments. each do |moment|
 			puts "we're in the current moment"
	 		client.account.messages.create({:to=>"+1"+"#{moment.phone_number}", :from =>"+15106296985", :body => moment.message})
	 
 		end
  end


end
