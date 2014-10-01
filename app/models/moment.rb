require 'tzinfo'

class Moment < ActiveRecord::Base

belongs_to :user

	def self.generate_moments_for_day(user)
		daily_moment_times = user.generate_random_daily_moment_times
		puts daily_moment_times
		daily_moment_times.each do |time|
			local_time = TZInfo::Timezone.get(user.time_zone).utc_to_local(time)
			formatted_local_time = local_time.strftime("%l:%M %p")
			local_date = Date.parse(TZInfo::Timezone.get(user.time_zone).now.to_s)
			moment_message = user.message + "\nTime: #{formatted_local_time} Today's date: #{Date.today}"
			moment = self.new({date: local_date, message: moment_message, phone_number: user.phone_number, time: time, user_time_zone: user.time_zone})
			moment.save
			user.moments << moment
		end
	end

	def self.get_moments_scheduled_for_today
		self.all.includes(:user).select do |moment|
			moment.user.current_date_for_local_time_zone == moment.date
		end
	end

end

