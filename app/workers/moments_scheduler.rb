class MomentsScheduler
	include Sidekiq::Worker
	include Sidetiq::Schedulable

recurrence { daily.hour_of_day(7).minute_of_hour(49) }

 def perform
 	puts "Yeah Baby build those moments"
 	users = User.all
 	users.each { |user| Moment.generate_moments_for_day(user) }
 end

end