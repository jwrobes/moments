require 'pry'
require 'tzinfo'

class UsersController < ApplicationController
  
  def index

  end

  def show
  @user = current_user
  end

 def message
    current_user.message = params[:message_body]
    current_user.save
    render json: {message: current_user.message}
  end

  def toggle
    current_user.moments_on = !current_user.moments_on
    if current_user.save
      if (current_user.moments_on && UserQuery.new(current_user).missing_moments?)
        Moment.generate_moments_for_day(current_user)
      else  
        MomentsNotSentQuery.new(current_user).search.destroy_all
      end 
      render json: {moments_on: current_user.moments_on}
     else
      render json: {moments_on: false, errors: current_user.errors.messages}
    end
  end

  def time
    current_user.time_zone = cookies["jstz_time_zone"]
    current_user.utc_local_midnight = TZInfo::Timezone.get(current_user.time_zone).local_to_utc(Time.parse("00:00")).hour
    current_user.start_time = params['start_time']
    current_user.end_time = params['end_time']
      if current_user.save
        if current_user.no_moments_today?
          Moment.generate_moments_for_day(current_user)
        end 
        render json: {success: true, start_time: current_user.start_time, end_time: current_user.end_time}
      else 
        render json: {success: false, errors: current_user.errors.messages, start_time: current_user.start_time, end_time: current_user.end_time }
      end  
  end
 
end
