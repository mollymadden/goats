Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :charges
  resources :listings

  root 'pages#home'
  get '/my_deposits' , to: 'pages#my_deposits'
  get '/contact' , to: 'pages#contact'
  get '/about' , to: 'pages#about'

end
