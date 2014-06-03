class MomentsController < ApplicationController
  def index

  end

  def time
    p params
  	start_of_day = Time.parse("00:00")
  	start_time = Time.parse(params["start_time"]) - start_of_day 
  	 end_time = Time.parse(params["end_time"]) - start_of_day
  	current_user.start_time = start_time
  	current_user.end_time = end_time
  	current_user.save
  	redirect_to '/'

  end
 
end

