class MomentsScheduler
	include Sidekiq::Worker
	include Sidetiq::Schedulable
	# include Moments::Checker

recurrence { hourly }

 def perform
 	puts "Yeah Baby build those moments"
 	current_utc_local_midnight = Time.zone.now.hour
 	
 	users_at_midnight_locally = User.where("utc_local_midnight = ?", current_utc_local_midnight)
 	puts users_at_midnight_locally
 	users_at_midnight_locally.each { |user| Moment.generate_moments_for_day(user) }
 end

end