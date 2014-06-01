FactoryGirl.define do
	
	factory :user do 
		email {Faker::Internet.email}
		password {"fooobarr"}
		phone_number {Faker::PhoneNumber.phone_number}
		password_confirmation {"fooobarr"}
	end

end