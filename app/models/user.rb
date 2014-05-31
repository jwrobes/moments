class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :moments  


 	# def build_moments
 	# 	hours = self.end_time - self.start_time
 		
 	# 	5.times do 
 	# 		self.moments <<	Moment.new()
 	# 	end

 	# end

end
