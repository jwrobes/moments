require 'tzinfo'
class UserQuery

	def initialize(user)
		@user = user
		@tc = TimeConversion.new(@user)
	end

	def missing_moments?
		@user.moments.where("date = ?", @tc.local_date_now).count < 5
	end

	def no_moments_today?
			@user.moments.where("date = ?", @tc.local_date_now).count == 0
	end

end
