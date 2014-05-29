Rails.application.routes.draw do
  
  root to: 'moments#index'

  devise_for :users
  
end
