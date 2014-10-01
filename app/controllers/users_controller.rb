require 'pry'
require 'tzinfo'

class UsersController < ApplicationController
  
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
      current_user.moments_on ? current_user.build_missing_moments_for_today : current_user.destroy_scheduled_moments_not_yet_sent
      render json: {moments_on: current_user.moments_on}
    else
      render json: {moments_on: false, errors: current_user.errors.messages}
    end
  end

  def time
    update_user_params = {time_zone: cookies["jstz_time_zone"], start_time: params['start_time'], end_time: params['end_time']}
    current_user.update_attributes(update_user_params)
    current_user.utc_local_midnight = current_user.set_utc_local_midnight
    if current_user.save
      current_user.build_missing_moments_for_today
      render json: {success: true, start_time: current_user.start_time, end_time: current_user.end_time}
    else 
      render json: {success: false, errors: current_user.errors.messages, start_time: current_user.start_time, end_time: current_user.end_time }
    end  
  end
 
end
