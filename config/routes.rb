Rails.application.routes.draw do
  devise_for :users
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :deposits, except: :index
  end

  resources :deposits, only: :index

  root 'pages#home'
  get '/contact' , to: 'pages#contact'
  get '/about' , to: 'pages#about'
  get '/filter' , to: 'pages#filter'

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

end

