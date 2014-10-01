require 'pry'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#   after_filter :add_flash_to_header
 
# def add_flash_to_header
#   # only run this in case it's an Ajax request.
#   return unless request.xhr?
#   # add different flashes to header
#   response.headers['X-Flash-Error'] = flash[:error] unless flash[:error].blank?
#   response.headers['X-Flash-Warning'] = flash[:warning] unless flash[:warning].blank?
#   response.headers['X-Flash-Notice'] = flash[:notice] unless flash[:notice].blank?
#   response.headers['X-Flash-Message'] = flash[:message] unless flash[:message].blank?

#   # make sure flash does not appear on the next page
#   flash.discard
# end

# after_filter :prepare_unobtrusive_flash


#   # Allows redirecting for AJAX calls as well as normal calls
#   def redirect_to(options = {}, response_status = {})
#     if request.xhr?
#       render(:update) {|page| page.redirect_to(options)}
#     else
#       super(options, response_status)
#     end
#   end

# end


def after_sign_in_path_for(resource)
	user_path(current_user)
end

before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :start_time, :end_time, :email, :password, :password_confirmation, :phone_number, :time_zone, :utc_local_midnight, :num_moments)
    end
  end

end
