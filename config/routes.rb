Rails.application.routes.draw do
  resources :messages
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'messages#index'
  resources :charges, only: [:new, :create]
  resources :welcome
  resources :phone_numbers, only: [:new, :create]
	post 'phone_numbers/verify' => "phone_numbers#verify"
end
