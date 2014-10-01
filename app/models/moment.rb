require 'tzinfo'

class Moment < ActiveRecord::Base

belongs_to :user

	def self.get_moments_scheduled_for_today
		self.all.includes(:user).select do |moment|
			moment.user.current_date_for_local_time_zone == moment.date
		end
	end

end

