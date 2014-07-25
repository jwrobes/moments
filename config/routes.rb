Rails.application.routes.draw do
  	
  mount ResqueWeb::Engine => "/resque_web"

  ResqueWeb::Engine.eager_load!

	root to: 'landing_page#index'

  devise_for :users
  
  resources :users, only: [:show] do
  	resources :moments
  end	
  
  post "users/time" => 'users#time'

  put 'users/toggle' => 'users#toggle'

	post "twilio/voice" =>'twilio#voice'

	post "twilio/send_sms" => "twilio#send_sms"  

end
