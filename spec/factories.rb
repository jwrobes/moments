FactoryGirl.define do
	
	factory :user do
	  ignore do
	    upcased  false
	  end

		email {Faker::Internet.email}
		password {"fooobarr"}
		phone_number { "5103015114"}
		password_confirmation {"fooobarr"}
		time_zone {"America/New_York"}
		utc_local_midnight {4}
		moments_on false
		start_time "09:00"
		end_time "10:00"
	
		after(:create) do |user, evaluator|
			if evaluator.upcased
				user.start_time = "09:00"
				user.end_time = "10:00"
			end
		end
	end

end