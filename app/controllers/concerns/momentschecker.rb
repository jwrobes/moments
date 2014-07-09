module MomentsChecker
	extend ActiveSupport::Concern

	module Test

		def no_daily_moments_or_user(user)
  		Moment.where("user_id = ?", current_user.id).length == 0
  	end

		def current_utc_local_midnight 
			Time.zone.now.hour > current.user_utc_local_midnight
		end

	end

end