class LandingPageController < ApplicationController
  
  before_action :check_user

  def index
  end

private

	def check_user
		if current_user
			redirect_to user_path(current_user)
		end
	end
 
end

