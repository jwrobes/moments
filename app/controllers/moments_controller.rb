class MomentsController < ApplicationController
  def index

  end

  def time
  	start_of_day = Time.parse("00:00")
  	start_time = Time.parse(params["start_time"]) - start_of_day 
  	end_time = Time.pa
  	current_user.start_time = start_time
  	current_user.end_time = end_time
  	current_user.save
  	first_time =  Time.parse("00:00").to_i + rand(start_time..end_time)
  	puts Time.at(first_time)
  	redirect_to '/'

  end
 
end

