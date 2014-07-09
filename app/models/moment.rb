class Moment < ActiveRecord::Base

belongs_to :user

	def self.generate_moments_for_day(user)
		daily_moment_times = user.generate_random_daily_moment_times
		daily_moment_times.each do |time|
			moment = self.new({date: Date.today, message: "take a moment", phone_number: user.phone_number, time: time})
			moment.save
			user.moments << moment
		end
	end

end
