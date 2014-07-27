require 'tzinfo'

class Moment < ActiveRecord::Base

belongs_to :user

	def self.generate_moments_for_day(user)
		daily_moment_times = user.generate_random_daily_moment_times
		daily_moment_times.each do |time|
			local_time = TZInfo::Timezone.get(user.time_zone).utc_to_local(time)
			formatted_local_time = local_time.strftime("%l:%M %p")
			moment = self.new({date: Date.today, message: "Hey there #{user.email} take a moment now at #{formatted_local_time} for today's date: #{Date.today}", phone_number: user.phone_number, time: time})
			moment.save
			puts "building another moment"
			puts moment
			puts "****************"
			user.moments << moment
		end
	end

end

