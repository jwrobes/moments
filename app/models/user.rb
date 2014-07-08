class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  phony_normalize :phone_number, :default_country_code => 'US'
  validates_plausible_phone :phone_number, :presence => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 	has_many :moments  

<<<<<<< HEAD

 	def moments_start_time
 		start_time =  Time.parse("00:00").to_i + self.start_time
  	Time.at(start_time)
 	end
=======
>>>>>>> master


<<<<<<< HEAD
  def generate_random_daily_moment_times
=======
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

  private
  
  def daily_moment_times
>>>>>>> master
    start = self.moments_start_time
    window = self.moments_window_time
    moment_times = []
    (1..5).each do 
      moment_times << (start + rand(1..window)).change(:sec => 0)
      start = start + window
    end
    moment_times
  end

  def moments_start_time
    start_time =  Time.parse("00:00").to_i + self.start_time
    Time.at(start_time)
  end

  def moments_window_time
    total_seconds = self.end_time - self.start_time
    moment_window = total_seconds/5
  end

end
