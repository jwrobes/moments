require 'sidekiq/web'

Rails.application.routes.draw do
  
	mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  resources :moments

  post "moments/time" => 'moments#time'

	post "twilio/voice" =>'twilio#voice'

	post "twilio/send_sms" => "twilio#send_sms"  

	root to: 'main#index'

end
