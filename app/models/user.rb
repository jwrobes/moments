require 'pry'
require 'tzinfo'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  phony_normalize :phone_number, :default_country_code => 'US'
  # validates :phone_number, presence: true
  validates_plausible_phone :phone_number, :presence => true

  validate :must_have_end_time_with_start_time, :must_have_start_time_with_end_time, :end_time_cannont_be_before_start_time, :must_have_times_for_moments_on

 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
      errors.add(:start_time, "Can't have Start Time without End Time")
    end    
  end

  def must_have_start_time_with_end_time
    if (end_time != nil && end_time != "") && (start_time == nil || start_time == "")
      errors.add(:bad_times, "Can't have End Time without Start Time")
    end    
  end

  def must_have_times_for_moments_on
    if moments_on && user_times_set? == false
      errors.add(:moments_on, "Can't turn Moments On without Start and End Time")
    end
  end

  def local_start_time_in_utc
    Time.zone = time_zone
    TZInfo::Timezone.get(time_zone).local_to_utc(Time.zone.parse(start_time))
  end

  def local_end_time_in_utc
    Time.zone = self.time_zone
    TZInfo::Timezone.get(self.time_zone).local_to_utc(Time.zone.parse(self.end_time))
  end

  def current_date_for_local_time_zone
    Date.parse(TZInfo::Timezone.get(self.time_zone).now.to_s)
  end

  def moments_window_time
    total_seconds =  local_end_time_in_utc - local_start_time_in_utc
    moment_window = total_seconds/number_of_moments
  end

  def generate_random_daily_moment_times
    moments_start_time = local_start_time_in_utc
    window = moments_window_time
    moment_times = []
    number_of_moments.times do 
      moment_times << (moments_start_time + rand(1..window)).change(:sec => 0)
      moments_start_time += window
    end
    remove_times_before_current_time(moment_times)
  end

  def remove_times_before_current_time(times)
    times.reject {|time| time < Time.zone.now }
  end

  def no_moments_today?
    self.moments.where("date = ?", current_date_for_local_time_zone).count == 0
  end

  def missing_moments?
    self.moments.where("date = ?", current_date_for_local_time_zone).count < 5
  end

  def self.with_moments_on
    self.where("moments_on = ? AND start_time != ? AND time_zone != ?", true, nil, nil)
  end

  def self.missing_scheduled_moments_today
    self.with_moments_on - self.users_with_moments_scheduled_today
  end

  def self.users_with_moments_scheduled_today
    Moment.get_moments_scheduled_for_today.map { |moment| moment.user}.uniq
  end

end
