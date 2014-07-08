# require 'spec_helper'

# Sidekiq::Testing.inline! do

# end

# describe MomentsScheduler do
# 	let!(:user) {FactoryGirl.create :user}
# 	let(:worker) {MomentsScheduler.new}

# 	it "should create 5 new moments" do
# 		worker.perform
# 		expect(Moment.count).to eq(5)
# 	end

# end