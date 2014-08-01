class MomentsNotSentQuery

	def initialize(user)
		@user = user
		@tc = TimeConversion.new(user)
	end

	def search 
		@user.moments.where("date = ? AND sent = ?", @tc.local_date_now, false)
	end	

end