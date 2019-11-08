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

  get "/deposits/confirmation", to: "deposits#confirmation"
  post "/deposits/", to: "deposits#create"

  get "/deposits/success", to: "deposits#success"

  get "/deposits/", to: "deposits#index"

  get "*path", to: "pages#not_found", constraints: lambda { |req|
  req.path.exclude? 'rails/active_storage'
}
  
end

