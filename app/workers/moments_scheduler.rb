class MomentsScheduler
	include Sidekiq::Worker
	include Sidetiq::Schedulable


recurrence {hourly }

 def perform
 	puts "Yeah Baby build those moments"
 	current_utc_local_midnight = Time.zone.now.hour
 	users_at_midnight_locally = User.find_by_utc_local_midnight(current_utc_local_midnight)
 	users_at_midnight_locally.each { |user| Moment.generate_moments_for_day(user) }
 end

end