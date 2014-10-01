require 'pry'
class MomentsScheduler

@queue = :moments_scheduler

	def self.perform
		users_missing_moments = User.missing_scheduled_moments_today
		users_missing_moments.each do |user| 
			user.build_missing_moments_for_today
		end
	end

end