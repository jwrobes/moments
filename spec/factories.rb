FactoryGirl.define do
	
	factory :user do 
		email {Faker::Internet.email}
		password {"fooobarr"}
		phone_number { "5103015114"}
		password_confirmation {"fooobarr"}
	end

end