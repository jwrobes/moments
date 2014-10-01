Rails.application.routes.draw do
  	
  mount ResqueWeb::Engine => "/resque_web"

  ResqueWeb::Engine.eager_load!

	root to: 'landing_page#index'

  devise_for :users, :controllers => { :sessions => 'sessions', :registrations => 'registrations' }
  
  resources :users, only: [:show] do
  	resources :moments
  end	
  
  post "users/time" => 'users#time'

  post "users/message" => 'users#message'

  put 'users/toggle' => 'users#toggle'

end
