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
    Date.parse(TZInfo::Timezone.get(time_zone).now.to_s)
  end

  def set_utc_local_midnight
    if time_zone
      TZInfo::Timezone.get(time_zone).local_to_utc(Time.parse("00:00")).hour
    end 
  end

  def moments_window
    total_seconds_in_day / number_of_moments
  end

  def total_seconds_in_day
    local_end_time_in_utc - local_start_time_in_utc
  end

  def window_start_times
    start_times = [local_start_time_in_utc]
    (number_of_moments - 1).times do
      start_times << start_times.last + moments_window
    end
    start_times
  end

  def generate_random_daily_moment_times
    moment_times = window_start_times.map do |start_time|
      (start_time + random_reminder_time_in_window).change(:sec => 0)
    end
    remove_times_before_current_time(moment_times)
  end

  def random_reminder_time_in_window
    rand(1..moments_window)
  end

  def remove_times_before_current_time(times)
    times.reject {|time| time < Time.zone.now }
  end

  def no_moments_today?
    self.moments.where("date = ?", current_date_for_local_time_zone).count == 0
  end

#  Explore better ways to remove dependency on Moment Model for this method

  def build_missing_moments_for_today
    if moments_on && missing_moments?
      generate_random_daily_moment_times.each do |time|
        self.moments << Moment.create({time: time, date: current_date_for_local_time_zone, message: message, phone_number: phone_number, user_time_zone: time_zone})
       end   
    end
  end

  def missing_moments?
    self.moments.where("date = ?", current_date_for_local_time_zone).count < number_of_moments
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

  def destroy_scheduled_moments_not_yet_sent
    self.moments.where("date = ? AND sent = ?", current_date_for_local_time_zone, false).destroy_all
  end

end
