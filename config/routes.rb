require 'sidekiq/web'

Rails.application.routes.draw do
  
	root to: 'landing_page#index'

	mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  
  resources :users, only: [:show] do
  	resources :moments
  end	
  
  post "users/time" => 'users#time'

	post "twilio/voice" =>'twilio#voice'

	post "twilio/send_sms" => "twilio#send_sms"  

	

end
