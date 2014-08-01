require 'tzinfo'

class Moment < ActiveRecord::Base

belongs_to :user

	def self.generate_moments_for_day(user)
		daily_moment_times = user.generate_random_daily_moment_times
		puts daily_moment_times
		daily_moment_times.each do |time|
			local_time = TZInfo::Timezone.get(user.time_zone).utc_to_local(time)
			formatted_local_time = local_time.strftime("%l:%M %p")
			# local_date = TDate.parse(TZInfo::Timezone.get(user.time_zone).now.to_s)
			local_date = Date.parse(TZInfo::Timezone.get(user.time_zone).now.to_s)
			moment_message = user.message + "\nTime: #{formatted_local_time} Today's date: #{Date.today}"
			puts "Time is now: #{time}"
			moment = self.new({date: local_date, message: moment_message, phone_number: user.phone_number, time: time, user_time_zone: user.time_zone})
			moment.save
			puts "building another moment"
			puts moment
			puts "****************"
			user.moments << moment
		end
	end

end

