require 'tzinfo'

class UsersController < ApplicationController
  
  def index

  end

  def show
    @user = current_user
  end


  def toggle
    puts "current user starts at #{current_user}"
    current_user.moments_on = !current_user.moments_on
    puts "current user is receiving moments: #{current_user.moments_on}"
    current_user.save
    if (current_user.moments_on && current_user.missing_moments_today?)
      puts "making moments for user from toggle"
      Moment.generate_moments_for_day(current_user)
    else  
      puts "destroying all unsent momvents"
      current_user.today_moments_not_sent.destroy_all
    end 
    render json: {moments_on: current_user.moments_on}
  end

  def time
    current_user.time_zone = cookies["jstz_time_zone"]
    current_user.utc_local_midnight = TZInfo::Timezone.get(current_user.time_zone).local_to_utc(Time.parse("00:00")).hour
    current_user.start_time = params['start_time']
    current_user.end_time = params['end_time']
      if current_user.save
        puts "in the save ajax"
        users_with_scheduled_moments = User.users_with_moments_today
        if current_user.has_no_moments_today?(users_with_scheduled_moments)
          Moment.generate_moments_for_day(current_user)
        end 
        render json: {start_time: current_user.start_time, end_time: current_user.end_time}.to_json
      else 
        render json: "Error".to_json
      end  
  end
 
end