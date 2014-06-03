class MomentsScheduler
	include Sidekiq::Worker
	include Sidetiq::Schedulable


recurrence { daily.hour_of_day(7).minute_of_hour(49) }

 def perform
 	puts "Yeah Baby build those moments"
 	users = User.all
 	users.each do |user| 
 		user.build_moments_for_day
 	end
 end

end