require 'tzinfo'
class TimeConversion

	def initialize(user)
		@user = user
		@tz = TZInfo::Timezone.get(user.time_zone)
	end

	def local_date_now
		Date.parse(TZInfo::Timezone.get(@user.time_zone).now.to_s)
	end

	def local_start_time_in_utc
		Time.zone = @user.time_zone
		@tz.local_to_utc(Time.zone.parse(@user.start_time))
	end

	def local_end_time_in_utc
		Time.zone = @user.time_zone
		@tz.local_to_utc(Time.zone.parse(@user.end_time))
	end


end