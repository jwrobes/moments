require 'tzinfo'

class MomentsController < ApplicationController
  
  def index

  end

  def time
    current_user.time_zone = cookies["jstz_time_zone"]
    current_user.utc_local_midnight = TZInfo::Timezone.get(current_user.time_zone).local_to_utc(Time.parse("00:00")).hour
  	current_user.start_time = params['start_time']
  	current_user.end_time = params['end_time']
  	current_user.save

    users_with_scheduled_moments = User.users_with_moments_today
    
    if current_user.has_no_moments_today?(users_with_scheduled_moments)
      Moment.generate_moments_for_day(current_user)
    end 
  	redirect_to '/'
  
  end
 
end

