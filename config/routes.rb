Rails.application.routes.draw do
  
  root to: 'moments#index'

  devise_for :users

	post "twilio/voice" =>'twilio#voice'

	post "twilio/send_sms" => "twilio#send_sms"  
end
