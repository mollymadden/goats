Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :deposits
  resources :listings

  root 'pages#home'
  get '/deposits' , to: 'pages#deposits'
  get '/contact' , to: 'pages#contact'
  get '/about' , to: 'pages#about'

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

end
