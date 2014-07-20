class BackupMomentsScheduler
	include Sidekiq::Worker
	include Sidetiq::Schedulable
	# include Moments::Checker

recurrence { hourly.minute_of_hour(20, 30, 40, 50)  }

 def perform
 	puts "Yeah Baby check for those moments"
 	current_utc_local_midnight = Time.zone.now.hour
 	users_at_or_after_midnight_locally = User.where("utc_local_midnight >= ?", current_utc_local_midnight)
 	users_with_moments_today = User.users_with_moments_today
 	users_missing_moments = users_at_or_after_midnight_locally - users_with_moments_today
 	users_missing_moments.each do |user| 
 		puts "build the moment for #{user.email}"
 		Moment.generate_moments_for_day(user) 
 		end
 end

end