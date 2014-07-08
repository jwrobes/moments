require 'tzinfo'

class MomentsController < ApplicationController
  def index

  end

  def time
    p params
  	# start_of_day = Time.zone.parse("00:00")
  	# start_time = Time.zone.parse(params["start_time"]) - start_of_day 
  	# end_time = Time.zone.parse(params["end_time"]) - start_of_day

    current_user.time_zone = cookies["jstz_time_zone"]
    current_user.utc_local_midnight = TZInfo::Timezone.get(current_user.time_zone).local_to_utc(Time.parse("00:00")).hour
  	current_user.start_time = params['start_time']
  	current_user.end_time = params['end_time']
  	current_user.save
  	redirect_to '/'
  end
 
end

