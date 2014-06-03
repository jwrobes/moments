class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  phony_normalize :phone_number, :default_country_code => 'US'
  # validates :phone_number, presence: true
  validates_plausible_phone :phone_number, :presence => true
 #  validates_plausible_phone :phone, :with => /\A\+\d+/
	# validates_plausible_phone :phone, :without => /\A\+\d+/
	# validates_plausible_phone :phone, :presence => true, :with => /\A\+\d+/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 	has_many :moments  

 	def moments_start_time
 		start_time =  Time.parse("00:00").to_i + self.start_time
  	Time.at(start_time)
 	end

  def moments_window_time
    total_seconds = self.end_time - self.start_time
    moment_window = total_seconds/5
  end

 	def build_moments_for_day
 		moment_times = self.daily_moment_times
    moment_data = {date: Date.today, message: "You need to take a moment", phone_number: self.phone_number}
    moment_times.each do |time|
       moment = Moment.new(moment_data)
       moment.time = time
       moment.save
      self.moments << moment
    end
    puts self.moments
 	end

  def daily_moment_times
    start = self.moments_start_time
    window = self.moments_window_time
    moment_times = []
    (1..5).each do 
      moment_times << (start + rand(1..window)).change(:sec => 0)
      start = start + window
    end
    moment_times
  end
end
