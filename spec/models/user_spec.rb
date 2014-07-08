require 'spec_helper'

describe User do

  context "associations" do
    it { should have_many(:moments )}
  end

  context "can create daily times for user moments" do
  
  	it "has a valid factory" do
  		FactoryGirl.build(:user).should be_valid
  	end

  	# it "returns correct start time" do
  	# 	 user = FactoryGirl.build(:user)
  	# 	expect(user.start_time).to eq (Time.zone.parse("09:00"))
  	# end

  	it "builds 5 times for moments" do
  		user = FactoryGirl.build(:user)
  		times = user.generate_random_daily_moment_times
  		expect(times.length).to eq 5
  	end

  	it "the first time is within the first fifth of the day" do
  		user = FactoryGirl.build(:user)
  		times = user.generate_random_daily_moment_times
  		expect(times.first).to be >= user.start_time
  		expect(times.first).to be < Time.zone.parse("13:12")
  	end

  	 it "the second time is within the second fifth of the day" do
  		user = FactoryGirl.build(:user)
  		times = user.generate_random_daily_moment_times
  		expect(times[1]).to be >= Time.zone.parse("13:12")
  		expect(times[1]).to be < Time.zone.parse("13:24")
  	end


  	 it "the third time is within the third fifth of the day" do
  		user = FactoryGirl.build(:user)
  		times = user.generate_random_daily_moment_times
  		expect(times[2]).to be >= Time.zone.parse("13:24")
  		expect(times[2]).to be < Time.zone.parse("13:36")
  	end


  	 it "the fourth time is within the fourth fifth of the day" do
  		user = FactoryGirl.build(:user)
  		times = user.generate_random_daily_moment_times
  		expect(times[3]).to be >= Time.zone.parse("13:36")
  		expect(times[3]).to be < Time.zone.parse("13:48")
  	end

  	 it "the fifth time is within the fifth fifth of the day" do
  		user = FactoryGirl.build(:user)
  		times = user.generate_random_daily_moment_times
  		expect(times[4]).to be >= Time.zone.parse("13:48")
  		expect(times[4]).to be < Time.zone.parse("14:00")
  	end

  	it "the first time to not be before the first time of the day" do
  		user = FactoryGirl.build(:user)
  		times = user.generate_random_daily_moment_times
  		expect(times.first).not_to be < user.start_time
  	end

  end

end