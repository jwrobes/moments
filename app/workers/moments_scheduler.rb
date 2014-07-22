class MomentsScheduler

@queue = :moments_scheduler

 def self.perform
 	current_utc_local_midnight = Time.zone.now.hour
 	users_at_or_after_midnight_locally = User.where("utc_local_midnight <= ?", current_utc_local_midnight)
 	users_with_moments_today = User.users_with_moments_today
 	users_missing_moments = users_at_or_after_midnight_locally - users_with_moments_today
 	users_missing_moments.each do |user| 
 		Moment.generate_moments_for_day(user) 
 		end
 end

end