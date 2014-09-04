require 'pry'
require 'tzinfo'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  phony_normalize :phone_number, :default_country_code => 'US'
  # validates :phone_number, presence: true
  validates_plausible_phone :phone_number, :presence => true

  validate :must_have_end_time_with_start_time, :must_have_start_time_with_end_time, :end_time_cannont_be_before_start_time

  
 #  validates_plausible_phone :phone, :with => /\A\+\d+/
	# validates_plausible_phone :phone, :without => /\A\+\d+/
	# validates_plausible_phone :phone, :presence => true, :with => /\A\+\d+/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # attr_accessible :time_zone, :utc_local_midnight
 	has_many :moments  

  def end_time_cannont_be_before_start_time
    if user_times_set?
       if Time.zone.parse(start_time) > Time.zone.parse(end_time)
        errors.add(:end_time, "End Time must be after Start Time")
      end  
    end   
  end

  def user_times_set?
    (start_time != nil && start_time != "") && (end_time != nil && end_time != "")
  end

  def must_have_end_time_with_start_time
    if (start_time != nil && start_time != "") && (end_time == nil || end_time == "")
      # binding.pry
      errors.add(:start_time, "Can't have Start Time without End Time")
    end    
  end

  def must_have_start_time_with_end_time
    if (end_time != nil && end_time != "") && (start_time == nil || start_time == "")
      # binding.pry
      errors.add(:bad_times, "Can't have End Time without Start Time")
    end    
  end

  # def must_have_both_start_and_end_time
  #   if (start_time.length == nil && end_time.length != nil) || (start_time.length != nil && end_time.length == nil)
  #     binding.pry
  #     errors.add(:start_time, "Can't have Start Time without End Time")
  #   end    
  # end


  def moments_window_time(start_time, end_time)
    total_seconds =  end_time - start_time
    moment_window = total_seconds/5
  end

  def generate_random_daily_moment_times
    tc = TimeConversion.new(self)
    utc_start_time = tc.local_start_time_in_utc
    utc_end_time = tc.local_end_time_in_utc
    window = self.moments_window_time(utc_start_time, utc_end_time)
    moment_times = []
    (1..5).each do 
      moment_times << (utc_start_time + rand(1..window)).change(:sec => 0)
      utc_start_time = utc_start_time + window
    end
    moment_times.reject! {|time| time < Time.zone.now }
    moment_times
  end
end
