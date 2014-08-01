
class UsersMomentsQuery

  def self.missing_moments_today
    moments_today = Moment.all.includes(:user).select do |moment|
      if moment.user 
        tc = TimeConversion.new(moment.user)
    	   tc.local_date_now == moment.date
      end	
    end
    self.with_moments_on - moments_today.map { |moment| moment.user }.uniq
  end

  def self.with_moments_on
  	User.where("moments_on = ?", true)
  end

end