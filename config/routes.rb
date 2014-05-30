Rails.application.routes.draw do
  
  root to: 'moments#index'

  devise_for :users

	post "twilio/voice" =>'twilio#voice'  
end
