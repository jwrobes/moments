class TextsWorker
	inlcude Sidekiq::TextsWorker

 def perform(moment_id)
  	moment = Moment.find(moment_id)
  	number = moment.user.number
  	account_sid = "AC90d2dcc4e6f5a0b4cf58dbb6008bbdc4"
		auth_token = "a58cd6e9e716fa2446636f6a8b4087db"
 		
 		@client = Twilio::REST::Client.new account_sid, auth_token

 		@message = @client.account.messages.create({:to=>"+1"+"#{number}", :from =>"+15106296985", :body => "#{moment.message}" })
  end

end