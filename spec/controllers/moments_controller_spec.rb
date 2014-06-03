require 'spec_helper'
	
	describe MomentsController do

		let(:user) { FactoryGirl.create :user}
    before(:each) do
      ApplicationController.any_instance.stub(:current_user).and_return(user)
    end

		context "#time" do
		
			it "should update time for user" do
				expect {
					post :time,  {start_time: user.start_time, end_time: user.end_time}
				}
			end
		end
	end
end