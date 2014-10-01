require 'tzinfo'

class Moment < ActiveRecord::Base

belongs_to :user

	def self.get_moments_scheduled_for_today
		self.all.includes(:user).select do |moment|
			moment.user.current_date_for_local_time_zone == moment.date
		end
	end

	def self.get_to_send
		moments_to_send = Moment.where("time <= ? AND sent = ?", Time.zone.now.change(:sec => 0), false)
		moments_to_send.uniq! {|moment| moment.user_id}
	end	

end

