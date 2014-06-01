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
 		start_time =  Time.parse("00:00").to_i + rand(start_time..end_time)
  	puts Time.at(first_time)
 	end

 	def build__moments
 		hours = self.end_time - self.start_time
 		
 		5.times do 
 			self.moments <<	Moment.new()
 		end

 	end

end
