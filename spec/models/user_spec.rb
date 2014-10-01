require 'spec_helper'

describe User do

  context "associations" do
    it { should have_many(:moments )}
  end


  it "has a valid factory" do
      FactoryGirl.build(:user).should be_valid
    end

  context "user is in New York Time Zone" do
  
    it "can return a UTC time of 13 hours for a local start time of 9:00" do
      user = FactoryGirl.build(:user)
      expect(user.local_start_time_in_utc.hour).to eq(13)
    end

    it "can return a UTC time of 14 hours for a local start time of 10:00" do
      user = FactoryGirl.build(:user)
      expect(user.local_end_time_in_utc.hour).to eq(14)
    end

  end

  context " user with start and end time" do

    it "can create a window of time  for moments in seconds" do 
      user = FactoryGirl.build(:user)
      seconds = (60*60)/5
      expect(user.moments_window_time).to eq(seconds)
    end

   it "builds 5 times for moments" do
  		user = FactoryGirl.create(:user, upcased: true)
  		times = user.generate_random_daily_moment_times
  		expect(times.length).to eq 5
  	end

  	# it "the first time is within the first fifth of the day" do
  	# 	user = FactoryGirl.build(:user, with_hours: true)
  	# 	generate_random_daily_moment_times
  	# 	expect(times.first).to be >= user.start_time
  	# 	expect(times.first).to be < Time.zone.parse("13:12")
  	# end

  	#  it "the second time is within the second fifth of the day" do
  	# 	user = FactoryGirl.build(:user)
  	# 	times = user.generate_random_daily_moment_times
  	# 	expect(times[1]).to be >= Time.zone.parse("13:12")
  	# 	expect(times[1]).to be < Time.zone.parse("13:24")
  	# end


  	#  it "the third time is within the third fifth of the day" do
  	# 	user = FactoryGirl.build(:user)
  	# 	times = user.generate_random_daily_moment_times
  	# 	expect(times[2]).to be >= Time.zone.parse("13:24")
  	# 	expect(times[2]).to be < Time.zone.parse("13:36")
  	# end


  	#  it "the fourth time is within the fourth fifth of the day" do
  	# 	user = FactoryGirl.build(:user)
  	# 	times = user.generate_random_daily_moment_times
  	# 	expect(times[3]).to be >= Time.zone.parse("13:36")
  	# 	expect(times[3]).to be < Time.zone.parse("13:48")
  	# end

  	#  it "the fifth time is within the fifth fifth of the day" do
  	# 	user = FactoryGirl.build(:user)
  	# 	times = user.generate_random_daily_moment_times
  	# 	expect(times[4]).to be >= Time.zone.parse("13:48")
  	# 	expect(times[4]).to be < Time.zone.parse("14:00")
  	# end

  	# it "the first time to not be before the first time of the day" do
  	# 	user = FactoryGirl.build(:user)
  	# 	times = user.generate_random_daily_moment_times
  	# 	expect(times.first).not_to be < user.start_time
  	# end

  end

  # context 'should validate start and end time for moments' do

  #   'it should allow start time before end time' do


  #   end

  # end




end