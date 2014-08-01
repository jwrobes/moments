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
    puts "current user starts at #{current_user}"
    current_user.moments_on = !current_user.moments_on
    puts "current user is receiving moments: #{current_user.moments_on}"
    current_user.save
    if (current_user.moments_on && UserQuery.new(current_user).missing_moments?)
      puts "making moments for user from toggle"
      Moment.generate_moments_for_day(current_user)
    else  
      puts "destroying all unsent momvents"
      MomentsNotSentQuery.new(current_user).search.destroy_all
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
        if UserQuery.new(current_user).no_moments_today?
          Moment.generate_moments_for_day(current_user)
        end 
        render json: {start_time: current_user.start_time, end_time: current_user.end_time}.to_json
      else 
        render json: "Error".to_json
      end  
  end
 
end
