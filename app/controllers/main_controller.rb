class MainController < ApplicationController
  def index

  end

  def time
    p params
  	# start_of_day = Time.zone.parse("00:00")
  	# start_time = Time.zone.parse(params["start_time"]) - start_of_day 
  	# end_time = Time.zone.parse(params["end_time"]) - start_of_day
  	current_user.start_time = params[start_time]
  	current_user.end_time = params[end_time]
  	current_user.save
  	redirect_to '/'

  end
 
end

