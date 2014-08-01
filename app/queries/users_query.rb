class UsersQuery
	def initialize(relation = User.where("utc_local_midnight <= ?", Time.zone.now.hour))
		@relation = relation.extending(Scopes)
	end

	def search
		@relation
	end	

	module Scopes
		def with_unscheduled_moments	
			where.not(id: @relation.joins(:moments).group("users.id").having("max(date) = ?", Date.today).pluck(:id))
		end		

	end
end
